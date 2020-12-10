# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

$ErrorActionPreference = 'Stop'

$toolVersion = @{
    dbDeploy = "2.2.0-b10049"
    codeGen = "5.2.0-b11276"
}

& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
$implementationRepo = Get-Item "$PSScriptRoot\..\.." | Select-Object -Expand Name
$env:toolsPath = $toolsPath = (Join-Path (Get-RepositoryRoot $implementationRepo) 'tools')

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\database-template-source.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\create-minimal-template.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\create-populated-template.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\config\config-transform.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-lifecycle.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\postgres-database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\nuget-helper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\restore-packages.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\settings\settings-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tasks\TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tools\ToolsHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'Scripts\NuGet\EdFi.RestApi.Databases\Deployment.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\plugin\plugin-source.psm1')

Set-Alias -Scope Global Reset-PopulatedTemplateFromSamples Initialize-PopulatedTemplate
Set-Alias -Scope Global Reset-MinimalTemplateFromSamples Initialize-MinimalTemplate

Set-DeploymentSettingsFiles @(
    "$(Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi')\appsettings.json",
    "$(Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi')\appsettings.development.json"
)

Set-DeploymentSettings @{ ApiSettings = @{ DropDatabases = $true } }

Set-Alias -Scope Global initdev Initialize-DevelopmentEnvironment
function Initialize-DevelopmentEnvironment {
    <#
    .description
        Builds the ODS/API solution and deploys the necessary databases
    .parameter InstallType
        The type of deployment to install: 'Sandbox', 'SharedInstance', 'YearSpecific', or 'DistrictSpecific'
    .parameter OdsTokens
        A semicolon-separated string of tokens to use when creating Ods database instances.
        For a year specific deployment a valid value could be '2013;2014;2015;2016;2017'.
        For a district specific deployment a valid value could be '255901;255902'.
    .parameter Engine
        The database engine provider, either "SQLServer" or "PostgreSQL"
    .parameter NoRebuild
        Skip the Invoke-RebuildSolution task which uses MSBuild to rebuild the main solution file: Ed-Fi-Ods-Implementation/Application/Ed-Fi-Ods.sln
    .parameter NoCodeGen
        Skip the Invoke-CodeGen task which is to generate artifacts consumed by the api.
    .parameter NoDeploy
        Skip the Initialize-DeploymentEnvironment task which is primarily used to setup developer/production environments. Mainly used by continuous integration.
    .parameter RunPester
        Runs the Invoke-PesterTests task which will run the Pester tests in addition to the other initdev pipeline tasks.
    .parameter RunPostman
        Runs the Invoke-PostmanIntegrationTests task which will run the Postman integration tests in addition to the other initdev pipeline tasks.
    .parameter RunSmokeTest
        Runs the Invoke-SmokeTests task which will run the smoke tests, against the in-memory api, in addition to the other initdev pipeline tasks.
    .parameter UsePlugins
        Runs database scripts from downloaded plugin extensions in addition to extensions found in the Ed-Fi-Ods-Implementation
    #>
    param(
        [ValidateSet('Sandbox', 'SharedInstance', 'YearSpecific', 'DistrictSpecific')]
        [string] $InstallType = 'Sandbox',

        [Alias('OdsYears')]
        [string] $OdsTokens = @(),

        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine = 'SQLServer',

        [Alias('NoCompile')]
        [switch] $NoRebuild,

        [Alias('NoCodeGen')]
        [switch] $ExcludeCodeGen,

        [switch] $NoDeploy,

        [Obsolete("This parameter is deprecated, and will be removed in the near future.")]
        [switch] $NoCredentials,

        [switch] $RunPester,

        [switch] $RunPostman,

        [switch] $RunSmokeTest,

        [switch] $UsePlugins,

        [switch] $RunDotnetTest
    )

    if ((-not [string]::IsNullOrWhiteSpace($OdsTokens)) -and ($InstallType -ine 'YearSpecific') -and ($InstallType -ine 'DistrictSpecific')) {
        throw "The OdsTokens (legacy parameter name OdsYears) parameter can only be used with the 'YearSpecific' or 'DistrictSpecific' InstallType."
    }

    Clear-Error

    $script:result = @()

    $elapsed = Use-StopWatch {

        $settings = @{ ApiSettings = @{} }

        if ($InstallType) { $settings.ApiSettings.Mode = $InstallType }
        if ($OdsTokens) { $settings.ApiSettings.OdsTokens = $OdsTokens }
        if ($Engine) { $settings.ApiSettings.Engine = $Engine }
        if ($UsePlugins.IsPresent) { $settings = (Merge-Hashtables $settings, (Get-EdFiDeveloperPluginSettings)) }

        $script:result += Invoke-NewDevelopmentAppSettings $settings

        if (-not [string]::IsNullOrWhiteSpace((Get-DeploymentSettings).Plugin.Folder)) { $script:result += Install-Plugins }

        $script:result += Install-DbDeploy

        if (-not $ExcludeCodeGen) {
            $script:result += Invoke-CodeGen
        }

        if (-not $NoRebuild) {
            $script:result += Invoke-RestorePackages
            $script:result += Invoke-RebuildSolution
        }

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

        if ($RunPostman) { $script:result += Invoke-PostmanIntegrationTests }

        if ($RunSmokeTest) { $script:result += Invoke-SmokeTests }

        if ($RunDotnetTest) { $script:result += Invoke-DotnetTest }
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
        $baseConfig = Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi\Web.Base.config'
        $npgsqlTransform = Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi\Web.Npgsql.config'
        $debugTransform = Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi\Web.Debug.config'
        $destinationFile = ($baseConfig -replace "base.", "")

        $transformFiles = @()
        if ($Engine -eq "PostgreSQL") { $transformFiles += $npgsqlTransform }
        $transformFiles += $debugTransform

        Invoke-TransformConfigFile -sourceFile $baseConfig -transformFiles $transformFiles -destinationFile $destinationFile
    }

    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $baseConfig = Get-RepositoryResolvedPath 'Application\EdFi.Ods.SandboxAdmin.Web\Web.Base.config'
        $npgsqlTransform = Get-RepositoryResolvedPath 'Application\EdFi.Ods.SandboxAdmin.Web\Web.Npgsql.config'
        $debugTransform = Get-RepositoryResolvedPath 'Application\EdFi.Ods.SandboxAdmin.Web\Web.Debug.config'
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
        Set-DeploymentSettings $Settings | Out-Null
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
    }
}

