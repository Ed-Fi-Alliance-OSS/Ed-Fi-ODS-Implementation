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
    [string] $configurationFile = $(Get-RepositoryResolvedPath "logistics/scripts/smokeTestHarnessConfiguration.json"),
    [string] $apiUrl = "http://localhost:8765",
    [string] $environmentFilePath = (Resolve-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath "modules")).Path,
    [Boolean] $generateApiSdkPackage = $false,
    [Boolean] $generateTestSdkPackage = $false,
    [string] $packageVersion,
    [Boolean] $noRestore = $false,
    [String] $standardVersion,
	[String] $javaPath 
)

$ErrorActionPreference = 'Stop'

$error.Clear()

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/load-path-resolver.ps1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'Initialize-PowershellForDevelopment.ps1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/TestHarness.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/restore-packages.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/create-package.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-teamcity.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/config/config-management.psm1')

function Invoke-SdkGen {
    $script:result = @()
    $sdkGenSolution = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.sln")
    $apiMetadataUrl = ($apiUrl + "/metadata?sdk=true")
    $teamCityParameters = Get-TeamCityParameters
    $envBuildConfiguration = $Env:CONFIGURATION;
    $buildConfiguration = if($null -ne $envBuildConfiguration) { $envBuildConfiguration} else { Get-ValueOrDefault $teamCityParameters['msbuild.buildConfiguration'] 'Debug'}
    $version = if($packageVersion){ $packageVersion } else { (Get-ValueOrDefault $teamCityParameters['version'] '0.0.0') }
    
    Write-Host -ForegroundColor Magenta "Invoke-SdkGen -NoRestore is " $noRestore    
    $elapsed = Use-StopWatch {
        if($generateApiSdkPackage) {

            try {
                $script:result += Invoke-Task "Clean-SdkGen-Console-Output" { Invoke-Clean-SdkGen-Output }
                $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal"  $sdkGenSolution $noRestore $standardVersion }
                $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath $null "EdFiOdsApiSdk" }
                $sdkCliVersion = Get-ValueOrDefault $teamCityParameters['SdkCliVersion'] '7.2.0'
                $arguments = @("-v",$sdkCliVersion,"--core-only","-j","""$javaPath""")
                $script:result += Invoke-Task "Invoke-SdkGenConsole" { Invoke-SdkGenConsole $apiMetadataUrl $buildConfiguration $arguments }
            }
            finally {
                $script:result += Invoke-Task -name "Stop-TestHarness" -task { Stop-TestHarness }
            }

            $sdkSolutionFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/csharp/EdFi.OdsApi.Sdk.sln")
            $script:result += Invoke-Task "Restore-ApiSdk-Packages" { Invoke-Restore-ApiSdk-Packages $sdkSolutionFile }
            $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal" $sdkSolutionFile $noRestore $standardVersion }

            $nuspecFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/EdFi.OdsApi.Sdk.nuspec")
            $suffix = Get-ValueOrDefault $teamCityParameters['odsapi.package.suffix'] ".Suite3"
            Write-Host "Updating package id and title to EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion"
            (Get-Content -path $nuspecFile -Raw) | ForEach-Object {
                $_.replace("<id>EdFi.OdsApi.Sdk</id>","<id>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</id>").replace("<title>EdFi.OdsApi.Sdk</title>","<title>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</title>")
            } | Set-Content -Path $nuspecFile

            $script:result += Invoke-Task "Pack-ApiSdk" { Invoke-Pack-ApiSdk $buildConfiguration $teamCityParameters $version }
        }

        if($generateTestSdkPackage) {
            try {
                $script:result += Invoke-Task "Clean-SdkGen-Console-Output" { Invoke-Clean-SdkGen-Output }
                $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal" $sdkGenSolution $noRestore $standardVersion }
                $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath $null "EdFiOdsApiSdk" }
                $sdkCliVersion = Get-ValueOrDefault $teamCityParameters['SdkCliVersion'] '7.2.0'
                $arguments = @("-v",$sdkCliVersion,"-c","-i","-p","-j","""$javaPath""")
                $script:result += Invoke-Task "Invoke-SdkGenConsole" { Invoke-SdkGenConsole $apiMetadataUrl $buildConfiguration $arguments }
            }
            finally {
                $script:result += Invoke-Task -name "Stop-TestHarness" -task { Stop-TestHarness }
            }

            $sdkSolutionFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/csharp/EdFi.OdsApi.Sdk.sln")
            $script:result += Invoke-Task "Restore-TestSdk-Packages" { Invoke-Restore-ApiSdk-Packages $sdkSolutionFile }
            $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal" $sdkSolutionFile $noRestore $standardVersion }

            $nuspecFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/EdFi.OdsApi.Sdk.nuspec")
            $suffix = Get-ValueOrDefault $teamCityParameters['odsapi.package.suffix'] ".Suite3"
            Write-Host "Updating package id and title to EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion"
            (Get-Content -path $nuspecFile -Raw) | ForEach-Object {
                $_.replace("<id>EdFi.OdsApi.Sdk</id>","<id>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</id>").replace("<title>EdFi.OdsApi.Sdk</title>","<title>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</title>").replace("<id>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</id>","<id>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</id>").replace("<title>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</title>","<title>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</title>")
            } | Set-Content -Path $nuspecFile

            $script:result += Invoke-Task "Pack-TestSdk" { Invoke-Pack-ApiSdk $buildConfiguration $teamCityParameters $version }
        }
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
    return $script:result | Format-Table
}

function Invoke-Restore-ApiSdk-Packages {
    param (
        [string] $sdkSolutionFile
    )
    $toolsPath = (Join-Path (Get-RepositoryRoot "Ed-Fi-ODS-Implementation") 'tools')

    $params = @{
        SolutionPath = $sdkSolutionFile
        ToolsPath = $toolsPath
    }
    Restore-Packages @params
}

function Invoke-Pack-ApiSdk {
    param (
        [string] $buildConfiguration = "Debug",
        [string[]] $teamCityParameters = @(),
        [string] $version = "0.0.0"

    )

    $nugetOutput = Get-ValueOrDefault $teamCityParameters['nuget.pack.output'] 'NugetPackages'

    $parameters = @{
        PackageDefinitionFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/EdFi.OdsApi.Sdk.nuspec")
        Version               = $version
        OutputDirectory       = $nugetOutput
        Publish               = $false
        ToolsPath             = "../../../tools"
        Properties            = @("configuration=$buildConfiguration","authors=Ed-Fi Alliance","owners=Ed-Fi Alliance","copyright=Copyright © $((Get-Date).year) Ed-Fi Alliance, LLC and Contributors" )
    }
    
    Invoke-CreatePackage @parameters -Verbose:$verbose
}

function Invoke-Clean-SdkGen-Output {
    try {
        Remove-Item ("//?/" + (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/csharp")) -Recurse -Force
    }
    catch {
        # catching if this call throws, which just means the path does not exist so sdkgen has not been run yet
    }
    
}

Invoke-SdkGen