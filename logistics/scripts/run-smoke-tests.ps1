# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

<#
.SYNOPSIS
    Runs smoke tests against the specified api.

.DESCRIPTION
    By default this will:
    * Reset-Admin Database
    * Reset-Security Database
    * Reset-TestPopulateTemplate Database
    * Creates a new test harness json in env:temp
    * Builds the test Load Tools solution
    * Run Smoke Tests non destructive tests by default

    .PARAMETER metadataUrl
    The url for the listing of Open API specifications of the api website deployment, must NOT end in a forward slash, for example: https://api-stage.ed-fi.org/api/metadata

    .PARAMETER apiDataUrl
    The url for accessing the api website deployment, must NOT end in a forward slash, for example: https://api-stage.ed-fi.org/api/api/ods/v3/data/v3

    .PARAMETER apiUrl
    The url for accessing the api website deployment, must NOT end in a forward slash, for example: https://api-stage.ed-fi.org/api/api/ods/v3

    .PARAMETER key
    The key used to authenticate for the smoke test (Default: sandbox generated key)

    .PARAMETER secret
    The secret used to authenticate for the smoke test (Default: sandbox generated secret)

    .PARAMETER namespaceUri
    Overrride the URI to use when generating namespace values (Default: http://edfi.org)

    .PARAMETER schoolYear
    The School Year to use for all api requests (Default: (Get-Date).year)

    .PARAMETER testSets
    The types of test sets to run. NonDestructiveApi, NonDestructiveSdk, or DestructiveSdk (Default: NonDestructiveApi, NonDestructiveSdk)

    .PARAMETER noRebuild
    Disables the rebuild of the load tools solution

    .EXAMPLE
    PS> run-smoke-tests.ps1
#>
param(
    [string] $metadataUrl = "http://localhost:8765/metadata",
    [string] $apiUrl = "http://localhost:8765",
    [string] $apiDataUrl = "http://localhost:8765/data/v3",
    [string] $key = $null,
    [string] $secret = $null,
    [string] $namespaceUri = "http://edfi.org",
    [string] $schoolYear = $null,
    [string[]] $testSets = @("NonDestructiveApi", "NonDestructiveSdk"),
    [string] $smokeTestExe =  ".\EdFi.SmokeTest.Console\tools\EdFi.SmokeTest.Console.exe",
    [string] $smokeTestDll = ".\EdFi.OdsApi.Sdk\lib\EdFi.OdsApi.Sdk.dll",
    [switch] $noRebuild
)

$ErrorActionPreference = 'Stop'

$error.Clear()

& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\TestHarness.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\LoadTools.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tasks\TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "DatabaseTemplate\Modules\create-database-template.psm1")

if ([string]::IsNullOrWhiteSpace($key)) { $key = Get-RandomString }
if ([string]::IsNullOrWhiteSpace($secret)) { $secret = Get-RandomString }

if ([string]::IsNullOrWhiteSpace($smokeTestExe) -or -not(Test-Path $smokeTestExe)) {
    $smokeTestExe = "$(Get-RepositoryResolvedPath "Utilities\DataLoading\EdFi.SmokeTest.Console")\bin\**\EdFi.SmokeTest.Console.exe"
}
else { $noRebuild = $true }

if ([string]::IsNullOrWhiteSpace($smokeTestDll) -or -not(Test-Path $smokeTestDll)) {
    $smokeTestDll = "$(Get-RepositoryResolvedPath "Utilities\DataLoading\EdFi.LoadTools.Test")\bin\**\EdFi.OdsApi.Sdk.dll"
}

function Get-SmokeTestConfiguration {
    $config = @{ }

    Merge-Configurations $config (Get-Configuration)
    Merge-Configurations $config (Get-EnvironmentConfiguration)

    $config.apiUrlBase = $apiUrl
    $config.apiUrlOAuth = $config.apiUrlBase
    $config.apiUrlMetadata = $metadataUrl
    $config.apiUrlData = $apiDataUrl
    $config.apiNamespaceUri = $namespaceUri
    $config.apiKey = $key
    $config.apiSecret = $secret
    $config.apiClientNameSandbox = "ODS/API"
    $config.apiYear = $schoolYear
    $config.smokeTestExecutable = $smokeTestExe
    $config.smokeTestDll = $smokeTestDll
    $config.apiAppConfig = "$(Get-RepositoryResolvedPath "Application\EdFi.Ods.Api.IntegrationTestHarness")\bin\**\EdFi.Ods.Api.IntegrationTestHarness.exe.config"
    $config.noExtensions = $false

    $config.testSets = $testSets

    $config.loadToolsSolution = (Get-RepositoryResolvedPath "Utilities\DataLoading\LoadTools.sln")

    $config.testHarnessAppConfig = "$(Get-RepositoryResolvedPath "Application\EdFi.Ods.Api.IntegrationTestHarness")\bin\**\EdFi.Ods.Api.IntegrationTestHarness.exe.config"
    $config.testHarnessJsonConfig = "$(Get-RepositoryResolvedPath "logistics\scripts\smokeTestHarnessConfiguration.json")"
    $config.testHarnessJsonConfigLEAs = @()

    $config.bulkLoadTempJsonConfig = Join-Path $env:temp "smokeTestconfig.json"

    return $config
}

$script:tasks = @()
$script:result = @()
$errorCode = 0;

try {
    Clear-Error

    Set-TemplateConfigurationScript { Get-SmokeTestConfiguration }
    (Get-TemplateConfiguration).GetEnumerator() | Sort-Object -Property Name | Format-Table -HideTableHeaders -AutoSize -Wrap

    if (-not $noRebuild) {
        $tasks += @(
            'Invoke-RestoreLoadToolsPackages'
            'Invoke-BuildLoadTools'
            'Invoke-SetTestHarnessConfig')
    }

    $tasks += @(
        'Add-RandomKeySecret'
        'Invoke-StartTestHarness'
        'Invoke-SmokeTestClient')

    $elapsed = Use-StopWatch {
        foreach ($task in $tasks) {
            $script:result += Invoke-Task -name $task -task { & $task }
        }
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
    $script:result | Format-Table
}
catch {
    Write-Host $_
    $errorCode = 1;
}
finally {
    Stop-TestHarness
    exit $errorCode;
}
