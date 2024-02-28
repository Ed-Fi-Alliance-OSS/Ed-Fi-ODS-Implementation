# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot/Initialize-PowershellForDevelopment.ps1"

$teamcityParameters = Get-TeamCityParameters
Write-Host
Write-Host "$($teamcityParameters.Count) TeamCity parameters found."
Write-Host

# Build and Test
$params = @{
    InstallType            = Get-ValueOrDefault                    $teamcityParameters['odsapi.build.installType']             'Sandbox'
    OdsTokens              = Get-ValueOrDefault (ConvertTo-Array   $teamcityParameters['odsapi.build.odsTokens'])              @()
    Engine                 = Get-ValueOrDefault                    $teamcityParameters['odsapi.build.engine']                  'SQLServer'
    NoCodeGen              = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noCodeGen'])              $false
    NoRebuild              = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noRebuild'])              $false
    NoDeploy               = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noDeploy'])               $false
    RunPester              = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runPester'])              $true
    RunDotnetTest          = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runDotnetTest'])          $true
    RunPostman             = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runPostman'])             $true
    RunSmokeTest           = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runSmokeTest'])           $true
    UsePlugins             = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.usePlugins'])             $false
    RunSdkGen              = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.runSdkGen'])              $true
    GenerateApiSdkPackage  = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.generateApiSdkPackage'])  $false
    GenerateTestSdkPackage = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.generateTestSdkPackage']) $false
    PackageVersion         = Get-ValueOrDefault                    $teamcityParameters['version']                             '0.0.0'
}

Invoke-Task "Remove-EdFiDatabases" { Remove-EdFiDatabases -Force -Engine $params.Engine }

Write-FlatHashtable $params
$result = Initialize-DevelopmentEnvironment @params

$noPackaging   = Get-ValueOrDefault (ConvertTo-Boolean $teamcityParameters['odsapi.build.noPackaging'])

if (-not $noPackaging) {
    # Package
    $params = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).SandboxAdmin)
        PackageId       = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.sandboxAdmin.id']
        Version         = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.sandboxAdmin.version']     '0.0.0'
        Properties      = Get-ValueOrDefault (ConvertTo-Array $teamcityParameters['odsapi.build.package.sandboxAdmin.properties']) (Get-DefaultNuGetProperties)
        OutputDirectory = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.sandboxAdmin.output']      "$PSScriptRoot/packages"
    }
    $result += New-WebPackage @params

    $params = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).SwaggerUI)
        PackageId       = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.swaggerUI.id']
        Version         = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.swaggerUI.version']     '0.0.0'
        Properties      = Get-ValueOrDefault (ConvertTo-Array $teamcityParameters['odsapi.build.package.swaggerUI.properties']) (Get-DefaultNuGetProperties)
        OutputDirectory = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.swaggerUI.output']      "$PSScriptRoot/packages"
    }
    $result += New-WebPackage @params

    $params = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).WebApi)
        PackageId       = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.webApi.id']
        Version         = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.webApi.version']     '0.0.0'
        Properties      = Get-ValueOrDefault (ConvertTo-Array $teamcityParameters['odsapi.build.package.webApi.properties']) (Get-DefaultNuGetProperties)
        OutputDirectory = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.webApi.output']      "$PSScriptRoot/packages"
    }
    $result += New-WebPackage @params

    $params = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).Databases)
        PackageId       = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.databases.id']
        Version         = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.databases.version']     '0.0.0'
        Properties      = Get-ValueOrDefault (ConvertTo-Array $teamcityParameters['odsapi.build.package.databases.properties']) (Get-DefaultNuGetProperties)
        OutputDirectory = Get-ValueOrDefault                  $teamcityParameters['odsapi.build.package.databases.output']      "$PSScriptRoot/packages"
    }
    $result += New-DatabasesPackage @params

    $result | Format-Table

    if (Test-TeamCityVersion) { Write-Host "##teamcity[publishArtifacts '$PSScriptRoot/packages,*.log']" }
}
