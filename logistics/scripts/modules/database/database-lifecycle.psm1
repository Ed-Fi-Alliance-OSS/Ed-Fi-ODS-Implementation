# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\postgres-database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tasks\TaskHelper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tools\ToolsHelper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')

<#
.description
Runs the dotnet tool "EdFi.Db.Deploy" with WhatIf verb to determine whether there are migration scripts on the filesystem that haven't been applied to an Ed-Fi database

.parameter Engine
The database engine provider, either "SQLServer" or "PostgreSQL"

.parameter Database
The database type to be deployed.

.parameter ConnectionString
The full connection string to the database server.

.parameter FilePaths
An array of paths to database script diretories. It may contain paths to extension script directories.

.parameter Features
An optional array of features (aka "sub types") to deploy.

.example
Test with the ODS database, with GrandBend and Sample extensions and with
Change Queries enabled, to the "EdFi_Ods" database on a local SQL
Server instance:

$splat = @{
    Engine = "SQLServer";
    Database = "EdFi";
    ConnectionString = "server=localhost;database=EdFi_Ods;integrated security=sspi";
    FilePaths = @(
            "C:\Source\3.x\Ed-Fi-ODS",
            "C:\Source\3.x\Ed-Fi-ODS-Implementation",
            "C:\Source\3.x\Ed-Fi-ODS-Implementation\Application\EdFi.Ods.Extensions.GrandBend",
            "C:\Source\3.x\Ed-Fi-ODS-Implementation\Application\EdFi.Ods.Extensions.Sample"
    );
    Features = @(
        "Changes"
    )
}
Test-DatabaseHasScriptsToApply @splat
#>
function Test-DatabaseHasScriptsToApply {

    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine = 'SQLServer',

        # EdFi, EdFi_Admin, and EdFiSecurity are the "database id" values in the
        # initdev process. The real values of ODS, Admin, and Security are
        # provided as a convenience for those who directly invoke this command.
        [ValidateSet('EdFi', 'EdFi_Admin', 'EdFiSecurity', 'Ods', 'Admin', 'Security')]
        [String] $Database = 'EdFi',

        [Parameter(Mandatory = $true)] [String] $ConnectionString,

        [Parameter(Mandatory = $true)]
        [String[]]
        $FilePaths,

        [String[]]
        [AllowNull()]
        [AllowEmptyCollection()]
        $Features = @()
    )

    $exitCode = Invoke-DbDeploy -Verb "WhatIf" -Database $Database -ConnectionString $ConnectionString -FilePaths $FilePaths -Features $Features

    return $exitCode -eq 1
}

<#
.synopsis
Initialize a database and apply migrations

.parameter csb
A Connection String Builder object for the database to build

.parameter database
The database type to use when loading

.parameter filePaths
Array of paths to sql scripts and extension directories

.parameter subTypeNames
Scripts with these SubType names should be included. These should be
"normalized" aka contain no spaces.

.parameter dropDatabase
The database is "transient" - that is, it's dropped if it already exists, and
it isn't backed up. By default, all databases are considered "persistent". That
is, not dropped if they already exists, but migrated instead, and backed up
before migrations are applied.

.parameter createByRestoringBackup
Instead of creating the database from scratch, use this backup file. After the
backup is restored, the database will be synced normally. Note: The backup file
must have a dbo.DeployJournal like the module expects.

