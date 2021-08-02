# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot/../../logistics/scripts/modules/load-path-resolver.ps1"
$implementationRepo = Get-Item "$PSScriptRoot/../.." | Select-Object -Expand Name
$env:toolsPath = $toolsPath = (Join-Path (Get-RepositoryRoot $implementationRepo) 'tools')

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate/Modules/create-minimal-template.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate/Modules/create-populated-template.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate/Modules/database-template-source.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/build-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-teamcity.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/config/config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/database/database-lifecycle.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/database/database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/database/postgres-database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/create-package.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/nuget-helper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/restore-packages.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/plugin/plugin-source.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'Scripts/NuGet/EdFi.RestApi.Databases/Deployment.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/config/config-transform.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/tasks/TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/tools/ToolsHelper.psm1")

Set-Alias -Scope Global Reset-PopulatedTemplateFromSamples Initialize-PopulatedTemplate
Set-Alias -Scope Global Reset-MinimalTemplateFromSamples Initialize-MinimalTemplate

Set-DeploymentSettingsFiles @(
    "$(Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi')/appsettings.json",
    "$(Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi')/appsettings.development.json",
    (Get-RepositoryResolvedPath 'logistics/scripts/configuration.packages.json')
)

Set-DeploymentSettings @{ ApiSettings = @{ DropDatabases = $true } }

Set-Alias -Scope Global initdev Initialize-DevelopmentEnvironment
function Initialize-DevelopmentEnvironment {
    <#
    .description
        Builds the ODS/API solution and deploys the necessary databases in order to setup a complete development environment.
    .parameter InstallType
        The type of deployment to install: 'Sandbox', 'SharedInstance', 'YearSpecific', or 'DistrictSpecific'.
    .parameter OdsTokens
        A semicolon-separated string which requires single quotes or an array of strings for OdsTokens to use when creating Ods database instances.
        Example for Array of Strings in this format @("2018","2019","2020")
        Example for semicolon-separated string which requires single quote in this format '2013;2014;2015;2016;2017'
        For a year specific deployment a valid value could be '2013;2014;2015;2016;2017'.
        For a district specific deployment a valid value could be '255901;255902'.
    .parameter Engine
        The database engine provider, either "SQLServer" or "PostgreSQL".
    .parameter NoRebuild
        Skip the Invoke-RebuildSolution task which uses MSBuild to rebuild the main solution file: Ed-Fi-Ods-Implementation/Application/Ed-Fi-Ods.sln.
    .parameter NoCodeGen
        Skip the Invoke-CodeGen task which is to generate artifacts consumed by the api.
    .parameter NoDeploy
        Skip the Initialize-DeploymentEnvironment task which is primarily used to setup developer/production environments. Mainly used by continuous integration.
    .parameter RunPester
        Runs the Invoke-PesterTests task which will run the Pester tests in addition to the other initdev pipeline tasks.
    .parameter RunDotnetTest
        Runs the dotnet tests for the main solution file: Ed-Fi-Ods-Implementation/Application/Ed-Fi-Ods.sln.
    .parameter RunPostman
        Runs the Invoke-PostmanIntegrationTests task which will run the Postman integration tests in addition to the other initdev pipeline tasks.
    .parameter RunSmokeTest
        Runs the Invoke-SmokeTests task which will run the smoke tests, against the in-memory api, in addition to the other initdev pipeline tasks.
    .parameter UsePlugins
        Runs database scripts from downloaded plugin extensions in addition to extensions found in the Ed-Fi-Ods-Implementation.
    #>
    param(
        [ValidateSet('Sandbox', 'SharedInstance', 'YearSpecific', 'DistrictSpecific')]
        [string] $InstallType = 'Sandbox',

        [Alias('OdsYears')]
        [string[]] $OdsTokens,

        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine = 'SQLServer',

        [Alias('NoCompile')]
        [switch] $NoRebuild,

        [Alias('NoCodeGen')]
        [switch] $ExcludeCodeGen,

        [switch] $NoDeploy,

        [switch] $RunPester,

        [switch] $RunDotnetTest,

        [switch] $RunPostman,

        [switch] $RunSmokeTest,

        [switch] $RunSdkGen,

        [switch] $UsePlugins
    )

    if ((-not [string]::IsNullOrWhiteSpace($OdsTokens)) -and ($InstallType -ine 'YearSpecific') -and ($InstallType -ine 'DistrictSpecific')) {
        throw "The OdsTokens (legacy parameter name OdsYears) parameter can only be used with the 'YearSpecific' or 'DistrictSpecific' InstallType."
    }

    Clear-Error

    $script:result = @()

    $elapsed = Use-StopWatch {

        $settings = @{ ApiSettings = @{ } }

        if ($InstallType) { $settings.ApiSettings.Mode = $InstallType }
        if ($OdsTokens) { $settings.ApiSettings.OdsTokens = $OdsTokens }
        if ($Engine) { $settings.ApiSettings.Engine = $Engine }

        Set-DeploymentSettings $settings | Out-Null

        if ($UsePlugins.IsPresent) { $settings = (Merge-Hashtables $settings, (Get-EdFiDeveloperPluginSettings)) }

        $script:result += Invoke-NewDevelopmentAppSettings $settings

        if (-not [string]::IsNullOrWhiteSpace((Get-DeploymentSettings).Plugin.Folder)) { $script:result += Install-Plugins }

        if (-not $ExcludeCodeGen) { $script:result += Invoke-CodeGen }

        if (-not $NoRebuild) {
            $script:result += Invoke-RebuildSolution
        }

        $script:result += Install-DbDeploy
        $script:result += Reset-TestAdminDatabase
        $script:result += Reset-TestSecurityDatabase

        if (-not ($NoDeploy)) {
            $script:result += Reset-TestPopulatedTemplateDatabase

            $params = @{
                InstallType   = $InstallType
                Engine        = $Engine
                OdsTokens     = $OdsTokens
                DropDatabases = $true
                NoDuration    = $true
                UsePlugins    = $UsePlugins.IsPresent
            }
            $script:result += Initialize-DeploymentEnvironment @params
        }

        if ($RunPester) { $script:result += Invoke-PesterTests }

        if ($RunDotnetTest) { $script:result += Invoke-DotnetTest }

        if ($RunPostman) { $script:result += Invoke-PostmanIntegrationTests }

        if ($RunSmokeTest) { $script:result += Invoke-SmokeTests }

        if ($RunSdkGen) { $script:result += Invoke-SdkGen }
    }

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format

    return $script:result | Format-Table
}

