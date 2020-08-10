# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

$ErrorActionPreference = 'Stop'

# set the default configuration file and overrides to use. typically these are overridden by initdev after import
$script:configurationFile = (Join-Path $PSScriptRoot 'Databases.config')
$script:configurationOverride = @{ }

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
        [string] $ExcludedExtensionSources,
        [string] $EnabledFeatureNames,
        [Alias('OdsYears')]
        [string] $OdsTokens,
        [string] [ValidateSet("minimal", "populated")] $OdsDatabaseTemplateName = "minimal",
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

    # any parameters passed in will be used to override the default parameters whenever Get-DeployConfig is called
    Set-DeployConfigOverride @PSBoundParameters

    $script:result = @()

    $elapsed = Use-StopWatch {
        $script:result += Reset-AdminDatabase
        $script:result += Reset-SecurityDatabase

        $script:result += Reset-EmptyTemplateDatabase

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

function Set-DeployConfigFile {
    <#
    .description
    Sets the configuration file to use
    .parameter configFile
    The full path to the configuration file
    This is usually the Ed-Fi-ODS-Implementation\Application\EdFi.Ods.WebApi\Web.Base.config for development
    and Ed-Fi-ODS-Implementation\Scripts\NuGet\EdFi.RestApi.Databases\Databases.config when deploying from the nuget package.
    #>
    param(
        [string] $configFile
    )

    Write-Host "Using config file: $configFile"
    $script:configurationFile = $configFile
}

function Set-DeployConfigOverride {
    <#
    .description
    Sets configuration values that will override any values pulled from the configuration file set by Set-DeployConfigFile
    .parameter databaseIds
    The database id table. See the Get-EdFiDatabaseId function in
    Ed-Fi-ODS-Implementation\logistics\scripts\modules\config\config-management.psm1 for more information
    .parameter connectionStrings
    A hashtable of connection strings whose property names must correspond with the connectionStringsKey of the databaseIds
    .parameter ExcludedExtensionSources
    A comma separated sting of extensions sources to exclude from database deployment
    .parameter EnabledFeatureNames
    A list of subtype features to be enabled.
    .parameter OdsTokens
    A semicolon-separated string of tokens to use when creating Ods database instances.
    For a year specific deployment a valid value could be '2013;2014;2015;2016;2017'.
    For a district specific deployment a valid value could be '255901;255902'.
    .parameter DropDatabase
    If supplied the database will be dropped without being backed up before being recreated from scripts and/or migrations.
    By default databases are not dropped and will be backup before being migrated when needed.
    .PARAMETER OdsDatabaseTemplateName
    Template to use when deploying ods database. Allowed values: minimal, populated. Defaults to minimal.
    .parameter UsePlugins
    Runs database scripts from downloaded plugin extensions instead of extensions found in the Ed-Fi-Ods-Implementation
    #>
    param(
        [hashtable] $databaseIds,
        [hashtable] $connectionStrings,
        [string[]] $ExcludedExtensionSources,
        [string[]] $EnabledFeatureNames,
        [Alias('OdsYears')]
        [string] $OdsTokens,
        [string] $Engine,
        [Alias('Transient')]
        [switch] $DropDatabases,
        [string] $EmptyTemplateSuffix = 'Ods_Empty_Template',
        [string] $MinimalTemplateSuffix = 'Ods_Minimal_Template',
        [string] $PopulatedTemplateSuffix = 'Ods_Populated_Template',
        [string] $OdsDatabaseTemplateName,
        [switch] $UsePlugins
    )

    $config = $script:configurationOverride

    # overwrite default config values with any incoming parameters
    if ($PSBoundParameters.ContainsKey('databaseIds')) { $config.databaseIds = $databaseIds }
    if ($PSBoundParameters.ContainsKey('connectionStrings')) { $config.connectionStrings = $connectionStrings }
    if ($PSBoundParameters.ContainsKey('ExcludedExtensionSources')) {
        $config.enabledSources = (Select-SupportingArtifactResolvedSources | Select-ExtensionArtifactResolvedName -exclude $ExcludedExtensionSources.Split(','))
    }
    if ($PSBoundParameters.ContainsKey('EnabledFeatureNames')) {
        $config.featureSubTypeNames = @()
        Get-AvailableFeatures |
            Where-Object { ($null -ne $_.subTypeName) -and ($EnabledFeatureNames -contains $_.subTypeName) } |
            ForEach-Object { $config.featureSubTypeNames += $_.subTypeName }
    }
    if ($PSBoundParameters.ContainsKey('OdsTokens')) { $config.odsTokens = $OdsTokens }
    if ($PSBoundParameters.ContainsKey('Engine')) { $config.engine = $Engine }
    if ($PSBoundParameters.ContainsKey('DropDatabases')) { $config.dropDatabase = $DropDatabases }
    if ($PSBoundParameters.ContainsKey('OdsDatabaseTemplateName')) { $config.OdsDatabaseTemplateName = $OdsDatabaseTemplateName }
    if ($PSBoundParameters.ContainsKey('UsePlugins')) { $config.usePlugins = $UsePlugins }

    $config.emptyTemplateSuffix = $EmptyTemplateSuffix
    $config.minimalTemplateSuffix = $MinimalTemplateSuffix
    $config.populatedTemplateSuffix = $PopulatedTemplateSuffix

    $script:configurationOverride = $config
}

function Merge-WithDeployConfig {
    <#
    .description
    Merges the configuration file values with the override values set through the Set-DeployConfigOverride.
    .parameter configFile
    The full path to the configuration file.
    This is usually the Ed-Fi-ODS-Implementation\Application\EdFi.Ods.WebApi\Web.Base.config for development
    and Ed-Fi-ODS-Implementation\Scripts\NuGet\EdFi.RestApi.Databases\Databases.config when deploying from the nuget package.
    #>
    param(
        [hashtable] $config
    )

    $script:configurationOverride.GetEnumerator() |
        ForEach-Object { $config[$_.key] = $script:configurationOverride[$_.key] }

    return $config
}

function Get-DeployConfig {
    <#
    .synopsis
    Gets merged configuration values from the configuration file and any overrides
    .description
    Gets merged configuration values taking both the fresh values from the configuration file set by the Set-DeployConfigFile function
    and overrides those values with any values set through the Set-DeployConfigOverride. Any parameters passed set through the override
    take precedence over values pulled from configuration files. This function should be called for every task that needs fresh values
    from a configuration file otherwise any configuration file changes will be ignored until the scripts are re-imported.
    #>
    $configuration = Get-Configuration $script:configurationFile -usePlugins:$script:configurationOverride.usePlugins

    $config = @{
        configFile = $script:configurationFile
        databaseIds = $configuration.databaseIds
        connectionStrings = $configuration.csbs
        filePaths = $configuration.FilePaths
        featureSubTypeNames = $configuration.SubTypes
        odsTokens = $null
        engine = 'SQLServer'
        dropDatabase = $false
        OdsDatabaseTemplateName = "minimal"
    }

    if ($script:configurationOverride.Count -ne 0) { $config = Merge-WithDeployConfig $config }

    return $config
}

function Reset-AdminDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-SecurityDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-EmptyTemplateDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-OdsDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Remove-SandboxDatabases { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-MinimalTemplateDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }
function Reset-PopulatedTemplateDatabase { Invoke-Task -name ($MyInvocation.MyCommand.Name) -task $deploymentTasks[$MyInvocation.MyCommand.Name] }

Set-Alias -Scope Global Reset-EmptyDatabase Reset-EmptyTemplateDatabase
Set-Alias -Scope Global Reset-PopulatedTemplate Reset-PopulatedTemplateDatabase
Set-Alias -Scope Global Remove-Sandboxes Remove-SandboxDatabases
Set-Alias -Scope Global Reset-YearSpecificDatabase Reset-OdsDatabase

$deploymentTasks = @{
    'Reset-AdminDatabase' = {
        $config = Get-DeployConfig
        $admin = $config.databaseIds.admin
        $params = @{
            engine = $config.engine
            csb = $config.connectionStrings[$admin.connectionStringKey]
            database = $admin.database
            filePaths = $config.FilePaths
            subTypeNames = $config.featureSubTypeNames
            dropDatabase = $config.dropDatabase
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-SecurityDatabase' = {
        $config = Get-DeployConfig
        $security = $config.databaseIds.security
        $params = @{
            engine = $config.engine
            csb = $config.connectionStrings[$security.connectionStringKey]
            database = $security.database
            filePaths = $config.FilePaths
            subTypeNames = $config.featureSubTypeNames
            dropDatabase = $config.dropDatabase
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-EmptyTemplateDatabase' = {
        $config = Get-DeployConfig
        $ods = $config.databaseIds.ods
        $connectionString = Get-DbConnectionStringBuilderFromTemplate -templateCSB $config.connectionStrings[$ods.connectionStringKey] -replacementTokens $config.emptyTemplateSuffix
        $params = @{
            engine = $config.engine
            csb = $connectionString
            database = $ods.database
            filePaths = $config.FilePaths
            subTypeNames = @()
            dropDatabase = $true
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-OdsDatabase' = {
        $config = Get-DeployConfig
        $ods = $config.databaseIds.ods
        $databaseName = "Ods"
        $replacementTokens = @($databaseName)
        if ($config.OdsDatabaseTemplateName -eq "populated")
        {
            $backupPath = Get-PopulatedTemplateBackupPath $config.configFile
        }
        else
        {
            $backupPath = Get-MinimalTemplateBackupPath $config.configFile
        }

        if ($config.odsTokens) { $replacementTokens = $config.odsTokens -split ';' | ForEach-Object { "${databaseName}_$($_)" } }
        $csbs = Get-DbConnectionStringBuilderFromTemplate -templateCSB $config.connectionStrings[$ods.connectionStringKey] -replacementTokens $replacementTokens
        foreach ($csb in $csbs) {
            $params = @{
                engine = $config.engine
                csb = $csb
                database = $ods.database
                filePaths = $config.FilePaths
                subTypeNames = $config.featureSubTypeNames
                dropDatabase = $config.dropDatabase
                createByRestoringBackup = $backupPath
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    'Remove-SandboxDatabases' = {
        $config = Get-DeployConfig
        if ($config.engine -ne 'SQLServer') { return; }
        $masterCSB = $config.connectionStrings[$config.databaseIds.master.connectionStringKey]
        $templateCSB = $config.connectionStrings[$config.databaseIds.ods.connectionStringKey]
        Remove-EdFiSandboxDatabases -masterCSB $masterCSB -edfiOdsTemplateCSB $templateCSB
    }
    'Reset-MinimalTemplateDatabase' = {
        $config = Get-DeployConfig
        $ods = $config.databaseIds.ods
        $backupPath = Get-MinimalTemplateBackupPath $config.configFile
        $params = @{
            engine = $config.engine
            csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $config.connectionStrings[$ods.connectionStringKey] -replacementTokens $config.minimalTemplateSuffix
            database = $ods.database
            filePaths = $config.FilePaths
            subTypeNames = $config.featureSubTypeNames
            dropDatabase = $true
            createByRestoringBackup = $backupPath
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
    'Reset-PopulatedTemplateDatabase' = {
        $config = Get-DeployConfig
        $ods = $config.databaseIds.ods
        $backupPath = Get-PopulatedTemplateBackupPath $config.configFile
        $params = @{
            engine = $config.engine
            csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $config.connectionStrings[$ods.connectionStringKey] -replacementTokens $config.populatedTemplateSuffix
            database = $ods.database
            filePaths = $config.FilePaths
            subTypeNames = $config.featureSubTypeNames
            dropDatabase = $true
            createByRestoringBackup = $backupPath
        }
        Initialize-EdFiDatabaseWithDbDeploy @params
    }
}

Export-ModuleMember -function * -Alias *
