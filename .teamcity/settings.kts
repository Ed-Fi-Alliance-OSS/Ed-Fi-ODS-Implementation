import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.FileContentReplacer
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.commitStatusPublisher
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.freeDiskSpace
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.replaceContent
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.nuGetPublish
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.powerShell
import jetbrains.buildServer.configs.kotlin.v2019_2.failureConditions.BuildFailureOnMetric
import jetbrains.buildServer.configs.kotlin.v2019_2.failureConditions.failOnMetricChange
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.VcsTrigger
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.vcs
import jetbrains.buildServer.configs.kotlin.v2019_2.vcs.GitVcsRoot

/*
The settings script is an entry point for defining a TeamCity
project hierarchy. The script should contain a single call to the
project() function with a Project instance or an init function as
an argument.

VcsRoots, BuildTypes, Templates, and subprojects can be
registered inside the project using the vcsRoot(), buildType(),
template(), and subProject() methods respectively.

To debug settings scripts in command-line, run the

    mvnDebug org.jetbrains.teamcity:teamcity-configs-maven-plugin:generate

command and attach your debugger to the port 8000.

To debug in IntelliJ Idea, open the 'Maven Projects' tool window (View
-> Tool Windows -> Maven Projects), find the generate task node
(Plugins -> teamcity-configs -> teamcity-configs:generate), the
'Debug' option is available in the context menu for the task.
*/

version = "2019.2"

project {
    description = "Projects Owned by the ODS Platform Team"

    vcsRoot(EdFiExtensions)
    vcsRoot(OdsApi_PackagesNetCore31_EdFiMigrationUtility)
    vcsRoot(EdFiDatabases)
    vcsRoot(EdFiTpdmExtension)
    vcsRoot(EdFiOds)
    vcsRoot(EdFiOdsImplementation)
    vcsRoot(Packages_EdFiStandard)
    vcsRoot(TeamCityConfigsOdsImplementation)

    template(OdsApiDeployToStagingTemplate)
    template(OdsApiInitDevUnitTestPackageTemplate)
    template(OdsApi_OdsApiSmokeTestStagingTemplate)

    params {
        param("github.organization", "Ed-Fi-Alliance-OSS")
        param("msbuild.buildConfiguration", "release")
        param("env.msbuild_exe", "%msbuild.exe%")
        param("version.prerelease.prefix", "dev")
        param("git.repo.ods", "Ed-Fi-ODS")
        param("version.prerelease.suffix", "%build.counter%")
        param("version.informational", "%version%")
        param("version.suite", "3")
        param("odsapi.package.suffix", ".Suite%version.suite%")
        param("version.core", "%version.major%.%version.minor%.%version.patch%")
        param("git.repo.implementation", "Ed-Fi-ODS-Implementation")
        param("git.branch.default", "main")
        param("env.msbuild_buildConfiguration", "%msbuild.buildConfiguration%")
        param("git.branch.specification", """
            refs/heads/(*)
            refs/tags/(*)
        """.trimIndent())
        param("msbuild.exe", """%MSBuildTools16.0_x64_Path%\MSBuild.exe""")
        param("github.organization.teamCity", "Ed-Fi-Alliance")
        param("build.feature.freeDiskSpace", "8gb")
        param("version", "%version.core%-%version.prerelease%")
        param("odsapi.package.suitenumber", "EdFi%odsapi.package.suffix%")
        param("git.branch.release", "master")
        param("node.version", "12.4.0")
        param("version.prerelease", "%version.prerelease.prefix%%version.prerelease.suffix%")
        param("version.patch", "0")
        param("version.major", "1")
        param("version.minor", "0")
    }

    cleanup {
        baseRule {
            artifacts(builds = 2, artifactPatterns = "+:**/*")
        }
    }
}