.parameter msSqlBackupPath
A location to store backups of databases before they are dropped or migrated.
If this is not provided, the default backup path on the SQL server is used.
#>
function Initialize-EdFiDatabaseWithDbDeploy {
    [CmdletBinding()]
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $engine = 'SQLServer',

        [Parameter(Mandatory = $true)]
        [string] $database,

        [Parameter(Mandatory = $true)]
        [System.Data.Common.DbConnectionStringBuilder] $csb,

        [Parameter(Mandatory = $true)]
        [string[]] $filePaths,

        [string[]] $subTypeNames,

        [Alias('transient')]
        [switch] $dropDatabase,

        [string] $createByRestoringBackup,

        [string] $msSqlBackupPath

    )

    Write-InvocationInfo $MyInvocation

    if ($engine -eq 'PostgreSQL') {
        $scriptParams = @{
            serverName   = $csb.host
            portNumber   = $csb.port
            userName     = $csb.username
            databaseName = $csb.database
        }

        Remove-PostgresSQLDatabaseAsTemplate @scriptParams

        if ($dropDatabase) {
            Remove-PostgreSQLDatabase @scriptParams
        }

        $databaseExists = (Test-PostgreSQLDatabaseExists @scriptParams)

        if (-not ($databaseExists) -and $createByRestoringBackup) {
            $params = @{
                serverName   = $csb.host
                portNumber   = $csb.port
                userName     = $csb.username
                databaseName = $csb.database
                backupFile   = $createByRestoringBackup
            }
            Install-PostgreSQLTemplate @params
        }

        $params = @{
            Verb             = "Deploy"
            Engine           = $Engine
            Database         = $database
            ConnectionString = $csb
            FilePaths        = $filePaths
            Features         = $subTypeNames
        }
        Invoke-DbDeploy @params

        Set-PostgresSQLDatabaseAsTemplate @scriptParams
        return;
    }

    $csb = Convert-CommonDbCSBtoSqlCSB $csb

    $msSqlBackupPath = if ($msSqlBackupPath) { $msSqlBackupPath } else { Get-Server -csb $csb | Select-Object -Expand BackupDirectory }

    $databaseNeedsBackup = (
        (-not $dropDatabase) -and
        (Test-DatabaseExists -csb $csb) -and
        (Test-DatabaseHasScriptsToApply -Database $database -ConnectionString $csb -FilePaths $filePaths -Features $subTypeNames)
    )

    if ($databaseNeedsBackup) {
        Write-Host "Backing up database $($csb.InitialCatalog) to $msSqlBackupPath..."
        Backup-Database -csb $csb -backupDirectory "$msSqlBackupPath\" -overwriteExisting | Out-Null
    }
    else {
        Write-Host "No backup required for database $($csb.InitialCatalog)"
    }

    if ($dropDatabase) {
        Remove-Database -csb $csb -safe | Out-Null
    }

    if (-not (Test-DatabaseExists -csb $csb)) {
        if ($createByRestoringBackup) {
            # Copy the backup to a location that the SQL Server has permission to see
            Write-Host "Using backup $createByRestoringBackup"
            $backupDir = if ($msSqlBackupPath) { $msSqlBackupPath } else { Get-Server -csb $csb | Select-Object -Expand BackupDirectory }
            $restorableBackup = Copy-Item $createByRestoringBackup $backupDir -passthru
            Write-Host "Copying to backup directory $backupDir"
            Restore-Database -csb $csb -backupFile $restorableBackup
        }
        else {
            $recoveryModel = if ($dropDatabase) { "Simple" } else { "Full" }

            $s = Get-Server -csb $csb
            $databaseName = $csb['Initial Catalog']
            $db = New-Database -sqlServer $s -databaseName $databaseName -recoveryModel $recoveryModel
        }
    }

    $params = @{
        Verb             = "Deploy"
        Engine           = $Engine
        Database         = $database
        ConnectionString = $csb
        FilePaths        = $filePaths
        Features         = $subTypeNames
    }
    Invoke-DbDeploy @params
}

<#
.description
Remove all sandbox ODS databases

.parameter masterCSB
A CSB with sysadmin credentials on the database server

.parameter edfiOdsTemplateDbName
A database name with a placeholder {0} token in it. The function replaces the
token with the string "Sandbox_", and assumes that any database that
with the resulting string is a sandbox

.example
Remove-EdFiSandboxDatabases -masterCSB $masterCSB -edfiOdsTemplateDbName "EdFi_Ods_{0}"
In this example, the function looks for databases that begin with the string
"EdFi_Ods_Sandbox_" and deletes them.
#>
function Remove-EdFiSandboxDatabases {
    [CmdletBinding()] param(
        [Parameter(Mandatory = $true)] [System.Data.Common.DbConnectionStringBuilder] $masterCSB,
        [Parameter(Mandatory = $true)] [System.Data.Common.DbConnectionStringBuilder] $edfiOdsTemplateCSB,
        [Parameter(Mandatory = $true)] [String] $Engine
    )

    if ($Engine -eq 'SQLServer') {
        Remove-SqlServerSandboxDatabase $masterCSB $edfiOdsTemplateCSB
    }
    else{
        $params = @{
            serverName       = $masterCSB["host"]
            portNumber       = $masterCSB["port"]
            userName         = $masterCSB["username"]
            databaseTemplate = $edfiOdsTemplateCSB["database"]
        }

        Remove-EdFiPostgresSandboxDatabases @params
    }
}

function Remove-SqlServerSandboxDatabase {
    param(
        [System.Data.Common.DbConnectionStringBuilder] $masterCSB,
        [System.Data.Common.DbConnectionStringBuilder] $edfiOdsTemplateCSB
    )

    $masterCSB = Convert-CommonDbCSBtoSqlCSB $masterCSB
    $edfiOdsTemplateCSB = Convert-CommonDbCSBtoSqlCSB $edfiOdsTemplateCSB

    # If we don't throw here, the .StartsWith() command below will match all databases, including system databases
    $templateInitialCatalog = $edfiOdsTemplateCSB['Initial Catalog']
    if (-not $templateInitialCatalog) {
        throw "The template CSB does not define an initial catalog"
    }

    $templateBaseName = $templateInitialCatalog -f "Ods_Sandbox_"

    if ($templateInitialCatalog -like '*{0}*') {
        $smo = Get-Server -csb $masterCSB
        foreach ($db in $smo.Databases) {
            if ($db.Name.StartsWith("$templateBaseName")) {
                Write-Verbose "Removing sandbox database: $($db.Name)"
                $sandboxCSB = New-DbConnectionStringBuilder -existingCSB $masterCSB -property @{Database = $db.Name }
                Remove-Database -csb $sandboxCSB
            }
        }
    }
}

Export-ModuleMember -Function *
