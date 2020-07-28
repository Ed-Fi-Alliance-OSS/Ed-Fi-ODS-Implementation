# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
.DESCRIPTION
    Deploys databases needed for Cloud ODS export

.PARAMETER sqlPackagePath
    An absolute path to the folder containing sqlpackage.exe. Example: C:\Program Files\Microsoft SQL Server\150\DAC\bin

.PARAMETER artifactPath
   An absolute path to the output folder to store artifacts.
#>
param(
    [Parameter(
        Mandatory = $true,
        HelpMessage = "Path to the sqlpackage.exe is required.`n`rExample: C:\Program Files\Microsoft SQL Server\150\DAC\bin"
    )]
    [ValidateNotNullOrEmpty()]
    [string] $sqlPackagePath,

    [Parameter(
        Mandatory = $true,
        HelpMessage = "Path the the output folder is required.`n`rExample: C:\tmp\artifacts"
    )]
    [ValidateNotNullOrEmpty()]
    [string] $artifactPath,

    [switch] $WhatIf
)

$ErrorActionPreference = 'Stop'

$repositoryNames = @('Ed-Fi-Ods', 'Ed-Fi-ODS-Implementation', 'Ed-Fi-ODS-Tools\Application\EdFi.Ods.AdminApp.Web')
& "$PSScriptRoot\..\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1" $repositoryNames

$implementationRepo = Get-Item "$PSScriptRoot\..\.." | Select-Object -Expand Name
$env:toolsPath = $toolsPath = (Join-Path (Get-RepositoryRoot $implementationRepo) 'tools')

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\create-database-bacpac.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\create-database-template.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-lifecycle.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\postgres-database-management.psm1')

Clear-Error

Write-InvocationInfo $MyInvocation

