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
        npm install -g newman@5.2.2 --verbose
        npm install -g newman-reporter-teamcity@0.1.12
        npm install -g newman-reporter-junitfull
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
    $reportPath = (Get-RepositoryRoot "Ed-Fi-ODS-Implementation") + "/reports/"

    foreach ($collectionFile in $collectionFiles) {
        Write-host $script:environmentJson
        if (Test-TeamCityVersion) {
            newman run $collectionFile.FullName -e $script:environmentJson --suppress-exit-code --disable-unicode --reporters 'teamcity,cli'
        }
        else {
            $testFile = $collectionFile.Name -Replace ".postman_collection.json",""
            newman run $collectionFile.FullName -e $script:environmentJson --disable-unicode --reporters 'junit,cli' --reporter-junit-export "$reportPath/$testFile.xml"
        }
    }
}

function Invoke-PostmanIntegrationTests {
    $logPath = ((Get-ChildItem "$(Get-RepositoryResolvedPath "Application/EdFi.Ods.Api.IntegrationTestHarness")/bin/**/*")  | Select-Object -First 1).FullName
    if ($Null -eq $logPath) {
        $logPath = (Get-RepositoryRoot "Ed-Fi-Ods-Implementation")
    }
    $logPath += "/PostmanIntegrationTestsLog.log"

    $script:result = @()

    $elapsed = Use-StopWatch {
        try {
            $script:result += Invoke-Task -name "Install-Newman" -task { Install-Newman }
            $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath $null "PostmanIntegrationTests" }
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