function Invoke-ConfigTransform {
    [Obsolete("This function is deprecated, and will be removed in the near future. Use the function Invoke-NewDevelopmentAppSettings instead.")]
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine = 'SQLServer'
    )
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $baseConfig = Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi/Web.Base.config'
        $npgsqlTransform = Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi/Web.Npgsql.config'
        $debugTransform = Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi/Web.Debug.config'
        $destinationFile = ($baseConfig -replace "base.", "")

        $transformFiles = @()
        if ($Engine -eq "PostgreSQL") { $transformFiles += $npgsqlTransform }
        $transformFiles += $debugTransform

        Invoke-TransformConfigFile -sourceFile $baseConfig -transformFiles $transformFiles -destinationFile $destinationFile
    }

    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $baseConfig = Get-RepositoryResolvedPath 'Application/EdFi.Ods.SandboxAdmin.Web/Web.Base.config'
        $npgsqlTransform = Get-RepositoryResolvedPath 'Application/EdFi.Ods.SandboxAdmin.Web/Web.Npgsql.config'
        $debugTransform = Get-RepositoryResolvedPath 'Application/EdFi.Ods.SandboxAdmin.Web/Web.Debug.config'
        $destinationFile = ($baseConfig -replace "base.", "")

        $transformFiles = @()
        if ($Engine -eq "PostgreSQL") { $transformFiles += $npgsqlTransform }
        $transformFiles += $debugTransform

        Invoke-TransformConfigFile -sourceFile $baseConfig -transformFiles $transformFiles -destinationFile $destinationFile
    }
}

function Get-RandomString {
    [Obsolete("This function is deprecated, and will be removed in the near future.")]
    Param(
        [int] $length = 20
    )

    return ([char[]]([char]65..[char]90) + ([char[]]([char]97..[char]122)) + 0..9 | Sort-Object { Get-Random })[0..$length] -join ""
}

