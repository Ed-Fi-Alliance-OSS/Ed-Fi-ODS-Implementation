# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
.DESCRIPTION
    Deploys databases needed for Cloud ODS export

.PARAMETER sqlPackagePath
    An absolute path to the folder containing sqlpackage.exe. Example: C:/Program Files/Microsoft SQL Server/150/DAC/bin

.PARAMETER artifactPath
   An absolute path to the output folder to store artifacts.
#>
param(
    [Parameter(
        Mandatory = $true,
        HelpMessage = "Path to the sqlpackage.exe is required.`n`rExample: C:/Program Files/Microsoft SQL Server/150/DAC/bin"
    )]
    [ValidateNotNullOrEmpty()]
    [string] $sqlPackagePath,

    [Parameter(
        Mandatory = $true,
        HelpMessage = "Path the the output folder is required.`n`rExample: C:/tmp/artifacts"
    )]
    [ValidateNotNullOrEmpty()]
    [string] $artifactPath,

    [switch] $WhatIf
)

$ErrorActionPreference = 'Stop'

$repositoryNames = @('Ed-Fi-Ods', 'Ed-Fi-ODS-Implementation', 'Ed-Fi-ODS-Tools\Application\EdFi.Ods.AdminApp.Web')
& "$PSScriptRoot/../../../../../logistics/scripts/modules/load-path-resolver.ps1" $repositoryNames
$implementationRepo = Get-Item "$PSScriptRoot/../../../../.." | Select-Object -Expand Name
$env:toolsPath = $toolsPath = (Join-Path (Get-RepositoryRoot $implementationRepo) 'tools')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate/Modules/create-database-bacpac.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate/Modules/create-database-template.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/config/config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/database/database-lifecycle.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/database/database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/database/postgres-database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-management.psm1')

Clear-Error

Write-InvocationInfo $MyInvocation

# sql server specific settings
$settings = @{
    ApiSettings = @{
        Engine = 'SQLServer';
        Mode   = "SharedInstance"
    }
}

$newSettingsFiles = @(
    "$(Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi')/appsettings.json",
    "$(Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi')/appsettings.development.json"
)

New-DevelopmentAppSettings $settings

Write-Host 'created sql server settings files:' -ForegroundColor Green
$newSettingsFiles | Write-Host

$sqlServerConfig = Get-MergedAppSettings $newSettingsFiles

$sqlServerConfig = Set-Feature -Settings $sqlServerConfig -FeatureName "Extensions" -IsEnabled $false
$sqlServerConfig = Set-Feature -Settings $sqlServerConfig -FeatureName "ChangeQueries" -IsEnabled $true
$sqlServerConfig = Add-DeploymentSpecificSettings $sqlServerConfig

# postgres specific settings
Write-Host

$settings = @{
    ApiSettings = @{
        Engine = 'PostgreSQL'
    }
}

New-DevelopmentAppSettings $settings
Write-Host 'created postgres settings files:' -ForegroundColor Green
$newSettingsFiles | Write-Host

$postgreSQLConfig = Get-MergedAppSettings $newSettingsFiles

$postgreSQLConfig = Set-Feature -Settings $postgreSQLConfig -FeatureName "Extensions" -IsEnabled $false
$postgreSQLConfig = Set-Feature -Settings $postgreSQLConfig -FeatureName "ChangeQueries" -IsEnabled $true
$postgreSQLConfig = Add-DeploymentSpecificSettings $postgreSQLConfig

Write-Host
Write-Host "sqlServerConfig:" -ForegroundColor Green
Write-FlatHashtable $sqlServerConfig

Write-Host
Write-Host "postgreSQLConfig:" -ForegroundColor Green
Write-FlatHashtable $postgreSQLConfig