object OdsApiDeployToStagingTemplate : Template({
    name = "ODS/API: Deploy to Staging Template"

    maxRunningBuilds = 1

    params {
        param("octopus.release.version", "%version%")
        param("octopus.release.channel", "v%version.core%")
        param("octopus.deploy.timeout", "00:45:00")
        param("octopus.deploy.arguments", "--deploymenttimeout=%octopus.deploy.timeout% --packageversion=%version%")
        param("octopus.nuget.feed", "%octopus.server%/nuget/packages")
        param("octopus.deploy.environment", "Staging")
        param("nuget.packages", "NugetPackages")
        param("octopus.release.project", "Ed-Fi-ODS")
        param("octopus.project.id", "Projects-7")
    }

    vcs {
        checkoutMode = CheckoutMode.ON_SERVER
        showDependenciesChanges = true
    }

    steps {
        powerShell {
            name = "New-OctopusChannel"
            id = "RUNNER_405"
            formatStderrAsError = true
            scriptMode = script {
                content = """
                    ${'$'}ErrorActionPreference = 'Stop'
                    
                    Import-Module "%teamcity.build.checkoutDir%\%script.build.management%"
                    
                    ${'$'}params = @{
                        octopusServer = "%octopus.server%"
                        octopusApiKey = "%octopus.apiKey%"
                        octopusProjectId = "%octopus.project.id%"
                        packageVersion = "%version%"
                        prereleaseSuffix = ""
                    }
                    New-OctopusChannel @params
                """.trimIndent()
            }
        }
        nuGetPublish {
            name = "Force Publishing NuGet Packages to Octopus Feed"
            id = "RUNNER_124"
            toolPath = "%teamcity.tool.NuGet.CommandLine.DEFAULT%"
            packages = """%nuget.packages%\*.%version%.nupkg"""
            serverUrl = "%octopus.nuget.feed%"
            apiKey = "credentialsJSON:08e54329-a208-497e-a2b5-f4f1541370bd"
        }
        step {
            name = "Create Octopus Release and Deploy It to Staging"
            id = "RUNNER_125"
            type = "octopus.create.release"
            param("octopus_additionalcommandlinearguments", "%octopus.deploy.arguments%")
            param("octopus_waitfordeployments", "true")
            param("octopus_channel_name", "%octopus.release.channel%")
            param("octopus_version", "3.0+")
            param("octopus_host", "%octopus.server%")
            param("octopus_project_name", "%octopus.release.project%")
            param("octopus_deployto", "%octopus.deploy.environment%")
            param("secure:octopus_apikey", "credentialsJSON:08e54329-a208-497e-a2b5-f4f1541370bd")
            param("octopus_releasenumber", "%octopus.release.version%")
        }
    }

    dependencies {
        artifacts(RelativeId("OdsApi_OdsApiInitDevUnitTestPackage")) {
            id = "ARTIFACT_DEPENDENCY_13"
            cleanDestination = true
            artifactRules = """
                *.nupkg => %nuget.packages%
                %odsapi.package.databases%.*.nupkg!** => .
            """.trimIndent()
        }
    }
})

