# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tasks\TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tools\ToolsHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\nuget-helper.psm1')

$script:toolsPath = (Get-ToolsPath)
$script:providerName = 'NuGet'
$script:packageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
$script:packageName = "PostgreSQL.Binaries"
$script:packageVersion = "12.2.0"

function Test-PostgreSQLBinariesInstalled {
    $packagePath = "$script:toolsPath/$script:packageName.$script:packageVersion"

    $psqlExists = (Test-Path "$packagePath/tools/psql.exe")
    $pgdumpExists = (Test-Path "$packagePath/tools/pg_dump.exe")
    $pgrestoreExists = (Test-Path "$packagePath/tools/pg_restore.exe")

    return ($psqlExists -and $pgdumpExists -and $pgrestoreExists)
}

function Get-PostgreSQLBinariesPath { return (Resolve-path "$script:toolsPath/$script:packageName.$script:packageVersion/tools/").Path }

function Get-PSQLPath { return (Resolve-path (Join-Path (Get-PostgreSQLBinariesPath) 'psql.exe')).Path }

function Get-PGDumpPath { return (Resolve-path (Join-Path (Get-PostgreSQLBinariesPath) 'pg_dump.exe')).Path }

function Get-PGRestorePath { return (Resolve-path (Join-Path (Get-PostgreSQLBinariesPath) 'pg_restore.exe')).Path }

function Install-PostgreSQLBinaries {
    # Ensure we have Tls12 support
    if (-not [Net.ServicePointManager]::SecurityProtocol.HasFlag([Net.SecurityProtocolType]::Tls12)) {
        [Net.ServicePointManager]::SecurityProtocol += [Net.SecurityProtocolType]::Tls12
    }

    $parameters = @{
        packageName     = $script:packageName
        packageVersion  = $script:packageVersion
        packageSource   = $script:packageSource
        outputDirectory = $script:toolsPath
        toolsPath       = $script:toolsPath
    }

    Write-Host "Installing $script:packageName version $script:packageVersion to $script:toolsPath"
    $packagePath = Get-NuGetPackage @parameters

    if (-not (Test-PostgreSQLBinariesInstalled)) {
        throw "Could not find PostgreSQL binaries in $script:toolsPath\$script:packageName\tools. "
    }
}