function Invoke-NewDevelopmentAppSettings([hashtable] $Settings = @{ }) {
    <#
    .description
        Generates appsettings.development.json for the following projects:
            EdFi.Ods.WebApi
            EdFi.Ods.Api.IntegrationTestHarness
            EdFi.Ods.SandboxAdmin.Web
            EdFi.Ods.SwaggerUI
        See the Get-DefaultDevelopmentSettingsByProject in settings-managements.psm1 for the default settings.
    #>
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $newSettingsFiles = New-DevelopmentAppSettings $Settings

        Write-Host 'created settings files:' -ForegroundColor Green
        $newSettingsFiles | Write-Host

        Write-Host
        Write-Host 'initdev is now using the following settings files:' -ForegroundColor Green
        $results = Assert-ValidAppSettings (Get-DeploymentSettingsFiles)
        foreach ($result in $results) {
            if ($result.success) {
                Write-Host $result.file -NoNewline
                Write-Host " ok" -ForegroundColor Green
            }
            elseif (-not $result.success) {
                Write-Host $result.file -ForegroundColor Red
                Write-Host $result.exception -ForegroundColor Red
            }
        }
        if ($results | where { $null -ne $_.exception }) { throw "invalid appsettings found" }

        Write-Host
        Write-Host 'initdev is now using the following settings:' -ForegroundColor Green
        Write-FlatHashtable (Get-DeploymentSettings)

        Write-Warning "The following settings are being overridden by the $(Split-Path -Leaf (Get-ProjectTypes).WebApi) project's user secrets:"
        Write-FlatHashtable (Get-UserSecrets ((Get-ProjectTypes).WebApi))
    }
}

Set-Alias -Scope Global Rebuild-Solution Invoke-RebuildSolution
Function Invoke-RebuildSolution {
    Param(
        [string] $buildConfiguration = "Debug",
        [string] $verbosity = "minimal",
        [string] $solutionPath = (Get-RepositoryResolvedPath "Application/Ed-Fi-Ods.sln")
    )
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        if ((Get-DeploymentSettings).Engine -eq 'PostgreSQL') { $buildConfiguration = 'Npgsql' }
        if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $buildConfiguration = $env:msbuild_buildConfiguration }

        $params = @{
            Path               = $solutionPath
            BuildConfiguration = $buildConfiguration
            LogVerbosityLevel  = $verbosity
        }

        ($params).GetEnumerator() | Sort-Object -Property Name | Format-Table -HideTableHeaders -AutoSize -Wrap | Out-Host

        $BuildLogDirectoryPath = (Get-Location)

        $solutionFileName = (Get-ItemProperty -LiteralPath $solutionPath).Name
        $buildLogFilePath = (Join-Path -Path $BuildLogDirectoryPath -ChildPath $solutionFileName) + ".msbuild.log"

        dotnet build $solutionPath -c $buildConfiguration -v $verbosity /flp:v=$verbosity /flp:logfile=$buildLogFilePath | Out-Host

        # If we can't find the build's log file in order to inspect it, write a warning and return null.
        if (!(Test-Path -LiteralPath $buildLogFilePath -PathType Leaf)) {
            Write-Warning ("Cannot find the build log file at '$buildLogFilePath', so unable to determine if build succeeded or not.")
            return
        }

        # Get if the build succeeded or not.
        [bool] $buildFailed = (Select-String -Path $buildLogFilePath -Pattern "Build FAILED." -SimpleMatch -Quiet)

        if ($buildFailed) {
            Write-Host 'Ensure that the Visual Studio SDK is installed.'
            throw "Build failed. Check the build log file '$buildLogFilePath' for errors."
        }

        return
    }
}

