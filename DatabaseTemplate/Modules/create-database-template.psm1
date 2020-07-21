# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = "Stop"


& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\database-template-source.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-transform.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-lifecycle.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\postgres-database-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\LoadTools.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\nuget-helper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\packaging.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\restore-packages.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tasks\TaskHelper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\TestHarness.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\xml-validation.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'Scripts\NuGet\EdFi.RestApi.Databases\Deployment.psm1')

$global:templateConfiguration = @{ }
$global:templateConfigurationScript = { }

function Get-DefaultTemplateConfiguration {
    $config = @{ }

    Merge-Configurations $config (Get-EnvironmentConfiguration)

    $config.configFile = "$($config.outputFolder)\EdFi.Ods.Api.IntegrationTestHarness.exe.config"
    Merge-Configurations $config (Get-Configuration -configFile $config.configFile)

    $config.apiUrlBase = "http://localhost:8765"
    $config.apiUrlOAuth = "$($config.apiUrlBase)/oauth"
    $config.apiUrlMetadata = "$($config.apiUrlBase)/metadata"
    $config.apiUrlData = "$($config.apiUrlBase)/data/v3"
    $config.apiUrlDependencies = "$($config.apiUrlMetadata)/data/v3/dependencies"
    $config.apiClientNameBootstrap = "BulkLoadClientBootstrap"
    $config.apiClientNameSandbox = "BulkLoadClientSandbox"
    $config.apiYear = (Get-Date).Year

    $config.testHarnessExecutable = "$($config.outputFolder)\EdFi.Ods.Api.IntegrationTestHarness.exe"
    $config.testHarnessAppConfig = $config.configFile
    $config.testHarnessJsonConfig = "$PSScriptRoot\testHarnessConfiguration.json"
    $config.testHarnessJsonConfigLEAs = @(255901)

    $config.loadToolsSolution = (Get-RepositoryResolvedPath "Utilities\DataLoading\LoadTools.sln")
    $config.bulkLoadClientExecutable = "$(Get-RepositoryResolvedPath "Utilities\DataLoading\EdFi.BulkLoadClient.Console")\bin\**\EdFi.BulkLoadClient.Console.exe"
    $config.bulkLoadBootstrapInterchanges = @("InterchangeDescriptors", "InterchangeStandards", "InterchangeEducationOrganization")
    $config.bulkLoadDirectorySchema = (Get-RepositoryResolvedPath "Application\EdFi.Ods.Standard\Artifacts\Schemas\")
    $config.bulkLoadDirectoryMetadata = (Get-RepositoryResolvedPath "Application\EdFi.Ods.Standard\Artifacts\Metadata\")
    $config.bulkLoadTempDirectory = Join-Path $env:temp "CreateDatabaseTemplate"
    $config.bulkLoadTempDirectorySchema = Join-Path $config.bulkLoadTempDirectory "Schemas"
    $config.bulkLoadTempDirectoryBootstrap = Join-Path $config.bulkLoadTempDirectory "Bootstrap"
    $config.bulkLoadTempDirectorySample = Join-Path $config.bulkLoadTempDirectory "Sample"
    $config.bulkLoadTempJsonConfig = Join-Path $config.bulkLoadTempDirectory "config.json"
    $config.bulkLoadMaxRequests = 500

    $config.database = $config.databaseIds.ods.database
    $config.databaseConnectionString = $config.csbs[$config.databaseIds.ods.connectionStringKey]
    $config.databaseAllowedSchemas = @('auth', 'edfi', 'interop', 'util')
    $config.noChanges = $true
    $config.databaseBackupName = "EdFi.Ods.Populated.Template"
    $config.packageNuspecName = "EdFi.Ods.Populated.Template"

    return $config
}

function Get-EnvironmentConfiguration {
    $config = @{ }

    $config.buildConfiguration = "Debug"
    if ($global:templateConfiguration.ContainsKey('engine') -and $global:templateConfiguration.engine -eq 'PostgreSQL') {
        $config.buildConfiguration = "Npgsql"
    }
    if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $config.buildConfiguration = $env:msbuild_buildConfiguration }
    if (-not [string]::IsNullOrWhiteSpace($env:msbuild_exe)) { $config.msbuild_exe = $env:msbuild_exe }

    $projectPath = Get-RepositoryResolvedPath "Application\EdFi.Ods.Api.IntegrationTestHarness"
    $config.outputFolder = (Get-ChildItem "$projectPath\bin\$($config.buildConfiguration)\*\").FullName

    return $config
}

function Merge-Configurations {
    param(
        [hashtable] $target,
        [hashtable] $source
    )

    $source.GetEnumerator() | ForEach-Object { $target[$_.key] = $source[$_.key] }
}

function Set-TemplateConfigurationScript {
    param(
        [scriptblock] $templateConfigurationScript
    )

    $global:templateConfigurationScript = $templateConfigurationScript
}

function Get-TemplateConfiguration {
    Merge-Configurations $global:templateConfiguration (& $global:templateConfigurationScript)

    return $global:templateConfiguration
}

function Invoke-SampleXmlValidation {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    if ($config.noValidation) { Write-Host "Validation skipped."; return }

    $params = @{
        source  = $config.samplePath
        recurse = $true
    }
    Invoke-XmlValidation @params
}

function New-DatabaseTemplate {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $filePaths = $config.filePaths
    if ($config.noExtensions) {
        Write-Host "Skipping extensions sources."
        $filePaths = Get-RepositoryArtifactPaths
    }

    $params = @{
        csb             = $config.databaseConnectionString
        engine          = $config.engine
        database        = $config.database
        filePaths       = $filePaths
        subTypeNames    = @()
        transient       = $true
    }
    if ($config.createByRestoringBackup) { $params.createByRestoringBackup = $config.createByRestoringBackup }
    Initialize-EdFiDatabaseWithDbDeploy @params
}

function New-TempDirectory {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    if ([string]::IsNullOrWhiteSpace($config.bulkLoadTempDirectory)) {
        Write-Host "No 'bulkLoadTempDirectory' parameter defined in config."
        return
    }

    $directory = $config.bulkLoadTempDirectory
    if (Test-Path $directory) { Remove-Item $directory -Force -Recurse }

    $directory = New-Item -Force $directory -ItemType Directory

    Write-Host "Created Temp Directory: " -ForegroundColor Green -NoNewline
    Write-Host $directory
    Write-Host
}

function Copy-SchemaFiles {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $directory = New-Item -Force $config.bulkLoadTempDirectorySchema -ItemType Directory
    foreach ($schemaDirectory in $config.schemaDirectories) {
        $xsdFiles = Get-ChildItem $schemaDirectory -Recurse -Filter "*.xsd"
        foreach ($xsdFile in $xsdFiles) {
            $elapsed = Use-Stopwatch {
                Write-Host "copy to $($directory.Name)\$($xsdFile.Name) " -NoNewline
                Copy-Item -Path $xsdFile.FullName -Destination "$directory\$xsdFile"
            }
            Write-Host $elapsed.duration -ForegroundColor DarkGray
        }
    }
}

function Copy-InterchangeFiles {
    param(
        [hashtable] $config
    )

    $directory = New-Item -Force $config.directory -ItemType Directory
    $interchanges = $config.interchanges
    $xmlFiles = Get-ChildItem $config.xmlFiles -Recurse -Filter "*.xml"

    $includeAllInterchanges = ([string]::IsNullOrWhiteSpace($interchanges)) -or ($interchanges.Length -eq 0)

    foreach ($xmlFile in $xmlFiles) {
        if ($includeAllInterchanges -or ($interchanges -contains (Get-XmlRoot $xmlFile.FullName).Name)) {
            $elapsed = Use-Stopwatch {
                Write-Host "copy to $($directory.Name)\$($xmlFile.Name) " -NoNewline
                Copy-Item -Path $xmlFile.FullName -Destination "$directory\$xmlFile"
            }
            Write-Host $elapsed.duration -ForegroundColor DarkGray
        }
    }
}

function Copy-BootstrapInterchangeFiles {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    if ([string]::IsNullOrWhiteSpace($config.bulkLoadTempDirectoryBootstrap)) {
        Write-Host "No 'bulkLoadTempDirectoryBootstrap' parameter defined in config."
        return
    }

    $params = @{
        directory    = $config.bulkLoadTempDirectoryBootstrap
        interchanges = $config.bulkLoadBootstrapInterchanges
        xmlFiles     = $config.samplePath
    }

    Copy-InterchangeFiles $params
}

function Copy-SampleInterchangeFiles {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    if ([string]::IsNullOrWhiteSpace($config.bulkLoadTempDirectorySample)) {
        throw "No 'bulkLoadTempDirectorySample' parameter defined in config."
    }

    $params = @{
        directory    = $config.bulkLoadTempDirectorySample
        interchanges = $config.bulkLoadSampleInterchanges
        xmlFiles     = $config.samplePath
    }

    Copy-InterchangeFiles $params
}

function Get-SQLServerDatabaseRecordCount {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    $params = @{
        connectionString = $config.databaseConnectionString
        sql = "
        CREATE TABLE #tempcount (tablename NVARCHAR(128), record_count BIGINT)
        EXEC sp_msforeachtable 'INSERT #tempcount SELECT ''?'', COUNT(*) FROM ? WITH (nolock)'
        SELECT SUM(record_count)
        FROM #tempcount
        DROP TABLE #tempcount
        "
        returnDataSet = $true
    }
    $dataSet = Invoke-SqlScript @params
    return $dataSet.Tables[0].Rows[0][0]
}

function Get-PostgreSQLDatabaseRecordCount {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    $params = @{
        serverName = $config.databaseConnectionString.host
        portNumber = $config.databaseConnectionString.port
        userName = $config.databaseConnectionString.username
        databaseName = $config.databaseConnectionString.database
        commands = "
        SELECT SUM(x.reltuples)
        FROM (
            SELECT nspname AS schemaname,relname,reltuples
            FROM pg_class C
            LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
            WHERE nspname NOT IN ('pg_catalog', 'information_schema')
            AND relkind='r'
            ORDER BY reltuples DESC) x;
        "
    }
    $dataSet = Invoke-PsqlCommand @params
    return $dataSet[1]
}

function Get-DatabaseRecordCount {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    if ($config.engine -eq 'SQLServer') { return Get-SQLServerDatabaseRecordCount }
    if ($config.engine -eq 'PostgreSQL') { return Get-PostgreSQLDatabaseRecordCount }
}

function Invoke-LoadBootstrapData {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $params = @{
        apiKey                      = $config.apiBootstrapKey
        apiSecret                   = $config.apiBootstrapSecret
        apiUrlData                  = $config.apiUrlData
        apiUrlMetadata              = $config.apiUrlMetadata
        apiUrlOAuth                 = $config.apiUrlOAuth
        apiUrlDependencies          = $config.apiUrlDependencies
        apiYear                     = $config.apiYear
        bulkLoadClientExecutable    = $config.bulkLoadClientExecutable
        bulkLoadConnectionLimit     = 100
        bulkLoadDirectoryWorking    = $config.bulkLoadTempDirectory
        bulkLoadDirectoryData       = $config.bulkLoadTempDirectoryBootstrap
        bulkLoadDirectoryMetadata   = $config.bulkLoadDirectoryMetadata
        bulkLoadDirectorySchema     = $config.bulkLoadDirectorySchema
        bulkLoadForceReloadMetadata = $true
        bulkLoadMaxRequests         = $config.bulkLoadMaxRequests
        BulkLoadNoXmlValidation     = $config.noValidation
        bulkLoadRetries             = 0
        bulkLoadTaskCapacity        = 50
    }

    $initialRecordCount = (Get-DatabaseRecordCount)

    Invoke-BulkLoadClient $params

    $recordCount = ((Get-DatabaseRecordCount) - $initialRecordCount)
    Write-Host "$recordCount records were loaded."
    Write-TeamCityBuildStatus "Records: $recordCount"
}

function Invoke-LoadSampleData {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $params = @{
        apiKey                      = $config.apiSandboxKey
        apiSecret                   = $config.apiSandboxSecret
        apiUrlData                  = $config.apiUrlData
        apiUrlMetadata              = $config.apiUrlMetadata
        apiUrlOAuth                 = $config.apiUrlOAuth
        apiUrlDependencies          = $config.apiUrlDependencies
        apiYear                     = $config.apiYear
        bulkLoadClientExecutable    = $config.bulkLoadClientExecutable
        bulkLoadConnectionLimit     = 100
        bulkLoadDirectoryData       = $config.bulkLoadTempDirectorySample
        bulkLoadDirectoryMetadata   = $config.bulkLoadDirectoryMetadata
        bulkLoadDirectorySchema     = $config.bulkLoadDirectorySchema
        bulkLoadDirectoryWorking    = $config.bulkLoadTempDirectory
        bulkLoadForceReloadMetadata = $true
        bulkLoadMaxRequests         = $config.bulkLoadMaxRequests
        BulkLoadNoXmlValidation     = $config.noValidation
        bulkLoadRetries             = 1
        bulkLoadTaskCapacity        = 50
    }

    $initialRecordCount = (Get-DatabaseRecordCount)

    Invoke-BulkLoadClient $params

    $totalRecordCount = (Get-DatabaseRecordCount)
    $recordCount = ($totalRecordCount - $initialRecordCount)

    Write-Host "$recordCount records were loaded."
    Write-TeamCityBuildStatus "Records: $totalRecordCount"
}

function Get-SQLServerDisallowedSchemas {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $sqlServerSchemas = @('dbo')
    $allowedSchemas = $config.databaseAllowedSchemas + $sqlServerSchemas
    $allowedSchemas = "'$($allowedSchemas -join "', '")'"

    $params = @{
        connectionString = $config.databaseConnectionString
        sql = "
        SELECT SCHEMA_NAME
        FROM INFORMATION_SCHEMA.SCHEMATA
        WHERE SCHEMA_OWNER = 'dbo'
            AND SCHEMA_NAME not in ($allowedSchemas)
        "
    }
    $disallowedSchemas = (Invoke-SqlReader @params)

    if ($disallowedSchemas.Count -eq 0) { return @() }

    $result = @()
    foreach ($item in $disallowedSchemas.Values[0]) { $result += $item }

    return ,$result
}

function Get-PostgreSQLDisallowedSchemas {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $postgresSchemas = @('information_schema', 'public')
    $allowedSchemas = $config.databaseAllowedSchemas + $postgresSchemas
    $allowedSchemas = "'$($allowedSchemas -join "', '")'"

    $params = @{
        serverName = $config.databaseConnectionString.host
        portNumber = $config.databaseConnectionString.port
        userName = $config.databaseConnectionString.username
        databaseName = $config.databaseConnectionString.database
        commands = "
        SELECT schema_name
        FROM information_schema.schemata
        WHERE schema_name NOT IN ($allowedSchemas)
        AND schema_name NOT LIKE 'pg_%'
        "
    }
    $disallowedSchemas = (Invoke-PsqlCommand @params)

    if ($disallowedSchemas.Length -eq 0) { return @() }

    return ($disallowedSchemas | where { $_ -ne [string]::Empty } | foreach { $_.Trim() })
}

function Assert-DisallowedSchemas {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    if (-not $config.noExtensions) { return }

    $disallowedSchemas = @()

    if ($config.engine -eq 'SQLServer') { $disallowedSchemas = Get-SQLServerDisallowedSchemas }
    if ($config.engine -eq 'PostgreSQL') { $disallowedSchemas = Get-PostgreSQLDisallowedSchemas }

    if ($disallowedSchemas.Count -eq 0) { return }

    $disallowedSchemas = "$($disallowedSchemas -join ", ")"
    throw "Found the following disallowed schemas: $disallowedSchemas."
}

function Backup-DatabaseTemplate {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $csb = $config.databaseConnectionString
    $databaseBackupName = $config.databaseBackupName

    if ($config.engine -eq 'SQLServer') { $databaseBackupName = "$databaseBackupName.bak" }

    if ($config.engine -eq 'PostgreSQL') { $databaseBackupName = "$databaseBackupName.sql" }

    if (-not $config.backupDirectory) { $backupDirectory = $global:templateDatabaseFolder }
    else { $backupDirectory = $config.backupDirectory }

    if (-not $config.multipleBackups) {
        if (Test-Path $backupDirectory) { Remove-Item -Recurse -Force $backupDirectory }
    }

    if (-not (Test-Path $backupDirectory)) { New-Item -ItemType Directory $backupDirectory | Out-Null }

    if ((Test-Path (Join-Path $backupDirectory $databaseBackupName))) { Remove-Item (Join-Path $backupDirectory $databaseBackupName) }

    if ($config.engine -eq 'SQLServer') {
        $params = @{
            csb               = Convert-CommonDbCSBtoSqlCSB $csb
            backupDirectory   = (Resolve-Path $backupDirectory)
            overwriteExisting = $true
        }
        Backup-Database @params | Out-Null

        Rename-Item (Join-Path $params.backupDirectory "$($params.csb.Database).bak") $databaseBackupName
    }

    if ($config.engine -eq 'PostgreSQL') {
        $params = @{
            serverName   = $csb.host
            portNumber   = $csb.port
            userName     = $csb.username
            databaseName = $csb.database
            filePath     =  (Join-Path (Resolve-Path $backupDirectory) $databaseBackupName)
        }
        Backup-PostgreSQLDatabase @params | Out-Null
    }

    Write-Host
    Write-Host "Backup Created: " -ForegroundColor Green -NoNewline
    Write-Host (Resolve-Path (Join-Path $backupDirectory $databaseBackupName))
    Write-Host
}

function New-DatabaseTemplateNuspec {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )
    $packageNuspecName = $config.packageNuspecName
    if ($config.engine -eq 'PostgreSQL') { $packageNuspecName += ".PostgreSQL" }

    $populatedTemplatePath = $global:templateDatabaseFolder
    $nuspecPath = Join-Path $populatedTemplatePath "$packageNuspecName.nuspec"

    $params = @{
        nuspecPath               = $nuspecPath
        id                       = '$id$'
        title                    = '$title$'
        description              = '$description$'
        version                  = '$version$'
        authors                  = '$authors$'
        copyright                = '$copyright$'
        owners                   = '$owners$'
        requireLicenseAcceptance = $false
    }
    New-Nuspec @params

    $sourceTargetPair = @{
        source = (Get-ChildItem $populatedTemplatePath).FullName
        target = "."
    }
    Add-FileToNuspec -nuspecPath $nuspecPath -sourceTargetPair $sourceTargetPair

    Write-Host "Nuspec Created: " -ForegroundColor Green -NoNewline
    Write-Host (Get-ChildItem $populatedTemplatePath -Filter "*.nuspec").FullName
    Write-Host
}

Export-ModuleMember -function * -Alias *