Set-Alias -Scope Global Rebuild-Solution Invoke-RebuildSolution
Function Invoke-RebuildSolution {
    Param(
        [string] $buildConfiguration = "Debug",
        [string] $target = "build",
        [string] $verbosity = "minimal",
        [string] $maxCpuCount = "",
        [string] $noReuse = "false",
        [string] $platformEnvironmentVariable = "Any CPU",
        [string] $solutionPath = (Get-RepositoryResolvedPath "Application/Ed-Fi-Ods.sln"),
        [string] $msBuildFilePath = $env:msbuild_exe
    )
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        if ((Get-DeploymentSettings).Engine -eq 'PostgreSQL') { $buildConfiguration = 'Npgsql' }
        if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $buildConfiguration = $env:msbuild_buildConfiguration }

        $msBuildParameters = @(
            "`"/property:Configuration=$buildConfiguration`"",
            "`"/target:$target`"",
            "`"/verbosity:$verbosity`"",
            "`"/nr:$noReuse`"",
            "`"/p:Platform=$platformEnvironmentVariable`""
        )

        if (-not [string]::IsNullOrWhiteSpace($maxCpuCount)) {
            $msBuildParameters += "`"/m:$maxCpuCount`""
        }
        else {
            $msBuildParameters += "`"/m`""
        }

        $params = @{
            Path                           = $solutionPath
            MsBuildParameters              = ($msBuildParameters -join ' ')
            ShowBuildOutputInCurrentWindow = $true
            LogVerbosityLevel              = $verbosity
        }

        if (-not [string]::IsNullOrWhiteSpace($msBuildFilePath)) { $params.MsBuildFilePath = $msBuildFilePath }

        ($params).GetEnumerator() | Sort-Object -Property Name | Format-Table -HideTableHeaders -AutoSize -Wrap | Out-Host
        $buildResult = Invoke-MsBuild @params

        if ($null -eq $buildResult.BuildSucceeded) { throw "Unsure if build passed or failed: $($buildResult.Message)" }
        if ($buildResult.BuildSucceeded -eq $true) { return }
        if ($buildResult.BuildSucceeded -eq $false) {
            Write-Host 'Ensure that the Visual Studio SDK is installed.'
            throw "Build failed after $(Get-DurationString $buildResult.BuildDuration). Check the build log file '$($buildResult.BuildLogFilePath)' for errors."
        }
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
        }

        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

Set-Alias -Scope Global Run-CodeGen Invoke-CodeGen
function Invoke-CodeGen {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine,
        [switch] $IncludePlugins
    )

    Install-CodeGenUtility

    if ([string]::IsNullOrEmpty($Engine)) {
        $Engine = (Get-DeploymentSettings).ApiSettings.Engine
    }

    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $tool = (Join-Path $toolsPath 'EdFi.Ods.CodeGen')
        $repositoryRoot = (Get-RepositoryRoot $implementationRepo).Replace($implementationRepo, '')

        if ($IncludePlugins) {
            & $tool -r $repositoryRoot -e $Engine -IncludePlugins | Write-Host
        }
        else {
            & $tool -r $repositoryRoot -e $Engine | Write-Host
        }
    }
}

function Invoke-RestorePackages {
    Param(
        [string] $solutionPath = (Get-RepositoryResolvedPath "Application/Ed-Fi-Ods.sln")
    )
    Invoke-Task -name $MyInvocation.MyCommand.Name -task { Restore-Packages -solutionPath $solutionPath -toolsPath $toolsPath }
}

function Install-DbDeploy {
    Install-ToolDbDeploy -toolsPath $toolsPath -toolVersion $toolVersion.DbDeploy
}

function Install-CodeGenUtility {
    Install-ToolCodeGenUtility -toolsPath $toolsPath -toolVersion $toolVersion.CodeGen
}

function Invoke-PesterTests {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {

        $pester = Get-InstalledModule | ? -Property Name -eq "Pester"

        if ($null -eq $pester) {
            Write-Host "Installing Pester"
            Install-Module -Name Pester -Scope CurrentUser -MinimumVersion 5.0.0 -Force -SkipPublisherCheck | Out-Null
        }

        $params = @{ Output = 'Detailed' }
        if (Test-TeamCityVersion) { $params.CI = $true }
        Invoke-Pester @params
    }
}

function Invoke-PostmanIntegrationTests {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics\scripts\Invoke-PostmanIntegrationTests.ps1")
    }
}

function Invoke-SmokeTests {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics\scripts\run-smoke-tests.ps1")
    }
}

function Invoke-DotnetTest {
    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        & (Get-RepositoryResolvedPath "logistics\scripts\run-tests.ps1")
    }
}

Export-ModuleMember -Function * -Alias *