$baseConfig = (Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi\Web.Base.config')
$transformFile = (Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi\Web.AzureCloudODS.config') 
$destinationFile = ($baseConfig -replace "base.", "")
Invoke-TransformConfigFile -sourceFile $baseConfig -transformFiles $transformFile  -destinationFile $destinationFile
    
$sqlServerConfig = $destinationFile
$postgreSQLConfig = (Get-RepositoryResolvedPath 'Application\EdFi.Ods.WebApi\Web.Npgsql.config')

Write-Host "sqlServerConfig $sqlServerConfig"
Write-Host "postgreSQLConfig $postgreSQLConfig"

$script:sqlServerConnectionStrings = Get-DbConnectionStringBuilderFromConfig $sqlServerConfig
$script:postgreSQLConnectionStrings = Get-DbConnectionStringBuilderFromConfig $postgreSQLConfig
$script:databaseIds = Get-DatabaseIds

$config = Get-Configuration $sqlServerConfig
$FeatureSubTypeNames = $config.SubTypes
$databaseScriptFilePaths = $config.filePaths

$deploymentTasks = @(
    @{
        Name   = "Deploy Admin Database to SQLServer"
        Script = {
            $params = @{
                engine         = 'SQLServer'
                csb            = $script:sqlServerConnectionStrings[$databaseIds.admin.connectionStringKey]
                database       = $databaseIds.admin.database
                filePaths      = $databaseScriptFilePaths
                subTypeNames   = $FeatureSubTypeNames
                transient      = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Security Database to SQLServer"
        Script = {
            $params = @{
                engine         = 'SQLServer'
                csb            = $script:sqlServerConnectionStrings[$databaseIds.security.connectionStringKey]
                database       = $databaseIds.security.database
                filePaths      = $databaseScriptFilePaths
                subTypeNames   = $FeatureSubTypeNames
                transient      = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Empty Template Database to SQLServer"
        Script = {
            $params = @{
                engine         = 'SQLServer'
                csb            = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Empty_Template"
                database       = $databaseIds.ods.database
                filePaths      = $databaseScriptFilePaths
                subTypeNames   = $FeatureSubTypeNames
                transient      = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Minimal Template Database to SQLServer"
        Script = {
            $backupPath = Get-MinimalTemplateBackupPath $sqlServerConfig
            $params = @{
                engine                  = 'SQLServer'
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Minimal_Template"
                database                = $databaseIds.ods.database
                filePaths               = $databaseScriptFilePaths
                subTypeNames            = $FeatureSubTypeNames
                createByRestoringBackup = $backupPath
                transient               = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Populated Template Database to SQLServer"
        Script = {
            $backupPath = Get-PopulatedTemplateBackupPath $sqlServerConfig
            $params = @{
                engine                  = 'SQLServer'
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Populated_Template"
                database                = $databaseIds.ods.database
                filePaths               = $databaseScriptFilePaths
                subTypeNames            = $FeatureSubTypeNames
                createByRestoringBackup = $backupPath
                transient               = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy  @params
        }
    }
    @{
        Name   = "Deploy Admin Database to PostgreSQL"
        Script = {
            $params = @{
                engine         = 'PostgreSQL'
                csb            = $script:postgreSQLConnectionStrings[$databaseIds.admin.connectionStringKey]
                database       = $databaseIds.admin.database
                filePaths      = $databaseScriptFilePaths
                subTypeNames   = $FeatureSubTypeNames
                transient      = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Security Database to PostgreSQL"
        Script = {
            $params = @{
                engine         = 'PostgreSQL'
                csb            = $script:postgreSQLConnectionStrings[$databaseIds.security.connectionStringKey]
                database       = $databaseIds.security.database
                filePaths      = $databaseScriptFilePaths
                subTypeNames   = $FeatureSubTypeNames
                transient      = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Empty Template Database to PostgreSQL"
        Script = {
            $params = @{
                engine         = 'PostgreSQL'
                csb            = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Empty_Template"
                database       = $databaseIds.ods.database
                filePaths      = $databaseScriptFilePaths
                subTypeNames   = $FeatureSubTypeNames
                transient      = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Minimal Template Database to PostgreSQL"
        Script = {
            $backupPath = Get-MinimalTemplateBackupPath $postgreSQLConfig
            $params = @{
                engine                  = 'PostgreSQL'
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Minimal_Template"
                database                = $databaseIds.ods.database
                filePaths               = $databaseScriptFilePaths
                subTypeNames            = $FeatureSubTypeNames
                createByRestoringBackup = $backupPath
                transient               = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy @params
        }
    }
    @{
        Name   = "Deploy Populated Template Database to PostgreSQL"
        Script = {
            $backupPath = Get-PopulatedTemplateBackupPath $postgreSQLConfig
            $params = @{
                engine                  = 'PostgreSQL'
                csb                     = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Populated_Template"
                database                = $databaseIds.ods.database
                filePaths               = $databaseScriptFilePaths
                subTypeNames            = $FeatureSubTypeNames
                createByRestoringBackup = $backupPath
                transient               = $true
            }
            Initialize-EdFiDatabaseWithDbDeploy  @params
        }
    }
    @{
        Name   = "Export Admin Database from SQLServer as .bak"
        Script = {
            $csb = $script:sqlServerConnectionStrings[$databaseIds.admin.connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "SQLServer"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Security Database from SQLServer as .bak"
        Script = {
            $csb = $script:sqlServerConnectionStrings[$databaseIds.security.connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "SQLServer"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Empty Template Database from SQLServer as .bak"
        Script = {
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods"
            $params = @{
                databaseConnectionString = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Empty_Template"
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "SQLServer"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Minimal Template Database from SQLServer as .bak"
        Script = {
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Minimal_Template"
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "SQLServer"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Populated Template Database from SQLServer as .bak"
        Script = {
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Populated_Template"
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "SQLServer"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Admin Database from SQLServer as .bacpac"
        Script = {
            $csb = $script:sqlServerConnectionStrings[$databaseIds.admin.connectionStringKey]
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
            $csb = $script:sqlServerConnectionStrings[$databaseIds.security.connectionStringKey]
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
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Empty_Template"
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
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Minimal_Template"
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
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:sqlServerConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Populated_Template"
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
            $csb = $script:postgreSQLConnectionStrings[$databaseIds.admin.connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "PostgreSQL"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Security Database from PostgreSQL as .sql"
        Script = {
            $csb = $script:postgreSQLConnectionStrings[$databaseIds.security.connectionStringKey]
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "PostgreSQL"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Empty Template Database from PostgreSQL as .sql"
        Script = {
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods"
            $params = @{
                databaseConnectionString = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Empty_Template"
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "PostgreSQL"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Minimal Template Database from PostgreSQL as .sql"
        Script = {
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Minimal_Template"
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "PostgreSQL"
            }
            Backup-DatabaseTemplate $params
        }
    }
    @{
        Name   = "Export Populated Template Database from PostgreSQL as .sql"
        Script = {
            $csb = Get-DbConnectionStringBuilderFromTemplate -templateCSB $script:postgreSQLConnectionStrings[$databaseIds.ods.connectionStringKey] -replacementTokens "Ods_Populated_Template"
            $params = @{
                databaseConnectionString = $csb
                databaseBackupName       = $csb["Database"]
                backupDirectory          = $artifactPath
                multipleBackups          = $true
                engine                   = "PostgreSQL"
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
