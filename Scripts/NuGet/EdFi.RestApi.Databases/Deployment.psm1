# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

$ErrorActionPreference = 'Stop'

$script:deploymentSettingsFiles = @((Join-Path $PSScriptRoot 'configuration.json'))
$script:deploymentSettingsOverrides = @{ }

function Initialize-DeploymentEnvironment {
    <#
    .description
    Deploy databases from the EdFi.RestApi.Databases NuGet package created by .\prep-package.ps1
    .parameter PathResolverRepositoryOverride
    A semicolon-separated string of repositories to pass to path-resolver, such as 'Ed-Fi-ODS;Ed-Fi-Ods-Implementation'
    .parameter InstallType
    The type of deployment to install: 'Sandbox', 'SharedInstance' or 'YearSpecific'
    .parameter Engine
    The database engine provider, either 'SQLServer' or 'PostgreSQL'
    .parameter ExcludedExtensionSources
    A comma separated string of extensions sources to exclude from database deployment.
    Any values specified will be excluded from the resolved extension sources list.
    If no sources are passed then any resolved sources found by the artifact source resolver will be used.
    .parameter EnabledFeatureNames
    Any subtype features specified will be enabled.
    .parameter OdsTokens
    A semicolon-separated string of tokens to use when creating Ods database instances.
    For a year specific deployment a valid value could be '2013;2014;2015;2016;2017'.
    For a district specific deployment a valid value could be '255901;255902'.
    .PARAMETER OdsDatabaseTemplateName
    Template to use when deploying Ods database. Allowed values: minimal, populated. Defaults to minimal.
    .parameter DropDatabases (Alias Transient)
    If supplied the database will be dropped without being backed up before being recreated from scripts and/or migrations.
    By default databases are not dropped and will be backup before being migrated when needed.
    .parameter NoDuration
    Turn off duration display
    #>
    param(
        [string] $PathResolverRepositoryOverride,

        [ValidateSet('Sandbox', 'SharedInstance', 'YearSpecific', 'DistrictSpecific')]
        [string] $InstallType = 'Sandbox',

        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine = 'SQLServer',

        [Obsolete("This parameter is deprecated, and will be removed in the near future. Please use ExcludedExtensions property in appsettings.json instead")]
        [string] $ExcludedExtensionSources,

        [Obsolete("This parameter is deprecated, and will be removed in the near future. Please use the Features property in appsettings.json instead")]
        [string] $EnabledFeatureNames,

        [Alias('OdsYears')]
        [string] $OdsTokens,

        [ValidateSet("minimal", "populated")]
        [string] $OdsDatabaseTemplateName = "minimal",

        [Alias('Transient')]
        [switch] $DropDatabases,

        [switch] $NoDuration,

        [switch] $UsePlugins
    )

    # if path-resolver is not present assume that the script is being ran in a deployment scenario
    # from inside the EdFi.RestApi.Databases NuGet Package created by .\prep-package.ps1
    if (-not (Get-Module | Where-Object -Property Name -eq 'path-resolver')) {
        $pathResolver = (Get-ChildItem "$PSScriptRoot\*\logistics\scripts\modules\load-path-resolver.ps1" | Select-Object -Last 1)

        if ([string]::IsNullOrWhiteSpace($PathResolverRepositoryOverride)) {
            & $pathResolver
        } else {
            & $pathResolver ($PathResolverRepositoryOverride.Split(';'))
        }

        if ($Engine -eq 'SQLServer') { Set-DeployConfigFile (Join-Path $PSScriptRoot 'Databases.config') }
        if ($Engine -eq 'PostgreSQL') { Set-DeployConfigFile (Join-Path $PSScriptRoot 'Databases.Npgsql.config') }
    }

    Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\database-template-source.psm1')
    Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
    Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-lifecycle.psm1')
    Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tools\ToolsHelper.psm1')
    Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tasks\TaskHelper.psm1")

    Write-InvocationInfo $MyInvocation

    Clear-Error

    $settings = @{
        DeploymentSettings = @{
            InstallType = $InstallType
            Engine = $Engine
            OdsTokens = $OdsTokens
            OdsDatabaseTemplateName = $OdsDatabaseTemplateName
            DropDatabases = $DropDatabases
            NoDuration = $NoDuration
            UsePlugins = $UsePlugins
            MinimalTemplateSuffix = 'Ods_Minimal_Template'
            PopulatedTemplateSuffix = 'Ods_Populated_Template'
        }
    }
    if ($ExcludedExtensionSources) { $settings.DeploymentSettings.ExcludedExtensionSources = $ExcludedExtensionSources }
    if ($EnabledFeatureNames) { $settings.DeploymentSettings.EnabledFeatureNames = $EnabledFeatureNames }
    Set-DeploymentSettings $settings

    $script:result = @()

    $elapsed = Use-StopWatch {
        $script:result += Reset-AdminDatabase
        $script:result += Reset-SecurityDatabase

        if ($InstallType -ne 'Sandbox') {
            $script:result += Reset-OdsDatabase
        }
        else {
            $script:result += Remove-SandboxDatabases
            $script:result += Reset-MinimalTemplateDatabase
            $script:result += Reset-PopulatedTemplateDatabase
        }
    }

    Test-Error

    if (-not $NoDuration) {
        $script:result += New-TaskResult -name '-' -duration '-'
        $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
        return $script:result | Format-Table
    }

    return $script:result
}