$deploymentTasks = @(
    @{
        Name   = "Deploy Admin Database to SQLServer"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Admin
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $params = @{
                engine       = $sqlServerConfig.ApiSettings.engine
                csb          = $sqlServerConfig.ApiSettings.csbs[$connectionStringKey]
                database     = $databaseType
                filePaths    = $sqlServerConfig.ApiSettings.FilePaths
                subTypeNames = $sqlServerConfig.ApiSettings.SubTypes
                dropDatabase = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Security Database to SQLServer"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Security
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $params = @{
                engine       = $sqlServerConfig.ApiSettings.engine
                csb          = $sqlServerConfig.ApiSettings.csbs[$connectionStringKey]
                database     = $databaseType
                filePaths    = $sqlServerConfig.ApiSettings.FilePaths
                subTypeNames = $sqlServerConfig.ApiSettings.SubTypes
                dropDatabase = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Empty Template Database to SQLServer"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $params = @{
                engine                  = $sqlServerConfig.ApiSettings.engine
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens "Ods_Empty_Template"
                database                = $databaseType
                filePaths               = $sqlServerConfig.ApiSettings.FilePaths
                subTypeNames            = $sqlServerConfig.ApiSettings.SubTypes
                dropDatabase            = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Minimal Template Database to SQLServer"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $backupPath = Get-MinimalTemplateBackupPathFromSettings $sqlServerConfig
            $params = @{
                engine                  = $sqlServerConfig.ApiSettings.engine
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Minimal_Template'
                database                = $databaseType
                filePaths               = $sqlServerConfig.ApiSettings.FilePaths
                subTypeNames            = $sqlServerConfig.ApiSettings.SubTypes
                dropDatabase            = $true
                createByRestoringBackup = $backupPath
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Populated Template Database to SQLServer"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $backupPath = Get-PopulatedTemplateBackupPathFromSettings $sqlServerConfig
            $params = @{
                engine                  = $sqlServerConfig.ApiSettings.engine
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Populated_Template'
                database                = $databaseType
                filePaths               = $sqlServerConfig.ApiSettings.FilePaths
                subTypeNames            = $sqlServerConfig.ApiSettings.SubTypes
                dropDatabase            = $true
                createByRestoringBackup = $backupPath
            }
            Initialize-EdFiDatabaseWithDbDeploy  @params
        }
    }
    @{
        Name   = "Deploy Admin Database to PostgreSQL"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Admin
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $params = @{
                engine       = $postgreSQLConfig.ApiSettings.engine
                csb          = $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey]
                database     = $databaseType
                filePaths    = $postgreSQLConfig.ApiSettings.FilePaths
                subTypeNames = $postgreSQLConfig.ApiSettings.SubTypes
                dropDatabase = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Security Database to PostgreSQL"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Security
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $params = @{
                engine       = $postgreSQLConfig.ApiSettings.engine
                csb          = $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey]
                database     = $databaseType
                filePaths    = $postgreSQLConfig.ApiSettings.FilePaths
                subTypeNames = $postgreSQLConfig.ApiSettings.SubTypes
                dropDatabase = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Empty Template Database to PostgreSQL"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $params = @{
                engine                  = $postgreSQLConfig.ApiSettings.engine
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens "Ods_Empty_Template"
                database                = $databaseType
                filePaths               = $postgreSQLConfig.ApiSettings.FilePaths
                subTypeNames            = $postgreSQLConfig.ApiSettings.SubTypes
                dropDatabase            = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Minimal Template Database to PostgreSQL"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $backupPath = Get-MinimalTemplateBackupPathFromSettings $postgreSQLConfig
            $params = @{
                engine                  = $postgreSQLConfig.ApiSettings.engine
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens "Ods_Minimal_Template"
                database                = $databaseType
                filePaths               = $postgreSQLConfig.ApiSettings.FilePaths
                subTypeNames            = $postgreSQLConfig.ApiSettings.SubTypes
                dropDatabase            = $true
                createByRestoringBackup = $backupPath
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Populated Template Database to PostgreSQL"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $backupPath = Get-PopulatedTemplateBackupPathFromSettings $postgreSQLConfig
            $params = @{
                engine                  = $postgreSQLConfig.ApiSettings.engine
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens "Ods_Populated_Template"
                database                = $databaseType
                filePaths               = $postgreSQLConfig.ApiSettings.FilePaths
                subTypeNames            = $postgreSQLConfig.ApiSettings.SubTypes
                dropDatabase            = $true
                createByRestoringBackup = $backupPath
            }
            Initialize-EdFiDatabaseWithDbDeploy  @params
        }
    }
    @{
        Name   = "Export Admin Database from SQLServer as .bak"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Admin
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = $sqlServerConfig.ApiSettings.csbs[$connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $sqlServerConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Security Database from SQLServer as .bak"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Security
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = $sqlServerConfig.ApiSettings.csbs[$connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $sqlServerConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Empty Template Database from SQLServer as .bak"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Empty_Template'
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $sqlServerConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Minimal Template Database from SQLServer as .bak"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Minimal_Template'
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $sqlServerConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Populated Template Database from SQLServer as .bak"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Populated_Template'
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $sqlServerConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Admin Database from SQLServer as .bacpac"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Admin
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = $sqlServerConfig.ApiSettings.csbs[$connectionStringKey]
            $databaseName = $csb["Database"]
            $params = @{
                sqlPackagePath = $sqlPackagePath
                database       = $databaseName
                artifactOutput = (Join-Path $artifactPath "EdFi_Admin.bacpac")
            }
            Export-BacPac @params
        }
    }
    @{
        Name   = "Export Security Database from SQLServer as .bacpac"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Security
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = $sqlServerConfig.ApiSettings.csbs[$connectionStringKey]
            $databaseName = $csb["Database"]
            $params = @{
                sqlPackagePath = $sqlPackagePath
                database       = $databaseName
                artifactOutput = (Join-Path $artifactPath "EdFi_Security.bacpac")
            }
            Export-BacPac @params
        }
    }
    @{
        Name   = "Export Empty Template Database from SQLServer as .bacpac"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Empty_Template'
            $databaseName = $csb["Database"]
            $params = @{
                sqlPackagePath = $sqlPackagePath
                database       = $databaseName
                artifactOutput = (Join-Path $artifactPath "EdFi_Ods.bacpac")
            }
            Export-BacPac @params
        }
    }
    @{
        Name   = "Export Minimal Template Database from SQLServer as .bacpac"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Minimal_Template'
            $databaseName = $csb["Database"]
            $params = @{
                sqlPackagePath = $sqlPackagePath
                database       = $databaseName
                artifactOutput = (Join-Path $artifactPath "EdFi_Ods_Minimal_Template.bacpac")
            }
            Export-BacPac @params
        }
    }
    @{
        Name   = "Export Populated Template Database from SQLServer as .bacpac"
        Script = {
            $databaseType = $sqlServerConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $sqlServerConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $sqlServerConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Populated_Template'
            $databaseName = $csb["Database"]
            $params = @{
                sqlPackagePath = $sqlPackagePath
                database       = $databaseName
                artifactOutput = (Join-Path $artifactPath "EdFi_Ods_Populated_Template.bacpac")
            }
            Export-BacPac @params
        }
    }
    @{
        Name   = "Export Admin Database from PostgreSQL as .sql"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Admin
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $postgreSQLConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Security Database from PostgreSQL as .sql"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Security
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $postgreSQLConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Empty Template Database from PostgreSQL as .sql"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Empty_Template'
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $postgreSQLConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Minimal Template Database from PostgreSQL as .sql"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Minimal_Template'
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $postgreSQLConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Populated Template Database from PostgreSQL as .sql"
        Script = {
            $databaseType = $postgreSQLConfig.ApiSettings.DatabaseTypes.Ods
            $connectionStringKey = $postgreSQLConfig.ApiSettings.ConnectionStringKeys[$databaseType]
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $postgreSQLConfig.ApiSettings.csbs[$connectionStringKey] -replacementTokens 'Ods_Populated_Template'
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = $postgreSQLConfig.ApiSettings.Engine
            }
            Backup-DatabaseTemplate $params
        }
    }
)

$script:result = @()

$elapsed = Use-StopWatch {
    foreach ($task in $deploymentTasks) {
        $script:result += Invoke-Task -name $task.Name -task $task.Script
    }
}

Test-Error

$script:result += New-TaskResult -name '-' -duration '-'
$script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format

return $script:result | Format-Table
