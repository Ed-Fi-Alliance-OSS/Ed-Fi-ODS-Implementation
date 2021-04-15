# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

<#
.description
    Runs Invoke-SdkGen
.parameter configurationFile
    Path to the Json file containing the Integration Test Harness configuration
.parameter apiUrl
    API URL for the Integration Test Harness
.parameter environmentFilePath
    Path to environment file used to run Postman integration tests

    .EXAMPLE
    PS> Invoke-SdkGen.ps1
#>
param(
    [string] $configurationFile = $(Get-RepositoryResolvedPath "logistics\scripts\smokeTestHarnessConfiguration.json"),
    [string] $apiUrl = "http://localhost:8765",
    [string] $environmentFilePath = (Resolve-Path "$PSScriptRoot\modules")
)

$ErrorActionPreference = 'Stop'

$error.Clear()

& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global  (Get-RepositoryResolvedPath "Initialize-PowershellForDevelopment.ps1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\TestHarness.psm1")

function Invoke-SdkGen {
    $script:result = @()
    $sdkGenSolution = (Get-RepositoryResolvedPath "Utilities\SdkGen\EdFi.SdkGen.sln")
     $buildConfiguration = "Debug"
    if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $buildConfiguration = $env:msbuild_buildConfiguration }
    
    $elapsed = Use-StopWatch {
        try {
            $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal"  $sdkGenSolution }
            $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath }
            $script:result += Invoke-Task "Invoke-SdkGenConsole" { Invoke-SdkGenConsole  $buildConfiguration }
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

Invoke-SdkGen