function Set-DeploymentSettingsFiles([string[]] $DeploymentSettingsFiles) {
    <#
    .description
    Sets the settings folder to where the appsettings files can be found
    by default it uses the following files: appsettings.json, appsettings.development.json, appsettings.user.json
    .parameter configFile
    The full path to the settings folder
    This is usually the Ed-Fi-ODS-Implementation\Application\EdFi.Ods.WebApi\ for development
    and Ed-Fi-ODS-Implementation\Scripts\NuGet\EdFi.RestApi.Databases\ when deploying from the nuget package.
    #>

    $script:deploymentSettingsFiles = $DeploymentSettingsFiles

    return $script:deploymentSettingsFiles
}

function Set-DeploymentSettings([hashtable] $Settings = @{ }) {
    $script:deploymentSettingsOverrides = Merge-Hashtables $script:deploymentSettingsOverrides, $Settings
    return $script:deploymentSettingsOverrides
}

function Get-DeploymentSettings {
    <#
    .synopsis
    Gets merged configuration values from the configuration file and any overrides
    .description
    Gets merged configuration values taking both the fresh values from the configuration file set by the Set-DeployConfigFile function
    and overrides those values with any values set through the Set-DeployConfigOverride. Any parameters passed set through the override
    take precedence over values pulled from configuration files. This function should be called for every task that needs fresh values
    from a configuration file otherwise any configuration file changes will be ignored until the scripts are re-imported.
    #>

    $mergedSettings = Merge-Hashtables @{ }, (Get-MergedAppSettings $script:deploymentSettingsFiles), $script:deploymentSettingsOverrides

    $mergedSettings = Add-DeploymentSpecificSettings $mergedSettings

    return $mergedSettings
}

function Reset-AdminDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-SecurityDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-OdsDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Remove-SandboxDatabases { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-MinimalTemplateDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-PopulatedTemplateDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }

Set-Alias -Scope Global Reset-PopulatedTemplate Reset-PopulatedTemplateDatabase
Set-Alias -Scope Global Remove-Sandboxes Remove-SandboxDatabases
Set-Alias -Scope Global Reset-YearSpecificDatabase Reset-OdsDatabase