function Reset-EmptySandboxDatabase {
    Invoke-Task -name ($MyInvocation.MyCommand.Name) -task {
        $settings = Get-DeploymentSettings
        $odsDatabaseType = $settings.ApiSettings.DatabaseTypes.Ods
        $odsConnectionStringKey = $settings.ApiSettings.ConnectionStringKeys[$odsDatabaseType]
        $connectionString = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.ApiSettings.csbs[$odsConnectionStringKey] -replacementTokens 'Ods_Sandbox_Empty'
        $params = @{
            engine       = $settings.ApiSettings.engine
            csb          = $connectionString
            database     = $odsDatabaseType
            filePaths    = $settings.ApiSettings.FilePaths
            subTypeNames = @()
            dropDatabase = $true
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

function Reset-TestAdminDatabase {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $settings = Get-DeploymentSettings
        $odsConnectionStringKey = $settings.ApiSettings.ConnectionStringKeys[$settings.ApiSettings.DatabaseTypes.Ods]
        $params = @{
            engine       = $settings.ApiSettings.engine
            csb          = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.ApiSettings.csbs[$odsConnectionStringKey] -replacementTokens 'Admin_Test'
            database     = $settings.ApiSettings.DatabaseTypes.Admin
            filePaths    = $settings.ApiSettings.FilePaths
            subTypeNames = @()
            dropDatabase = $true
        }
        if ($settings.ApiSettings.Engine -eq 'SQLServer') {
            # turn on all available features for the test database to ensure all the schema components are available
            $params.subTypeNames = Get-DefaultSubtypes
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

function Reset-TestSecurityDatabase {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $settings = Get-DeploymentSettings
        $odsConnectionStringKey = $settings.ApiSettings.ConnectionStringKeys[$settings.ApiSettings.DatabaseTypes.Ods]
        $params = @{
            engine       = $settings.ApiSettings.engine
            csb          = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.ApiSettings.csbs[$odsConnectionStringKey] -replacementTokens 'Security_Test'
            database     = $settings.ApiSettings.DatabaseTypes.Security
            filePaths    = $settings.ApiSettings.FilePaths
            subTypeNames = @()
            dropDatabase = $true
        }
        if ($settings.ApiSettings.Engine -eq 'SQLServer') {
            # turn on all available features for the test database to ensure all the schema components are available
            $params.subTypeNames = Get-DefaultSubtypes
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

Set-Alias -Scope Global Reset-TestPopulatedTemplate Reset-TestPopulatedTemplateDatabase
# deploy separate database used by the ODS/API tests
function Reset-TestPopulatedTemplateDatabase {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $settings = Get-DeploymentSettings
        $odsDatabaseType = $settings.ApiSettings.DatabaseTypes.Ods
        $odsConnectionStringKey = $settings.ApiSettings.ConnectionStringKeys[$odsDatabaseType]
        # always use Grand Bend data for the test database
        $backupPath = Get-PopulatedTemplateBackupPathFromSettings $settings
        $params = @{
            engine                  = $settings.ApiSettings.engine
            csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.ApiSettings.csbs[$odsConnectionStringKey] -replacementTokens "$($settings.ApiSettings.populatedTemplateSuffix)_Test"
            database                = $odsDatabaseType
            filePaths               = $settings.ApiSettings.FilePaths
            subTypeNames            = Get-DefaultSubtypes
            dropDatabase            = $true
            createByRestoringBackup = $backupPath
            databaseTimeoutInSeconds = $settings.ApiSettings.DatabaseTimeOutInSeconds
        }

        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

Set-Alias -Scope Global Run-CodeGen Invoke-CodeGen
function Invoke-CodeGen {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine,
        [switch] $IncludePlugins,
        [string[]] $ExtensionPaths
    )

    Install-CodeGenUtility

    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        if ([string]::IsNullOrEmpty($Engine)) {
            $Engine = (Get-DeploymentSettings).ApiSettings.Engine
        }

        $codeGen = (Join-Path $toolsPath 'EdFi.Ods.CodeGen')
        $repositoryRoot = (Get-RepositoryRoot $implementationRepo).Replace($implementationRepo, '')
        $parameters = @(
            "-r", $repositoryRoot,
            "-e", $Engine
        )
        if ($IncludePlugins) {
            $parameters += "--IncludePlugins"
        }
        if ($ExtensionPaths.Length -gt 0) {
            $parameters += "--ExtensionPaths"
            $parameters += $ExtensionPaths
        }
        Write-Host -ForegroundColor Magenta "& $codeGen $parameters"
        & $codeGen $parameters | Out-Host
    }
}

function Install-DbDeploy {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $settings = Get-DeploymentSettings

        $packageSettings = $settings.packages['EdFi.Db.Deploy']
        $parameters = @{
            Name    = $packageSettings.packageName
            Version = $packageSettings.packageVersion
            Source  = $packageSettings.packageSource
        }
        if ([string]::IsNullOrWhiteSpace($parameters.Path)) { $parameters.Path = $toolsPath }
        Install-DotNetTool @parameters
    }
}

function Install-CodeGenUtility {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $settings = Get-DeploymentSettings

        $packageSettings = $settings.packages['EdFi.Ods.CodeGen']
        $parameters = @{
            Name    = $packageSettings.packageName
            Version = $packageSettings.packageVersion
            Source  = $packageSettings.packageSource
        }
        if ([string]::IsNullOrWhiteSpace($parameters.Path)) { $parameters.Path = $toolsPath }
        Install-DotNetTool @parameters
    }
}

function Invoke-PesterTests {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {

        $pester = Get-InstalledModule | ? -Property Name -eq "Pester"

        if ($null -eq $pester) {
            Write-Host "Installing Pester"
            Install-Module -Name Pester -Scope CurrentUser -MinimumVersion 5.0.0 -Force -SkipPublisherCheck | Out-Null
        }

        $params = @{
            Output = 'Detailed'
            CI     = $true
        }
        Invoke-Pester @params
    }
}

function Invoke-PostmanIntegrationTests {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics/scripts/Invoke-PostmanIntegrationTests.ps1")
    }
}

function Invoke-SdkGen {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics/scripts/Invoke-SdkGen.ps1")
    }
}

function Invoke-SmokeTests {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics/scripts/run-smoke-tests.ps1")
    }
}

function Invoke-DotnetTest {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics/scripts/run-tests.ps1")
    }
}

