# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.
[CmdLetBinding()]
param(
    [ValidateSet('Sandbox', 'SharedInstance', 'YearSpecific', 'DistrictSpecific')]
    [string] $InstallType = 'Sandbox',

    [string[]] $OdsTokens = @(),

    [ValidateSet('SQLServer', 'PostgreSQL')]
    [String] $Engine = 'SQLServer',

    [switch] $NoRebuild = $false,

    [switch] $NoCodeGen = $false,

    [switch] $NoDeploy = $false,

    [switch] $RunPester = $false,

    [switch] $RunDotnetTest = $false,

    [switch] $RunPostman = $false,

    [switch] $RunSmokeTest = $false,

    [switch] $RunSdkGen = $false,

    [switch] $GenerateApiSdkPackage = $false,

    [switch] $GenerateTestSdkPackage = $false,

    [switch] $UsePlugins = $false,

    [switch] $NoPackaging = $false,

    [String] $RepositoryRoot,

    [String] $SandboxAdminId = 'EdFi.Suite3.Ods.SandboxAdmin',
    
    [String] $PackageVersion = '0.0.0',
    
    [String] $PackageOutput = "$PSScriptRoot/packages",
    
    [String] $SwaggerUIId = 'EdFi.Suite3.Ods.SwaggerUI',
    
    [String] $WebApiId  = 'EdFi.Suite3.Ods.WebApi',
    
    [String] $DatabasesId = 'EdFi.Suite3.RestApi.Databases',

    [String] $JavaPath = 'java'
)

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot/Initialize-PowershellForDevelopment.ps1"


# Build and Test
$params = @{
    InstallType            = $InstallType
    OdsTokens              = @()
    Engine                 = $Engine
    NoCodeGen              = $NoCodeGen
    NoRebuild              = $NoRebuild
    NoDeploy               = $NoDeploy
    RunPester              = $RunPester
    RunDotnetTest          = $RunDotnetTest
    RunPostman             = $RunPostman
    RunSmokeTest           = $RunSmokeTest
    UsePlugins             = $UsePlugins
    RunSdkGen              = $RunSdkGen
    GenerateApiSdkPackage  = $GenerateApiSdkPackage
    GenerateTestSdkPackage = $GenerateTestSdkPackage
    NoPackaging            = $NoPackaging
    SandboxAdminId         = $SandboxAdminId
    PackageVersion         = $PackageVersion
    PackageOutput          = $PackageOutput
    SwaggerUIId            = $SwaggerUIId
    WebApiId               = $WebApiId
    DatabasesId            = $DatabasesId
    RepositoryRoot         = $RepositoryRoot
    JavaPath               = $JavaPath
}

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
    $result += New-WebPackage @parameters

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
    
}