$deploymentTasks = @{
    'Reset-AdminDatabase' = {
        $settings = Get-DeploymentSettings
        $admin = $settings.DeploymentSettings.databaseIds.admin
        $params = @{
            engine = $settings.ApiSettings.engine
            csb = $settings.DeploymentSettings.csbs[$admin]
            database = 'Admin'
            filePaths = $settings.DeploymentSettings.FilePaths
            subTypeNames = $settings.DeploymentSettings.SubTypes
            dropDatabase = $settings.DeploymentSettings.DropDatabases
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-SecurityDatabase' = {
        $settings = Get-DeploymentSettings
        $security = $settings.DeploymentSettings.databaseIds.security
        $params = @{
            engine = $settings.ApiSettings.engine
            csb = $settings.DeploymentSettings.csbs[$security]
            database = 'Security'
            filePaths = $settings.DeploymentSettings.FilePaths
            subTypeNames = $settings.DeploymentSettings.SubTypes
            dropDatabase = $settings.DeploymentSettings.DropDatabases
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-OdsDatabase' = {
        $settings = Get-DeploymentSettings
        $ods = $settings.DeploymentSettings.databaseIds.ods
        $databaseName = 'Ods'
        $replacementTokens = @($databaseName)
        if ($settings.OdsDatabaseTemplateName -eq 'populated')
        {
            $backupPath = Get-PopulatedTemplateBackupPathFromSettings $settings
        }
        else
        {
            $backupPath = Get-MinimalTemplateBackupPathFromSettings $settings
        }

        if ($settings.odsTokens) { $replacementTokens = $settings.odsTokens -split ';' | ForEach-Object { "${databaseName}_$($_)" } }
        $csbs = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.DeploymentSettings.csbs[$ods] -replacementTokens $replacementTokens
        foreach ($csb in $csbs) {
            $params = @{
                engine = $settings.ApiSettings.engine
                csb = $csb
                database = 'Ods'
                filePaths = $settings.DeploymentSettings.FilePaths
                subTypeNames = $settings.DeploymentSettings.SubTypes
                dropDatabase = $settings.DeploymentSettings.DropDatabases
                createByRestoringBackup = $backupPath
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    'Remove-SandboxDatabases' = {
        $settings = Get-DeploymentSettings
        if ($settings.ApiSettings.engine -ne 'SQLServer') { return; }
        $masterCSB = $settings.DeploymentSettings.csbs[$settings.DeploymentSettings.databaseIds.master]
        $templateCSB = $settings.DeploymentSettings.csbs[$settings.DeploymentSettings.databaseIds.ods]
        Remove-EdFiSandboxDatabases -masterCSB $masterCSB -edfiOdsTemplateCSB $templateCSB
    }
    'Reset-MinimalTemplateDatabase' = {
        $settings = Get-DeploymentSettings
        $ods = $settings.DeploymentSettings.databaseIds.ods
        $backupPath = Get-MinimalTemplateBackupPathFromSettings $settings
        $params = @{
            engine = $settings.ApiSettings.engine
            csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.DeploymentSettings.csbs[$ods] -replacementTokens $settings.DeploymentSettings.minimalTemplateSuffix
            database = 'Ods'
            filePaths = $settings.DeploymentSettings.FilePaths
            subTypeNames = $settings.DeploymentSettings.SubTypes
            dropDatabase = $true
            createByRestoringBackup = $backupPath
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-PopulatedTemplateDatabase' = {
        $settings = Get-DeploymentSettings
        $ods = $settings.DeploymentSettings.databaseIds.ods
        $backupPath = Get-PopulatedTemplateBackupPathFromSettings $settings
        $params = @{
            engine = $settings.ApiSettings.engine
            csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $settings.DeploymentSettings.csbs[$ods] -replacementTokens $settings.DeploymentSettings.populatedTemplateSuffix
            database = 'Ods'
            filePaths = $settings.DeploymentSettings.FilePaths
            subTypeNames = $settings.DeploymentSettings.SubTypes
            dropDatabase = $true
            createByRestoringBackup = $backupPath
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

Export-ModuleMember -function * -Alias *