object OdsApiInitDevUnitTestPackageTemplate : Template({
    name = "ODS/API: InitDev, Unit Test, Package Template"

    buildNumberPattern = "%version%"

    params {
        param("odsapi.build.package.sandboxAdmin.id", "EdFi%odsapi.package.suffix%.Ods.SandboxAdmin")
        checkbox("odsapi.build.usePlugins", "true",
                  checked = "true", unchecked = "false")
        param("odsapi.build.runPester", "")
        param("odsapi.build.package.webApi.version", "%version%")
        param("odsapi.build.package.databases.version", "%version%")
        param("odsapi.build.package.sandboxAdmin.version", "%version%")
        param("odsapi.build.package.swaggerUI.version", "%version%")
        param("odsapi.build.runPostman", "")
        param("odsapi.build.noRebuild", "")
        param("odsapi.build.script", """Ed-Fi-ODS-Implementation\build.teamcity.ps1""")
        param("odsapi.package.smokeTest", "EdFi%odsapi.package.suffix%.SmokeTest.Console")
        param("odsapi.build.package.databases.id", "EdFi%odsapi.package.suffix%.RestApi.Databases")
        param("odsapi.build.runSmokeTest", "")
        param("odsapi.package.sdk", "EdFi%odsapi.package.suffix%.OdsApi.Sdk")
        param("odsapi.build.package.webApi.id", "EdFi%odsapi.package.suffix%.Ods.WebApi")
        param("odsapi.build.runDotnetTest", "")
        param("odsapi.build.package.swaggerUI.id", "EdFi%odsapi.package.suffix%.Ods.SwaggerUI")
        param("odsapi.build.noDeploy", "")
        param("odsapi.build.engine", "")
        param("odsapi.build.installType", "")
        param("odsapi.build.noCodeGen", "")
        param("odsapi.build.odsTokens", "")
    }

    vcs {
        root(EdFiOdsImplementation, "=> Ed-Fi-ODS-Implementation")
        root(EdFiOds, "=> Ed-Fi-ODS")

        cleanCheckout = true
    }

    steps {
        powerShell {
            name = "build.teamcity.ps1"
            id = "RUNNER_355"
            formatStderrAsError = true
            scriptMode = script {
                content = """
                    ${'$'}ErrorActionPreference = 'Stop'
                    & %odsapi.build.script%
                """.trimIndent()
            }
        }
    }

    triggers {
        vcs {
            id = "vcsTrigger"
            quietPeriodMode = VcsTrigger.QuietPeriodMode.USE_CUSTOM
            quietPeriod = 120
            triggerRules = "+:**"
            branchFilter = """
                +:*
                -:*-v2
            """.trimIndent()
        }
    }

    failureConditions {
        failOnMetricChange {
            id = "BUILD_EXT_69"
            metric = BuildFailureOnMetric.MetricType.TEST_FAILED_COUNT
            threshold = 0
            units = BuildFailureOnMetric.MetricUnit.DEFAULT_UNIT
            comparison = BuildFailureOnMetric.MetricComparison.MORE
            compareTo = value()
        }
    }

    features {
        freeDiskSpace {
            id = "jetbrains.agent.free.space"
            requiredSpace = "%build.feature.freeDiskSpace%"
            failBuild = true
        }
        commitStatusPublisher {
            id = "BUILD_EXT_45"
            publisher = github {
                githubUrl = "https://api.github.com"
                authType = personalToken {
                    token = "credentialsJSON:581aea0c-1320-4500-b82e-7cecbf4251be"
                }
            }
        }
        replaceContent {
            id = "BUILD_EXT_51"
            fileRules = "**/Directory.Build.props"
            pattern = """(<(AssemblyVersion)\s*>).*(<\/\s*\2\s*>)"""
            replacement = "${'$'}1%version.core%.%build.counter%${'$'}3"
        }
        replaceContent {
            id = "BUILD_EXT_52"
            fileRules = "**/Directory.Build.props"
            pattern = """(<(FileVersion)\s*>).*(<\/\s*\2\s*>)"""
            replacement = "${'$'}1%version.core%.%build.counter%${'$'}3"
            encoding = FileContentReplacer.FileEncoding.UTF_8
            customEncodingName = "UTF-8"
        }
        replaceContent {
            id = "BUILD_EXT_53"
            fileRules = "**/Directory.Build.props"
            pattern = """(<(InformationalVersion)\s*>).*(<\/\s*\2\s*>)"""
            replacement = "${'$'}1%version.informational%${'$'}3"
            encoding = FileContentReplacer.FileEncoding.UTF_8
            customEncodingName = "UTF-8"
        }
        replaceContent {
            id = "BUILD_EXT_60"
            fileRules = "**/*.nuspec"
            pattern = """(?<=<id>)(.*?)(EdFi)(?=\b.*</id>)"""
            caseSensitivePattern = false
            replacement = "%odsapi.package.suitenumber%"
            encoding = FileContentReplacer.FileEncoding.UTF_8
            customEncodingName = "UTF-8"
        }
        feature {
            id = "BUILD_EXT_68"
            type = "xml-report-plugin"
            param("xmlReportParsing.reportType", "trx")
            param("xmlReportParsing.reportDirs", "**/reports/*.*")
        }
    }

    dependencies {
        artifacts(RelativeId("OdsApi_Packages_EdFiOdsApiSdk")) {
            id = "ARTIFACT_DEPENDENCY_41"
            buildRule = lastSuccessful()
            cleanDestination = true
            artifactRules = "%odsapi.package.sdk%.*.nupkg!** => %odsapi.package.sdk%"
        }
        artifacts(RelativeId("OdsImplementationKotlin_EdFiLoadTools_BranchBuild")) {
            id = "ARTIFACT_DEPENDENCY_39"
            buildRule = lastSuccessful()
            cleanDestination = true
            artifactRules = "%odsapi.package.smokeTest%.*.nupkg!** => %odsapi.package.smokeTest%"
        }
    }
})