function Invoke-PsqlCommand {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName,

        [string[]] [Parameter(Mandatory = $true)] $commands
    )

    if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

    $params = @(
        "--echo-errors",
        "--quiet",
        "--no-password",
        "--tuples-only"
        "--host", $serverName,
        "--port", $portNumber,
        "--dbname", $databaseName
    )

    if ($userName) { $params += @("--username", $userName) }

    $commands | ForEach-Object { $params += @("--command", "`"$_`"") }

    $psql = Get-PSQLPath
    Write-Host -ForegroundColor Magenta "& $psql $params"
    & $psql $params
}

function Invoke-PsqlFile {
    Param (

        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName,

        [string] [Parameter(Mandatory = $true)] $filePath
    )

    if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

    $params = @(
        "--echo-errors",
        "--quiet",
        "--no-password",
        "--host", $serverName,
        "--port", $portNumber,
        "--dbname", $databaseName,
        "--file", $filePath
    )

    if ($userName) { $params += @("--username", $userName) }

    $psql = Get-PSQLPath
    Write-Host -ForegroundColor Magenta "& $psql $params"
    & $psql $params
}

function Install-PostgreSQLTemplate {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName,

        [string] [Parameter(Mandatory = $true)] $backupFile
    )

    if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

    if (-not (Test-Path $backupFile)) { Throw "File '$backupFile' does not exist" }

    $env:PGCLIENTENCODING = "utf-8"

    $parameters = @{
        serverName = $serverName
        portNumber = $portNumber
        userName   = $userName
    }

    Write-Host "Creating database $databaseName..."
    Invoke-PsqlCommand @parameters -command "CREATE DATABASE \`"$databaseName\`";" -databaseName "postgres"
    Test-Error

    Write-Host "Loading from backup: $backupFile..."
    Invoke-PsqlFile @parameters -filePath $backupFile -databaseName $databaseName
    Test-Error

    Write-Host "Done loading the $databaseName database."
}

function Set-PostgresSQLDatabaseAsTemplate {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName
    )

    if ($databaseName -match "Template$") {
        if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

        $parameters = @{
            serverName   = $serverName
            portNumber   = $portNumber
            userName     = $userName
            databaseName = 'postgres'
            commands     = @(
                "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='$databaseName';"
                "SET client_min_messages TO ERROR;"
                "UPDATE pg_database SET datistemplate='true', datallowconn='false' WHERE datname in ('$databaseName');"
            )
        }

        ## for the templates we want to set the databases as readonly, and as a template database.
        Write-Host "Setting template flag on database $databaseName...";
        Invoke-PsqlCommand @parameters
        Test-Error
    }
}


function Remove-PostgresSQLDatabaseAsTemplate {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName
    )

    if ($databaseName -match "Template$") {
        if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

        $parameters = @{
            serverName   = $serverName
            portNumber   = $portNumber
            userName     = $userName
            databaseName = 'postgres'
            commands     = @(
                "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='$databaseName';"
                "SET client_min_messages TO ERROR;"
                "UPDATE pg_database SET datistemplate='false', datallowconn='true' WHERE datname in ('$databaseName');"
            )
        }

        ## for the templates we want to set the databases as readonly, and as a template database.
        Write-Host "Remove template flag on database if $databaseName already exists..."
        Invoke-PsqlCommand @parameters
        Test-Error
    }
}

function Remove-PostgreSQLDatabase {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName
    )

    if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

    $parameters = @{
        serverName   = $serverName
        portNumber   = $portNumber
        userName     = $userName
        databaseName = 'postgres'
        commands     = @(
            "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='$databaseName';"
            # Since log_destination defaults to stderr we are limmiting messages to errors only.
            # This suppresses any non-error messages from outputting through stderr and causing TeamCity build failures
            # while still allowing any errors to fail the build.
            "SET client_min_messages TO ERROR;"
            # note: the backslash is required for passing quotation mark into psql command line, and
            # the backtick is required for escaping the quotation mark in PowerShell.
            "DROP DATABASE IF EXISTS \`"$databaseName\`";"
        )
    }

    Write-Host "Drop database $databaseName if it already exists..."

    Invoke-PsqlCommand @parameters
    Test-Error
}

function Remove-EdFiPostgresSandboxDatabases {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] [Parameter(Mandatory = $true)] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseTemplate
    )

    $params = @{
        serverName        = $serverName
        portNumber        = $portNumber
        userName          = $userName
        databaseTemplate  = $databaseTemplate
    }

    $sandboxNames = Get-SandboxDatabaseNames @params

    $params.remove('databaseTemplate')

    foreach($sandboxName in $sandboxNames){
        $params.databaseName = $sandboxName
        Remove-PostgreSQLDatabase @params
    }
}
function Get-SandboxDatabaseNames {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] [Parameter(Mandatory = $true)] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseTemplate
    )

    $sandboxNames = [System.Collections.ArrayList]::new()

    if ($databaseTemplate -like '*{0}*'){
        $templateBaseName = $databaseTemplate -f "Ods_Sandbox_"

        $parameters = @{
            serverName   = $serverName
            portNumber   = $portNumber
            userName     = $userName
            databaseName = 'postgres'
            commands     = "select datname from pg_database where datname similar to '$templateBaseName%';"
        }

        $results = Invoke-PsqlCommand @parameters
        Test-Error

        foreach($item in $results){
            if (-not [string]::IsNullOrEmpty($item)){
                $sandboxNames.Add($item.trim()) | Out-Null
            }
        }
    }

    return ,$sandboxNames
}

function Backup-PostgreSQLDatabase {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] [Parameter(Mandatory = $true)] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName,

        [string] [Parameter(Mandatory = $true)] $filePath
    )

    if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

    $parameters = @{
        serverName   = $serverName
        portNumber   = $portNumber
        userName     = $userName
        databaseName = $databaseName
    }

    Remove-PostgresSQLDatabaseAsTemplate @parameters

    $params = @(
        "--no-password",
        "--encoding", "utf-8"
        "--host", $serverName,
        "--port", $portNumber,
        "--username", $userName,
        "--dbname", $databaseName,
        "--file", $filePath
    )

    $pg_dump = Get-PGDumpPath
    Write-Host -ForegroundColor Magenta "& $pg_dump $params"
    & $pg_dump $params
    Test-Error

    Set-PostgresSQLDatabaseAsTemplate @parameters
}

function Test-PostgreSQLDatabaseExists {
    Param (
        [string] [Parameter(Mandatory = $true)] $serverName,

        [string] [Parameter(Mandatory = $true)] $portNumber,

        [string] $userName,

        [string] [Parameter(Mandatory = $true)] $databaseName
    )

    if (-not (Test-PostgreSQLBinariesInstalled)) { Install-PostgreSQLBinaries }

    $parameters = @{
        serverName   = $serverName
        portNumber   = $portNumber
        userName     = $userName
        databaseName = 'postgres'
        commands     = "SELECT EXISTS( SELECT datname FROM pg_catalog.pg_database WHERE datname='$databaseName' );"
    }

    Write-Host "Checking if database $databaseName already exists..."

    $result = Invoke-PsqlCommand @parameters
    Test-Error

    # result is either t or f with extra whitespace
    return ($result[0].Trim() -eq 't')
}

Export-ModuleMember -Function `
    Install-PostgreSQLBinaries,
Get-PsqlPath,
Get-PGDumpPath,
Get-PGRestorePath,
Remove-PostgreSQLDatabase,
Install-PostgreSQLTemplate,
Invoke-PsqlCommand,
Backup-PostgreSQLDatabase,
Test-PostgreSQLDatabaseExists,
Set-PostgresSQLDatabaseAsTemplate,
Remove-PostgresSQLDatabaseAsTemplate,
Get-SandboxDatabaseNames,
Remove-EdFiPostgresSandboxDatabases
