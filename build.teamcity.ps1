# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot\Initialize-PowershellForDevelopment.ps1"

if (Test-TeamCityVersion) { Remove-EdFiDatabases -Force }

$teamcityParameters = Get-TeamCityParameters
Write-Host
Write-Host "$($teamcityParameters.Count) TeamCity parameters found."

# Build and Test
$params = @{
    InstallType   = Get-ValueOrDefault                    $teamcityParameters['odsapi.build.installType']    'Sandbox'
    OdsTokens     = Get-ValueOrDefault (ConvertTo-Array   $teamcityParameters['odsapi.build.odsTokens'])     @()
    Engine        = Get-ValueOrDefault                    $teamcityParameters['odsapi.build.engine']         'SQLServer'
    NoCodeGen     = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noCodeGen'])     $false
    NoRebuild     = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noRebuild'])     $false
    NoDeploy      = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noDeploy'])      $false
    RunPester     = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runPester'])     $true
    RunDotnetTest = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runDotnetTest']) $true
    RunPostman    = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runPostman'])    $true
    RunSmokeTest  = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runSmokeTest'])  $true
    UsePlugins    = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.usePlugins'])    $false
}

Write-FlatHashtable $params
Initialize-DevelopmentEnvironment @params