function Get-DefaultNuGetProperties {
    $buildConfiguration = 'debug'
    if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $buildConfiguration = $env:msbuild_buildConfiguration }

    return @(
        "authors=Ed-Fi Alliance"
        "owners=Ed-Fi Alliance"
        "configuration=$buildConfiguration"
    )
}

function New-DatabasesPackage {
    param(
        [string] $ProjectPath,

        [string] $PackageId,

        [string] $Version,

        [string[]] $Properties = @(),

        [string] $OutputDirectory
    )

    Invoke-Task -name "$($MyInvocation.MyCommand.Name) ($(Split-Path $ProjectPath -Leaf))" -task {
        if ([string]::IsNullOrWhiteSpace($PackageId)) { $PackageId = (Split-Path $ProjectPath -Leaf) }

        Write-Host -ForegroundColor Magenta "& `"$ProjectPath/prep-package.ps1`" $PackageId"
        & "$ProjectPath/prep-package.ps1" $PackageId
        Write-Host

        $nuget = Install-NuGetCli -ToolsPath $ToolsPath

        $params = @{
            PackageDefinitionFile = (Get-ChildItem "$ProjectPath/$PackageId.nuspec")
            PackageId             = $PackageId
            Version               = $Version
            Properties            = $Properties
            OutputDirectory       = $OutputDirectory
            NuGet                 = $nuget
        }
        New-Package @params | Out-Host
    }
}

function New-WebPackage {
    param(
        [string] $ProjectPath,

        [string] $PackageDefinitionFile = "$ProjectPath/bin/*/*/publish/$(Split-Path $ProjectPath -Leaf).nuspec",

        [string] $PackageId,

        [string] $Version,

        [string[]] $Properties = @(),

        [string] $OutputDirectory`
    )

    Invoke-Task -name "$($MyInvocation.MyCommand.Name) ($(Split-Path $ProjectPath -Leaf))" -task {

        $buildConfiguration = 'debug'
        if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $buildConfiguration = $env:msbuild_buildConfiguration }

        $params = @(
            "publish", $ProjectPath,
            "--configuration", $buildConfiguration,
            "--no-restore",
            "--no-build"
        )

        Write-Host -ForegroundColor Magenta "& dotnet $params"
        & dotnet $params | Out-Host
        Write-Host

        $PackageDefinitionFile = (Get-ChildItem $PackageDefinitionFile)
        if (-not [string]::IsNullOrWhiteSpace($PackageId)) {
            [xml] $xml = Get-Content $PackageDefinitionFile
            $xml.package.metadata.id = $PackageId
            $xml.Save($PackageDefinitionFile)
        }

        $nuget = Install-NuGetCli -ToolsPath $ToolsPath

        $params = @{
            PackageDefinitionFile = $PackageDefinitionFile
            Version               = $Version
            Properties            = $Properties
            OutputDirectory       = $OutputDirectory
            NuGet                 = $nuget
        }

        New-Package @params | Out-Host
    }
}

Export-ModuleMember -Function * -Alias *