object OdsApi_OdsApiSmokeTestStagingTemplate : Template({
    name = "ODS/API: Smoke Test Staging Template"

    maxRunningBuilds = 1

    params {
        param("environment.staging.metadataUrl", "https://api-stage.ed-fi.org/%octopus.release.channel%/api/metadata")
        param("script.module.loadtools", """Ed-Fi-ODS-Implementation\logistics\scripts\modules\loadtools.psm1""")
        param("script.run.smoketests", """Ed-Fi-ODS-Implementation\logistics\scripts\run-smoke-tests.ps1""")
    }

    vcs {
        cleanCheckout = true
        showDependenciesChanges = true
    }

    steps {
        powerShell {
            name = "Invoke-SmokeTest"
            id = "RUNNER_406"
            formatStderrAsError = true
            scriptMode = script {
                content = """
                    Import-Module -Force "%teamcity.build.checkoutDir%\%script.module.loadtools%"
                    
                    ${'$'}params = @{
                        apiUrlBase = "https://api-stage.ed-fi.org/%octopus.release.channel%/api/"
                        apiKey = "smoke"
                        apiSecret = "smokeSecret"
                        apiNamespaceUri = "http://edfi.org"
                        smokeTestDll = ".\%odsapi.package.sdk%\lib\netstandard1.3\%odsapi.dllname.sdk%.dll"
                        smokeTestExecutable = ".\%odsapi.package.smokeTest%\tools\netcoreapp3.1\any\%odsapi.smokeTestExecutable%.dll"
                        testSets = @("NonDestructiveApi", "NonDestructiveSdk")
                    }
                    
                    Write-Host ${'$'}params
                    
                    Invoke-SmokeTestClient -config ${'$'}params
                """.trimIndent()
            }
        }
    }

    dependencies {
        artifacts(AbsoluteId("EdFiBuilds_EdFi20_OdsCi_V3_NuGetPackages_EdFiOdsApiTestSdkV3TestSdkWithSampleExtensionsForSmokeTest")) {
            id = "ARTIFACT_DEPENDENCY_38"
            buildRule = lastSuccessful()
            cleanDestination = true
            artifactRules = "%odsapi.package.sdk%.*.nupkg!** => %odsapi.package.sdk%"
        }
        artifacts(RelativeId("OdsApi_OdsApiInitDevUnitTestPackage")) {
            id = "ARTIFACT_DEPENDENCY_14"
            artifactRules = "%odsapi.package.databases%.*.nupkg!** => ."
        }
        artifacts(RelativeId("OdsImplementationKotlin_EdFiLoadTools_BranchBuild")) {
            id = "ARTIFACT_DEPENDENCY_37"
            buildRule = lastSuccessful()
            cleanDestination = true
            artifactRules = "%odsapi.package.smokeTest%.*.nupkg!** => %odsapi.package.smokeTest%"
        }
    }
})

object EdFiDatabases : GitVcsRoot({
    name = "Ed-Fi Databases"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-Databases.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    serverSideAutoCRLF = true
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object EdFiExtensions : GitVcsRoot({
    name = "Ed-Fi-Extensions"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-Extensions.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    useTagsAsBranches = true
    userNameStyle = GitVcsRoot.UserNameStyle.FULL
    checkoutSubmodules = GitVcsRoot.CheckoutSubmodules.IGNORE
    serverSideAutoCRLF = true
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object EdFiOds : GitVcsRoot({
    name = "Ed-Fi-ODS"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-ODS.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    useTagsAsBranches = true
    userNameStyle = GitVcsRoot.UserNameStyle.FULL
    checkoutSubmodules = GitVcsRoot.CheckoutSubmodules.IGNORE
    serverSideAutoCRLF = true
    useMirrors = false
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object EdFiOdsImplementation : GitVcsRoot({
    name = "Ed-Fi-ODS-Implementation"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Implementation.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    useTagsAsBranches = true
    userNameStyle = GitVcsRoot.UserNameStyle.FULL
    checkoutSubmodules = GitVcsRoot.CheckoutSubmodules.IGNORE
    serverSideAutoCRLF = true
    useMirrors = false
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object EdFiTpdmExtension : GitVcsRoot({
    name = "Ed-Fi-TPDM-Extension"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-TPDM-Extension.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    serverSideAutoCRLF = true
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object OdsApi_PackagesNetCore31_EdFiMigrationUtility : GitVcsRoot({
    name = "Ed-Fi-MigrationUtility"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-MigrationUtility.git"
    pushUrl = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-MigrationUtility.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object Packages_EdFiStandard : GitVcsRoot({
    name = "Ed-Fi-Standard"
    url = "git@github.com:Ed-Fi-Alliance-OSS/Ed-Fi-Standard.git"
    branch = "%git.branch.default%"
    branchSpec = "%git.branch.specification%"
    useTagsAsBranches = true
    userNameStyle = GitVcsRoot.UserNameStyle.NAME
    checkoutSubmodules = GitVcsRoot.CheckoutSubmodules.IGNORE
    serverSideAutoCRLF = true
    useMirrors = false
    authMethod = uploadedKey {
        uploadedKey = "EdFiBuildAgent"
        passphrase = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})

object TeamCityConfigsOdsImplementation : GitVcsRoot({
    name = "TeamCity-Configs-ODS-Implementation"
    url = "https://github.com/%github.organization.teamCity%/Ed-Fi-TeamCity-Configs"
    branch = "master-ods-implementation"
    authMethod = password {
        userName = "%github.username%"
        password = "credentialsJSON:469d5b09-79fb-475a-b7bb-e6c35f753ca9"
    }
})
