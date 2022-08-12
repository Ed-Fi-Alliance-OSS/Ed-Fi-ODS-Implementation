# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
.description
    Runs Postman integration tests using the Integration Test Harness
.parameter configurationFile
    Path to the Json file containing the Integration Test Harness configuration
.parameter apiUrl
    API URL for the Integration Test Harness
.parameter environmentFilePath
    Path to environment file used to run Postman integration tests
#>
param(
    [string] $configurationFile = (Resolve-Path "$PSScriptRoot\modules\postmanTestHarnessConfiguration.json"),
    [string] $apiUrl = "http://localhost:8765",
    [string] $environmentFilePath = (Resolve-Path "$PSScriptRoot\modules")
)

& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global  (Get-RepositoryResolvedPath "Initialize-PowershellForDevelopment.ps1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\TestHarness.psm1")

$script:postmanFolder = (Split-Path -Parent $configurationFile)
$script:environmentJson = (Join-Path $script:postmanFolder "environment.json")

function Install-Newman {
    try {
        npm install -g newman@5.2.2 newman-reporter-teamcity@0.1.12 newman-reporter-html@1.0.5
        newman --version
    }
    catch {
        Write-Host $_ -ForegroundColor Red
        Clear-Error
    }
}

function Invoke-Newman {
    $collectionFileDirectory = (Get-RepositoryResolvedPath "Postman Test Suite\")
    $collectionFiles = Get-ChildItem $collectionFileDirectory -Filter "*.postman_collection.json"

    foreach ($collectionFile in $collectionFiles) {
        Write-host $script:environmentJson
        if (Test-TeamCityVersion) {
            newman run $collectionFile.FullName -e $script:environmentJson --suppress-exit-code --disable-unicode --reporters teamcity,cli,html --reporter-html-export newman/report.html
        }
        else {
            newman run $collectionFile.FullName -e $script:environmentJson --suppress-exit-code --disable-unicode --reporters cli
        }
    }
}

function Invoke-PostmanIntegrationTests {
    $logPath = (Get-RepositoryRoot "Ed-Fi-Ods-Implementation") + "/PostmanIntegrationTestsLog.log"

    $script:result = @()

    $elapsed = Use-StopWatch {
        try {
            $script:result += Invoke-Task -name "Install-Newman" -task { Install-Newman }
            $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath }
            $script:result += Invoke-Task -name "Invoke-Newman" -task { Invoke-Newman | Tee-Object -FilePath $logPath | Write-Host }
        }
        finally {
            $script:result += Invoke-Task -name "Stop-TestHarness" -task { Stop-TestHarness }
        }
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
    return $script:result | Format-Table
}

Invoke-PostmanIntegrationTests
