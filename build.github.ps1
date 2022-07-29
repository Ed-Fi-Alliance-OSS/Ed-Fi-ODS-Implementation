# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot/Initialize-PowershellForDevelopment.ps1"


# Build and Test
$params = @{
    InstallType         = 'Sandbox'
    OdsTokens           = @()
    Engine              = 'SQLServer'
    NoCodeGen           = $false
    NoRebuild           = $false
    NoDeploy            = $false
    RunPester           = $true
    RunDotnetTest       = $true
    RunPostman          = $true
    RunSmokeTest        = $true
    UsePlugins          = $false
    RunSdkGen           = $true
    GenerateSdkPackages = $false
    NoPackaging         = $false
    SandboxAdminId      = 'EdFi.Suite3.Ods.SandboxAdmin'
    PackageVersion      = '0.0.0'
    PackageOutput       = "$PSScriptRoot/packages"
    SwaggerUIId         = 'EdFi.Suite3.Ods.SwaggerUI'
    WebApiId            = 'EdFi.Suite3.Ods.WebApi'
    DatabasesId         = 'EdFi.Suite3.Ods.RestApi.Databases'
}

Invoke-Task "Remove-EdFiDatabases" { Remove-EdFiDatabases -Force -Engine $params.Engine }

Write-FlatHashtable $params
$result = Initialize-DevelopmentEnvironment @params

$noPackaging   = $params.NoPackaging

if (-not $noPackaging) {
    # Package
    $parameters = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).SandboxAdmin)
        PackageId       = $params.SandboxAdminId
        Version         = $params.PackageVersion
        Properties      = (Get-DefaultNuGetProperties)
        OutputDirectory = $params.PackageOutput
    }
    $result += New-WebPackage @parameters

    $parameters = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).SwaggerUI)
        PackageId       = $params.SwaggerUIId
        Version         = $params.PackageVersion
        Properties      = (Get-DefaultNuGetProperties)
        OutputDirectory = $params.PackageOutput
    }
    $result += New-WebPackage @params

    $parameters = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).WebApi)
        PackageId       = $params.WebApiId
        Version         = $params.PackageVersion
        Properties      = (Get-DefaultNuGetProperties)
        OutputDirectory = $params.PackageOutput
    }
    $result += New-WebPackage @parameters

    $parameters = @{
        ProjectPath     = (Get-RepositoryResolvedPath (Get-ProjectTypes).Databases)
        PackageId       = $params.DatabasesId
        Version         = $params.PackageVersion
        Properties      = (Get-DefaultNuGetProperties)
        OutputDirectory = $params.PackageOutput
    }
    $result += New-DatabasesPackage @parameters

    $result | Format-Table

    if (Test-TeamCityVersion) { Write-Host "##teamcity[publishArtifacts '$PSScriptRoot/packages,*.log']" }
}
