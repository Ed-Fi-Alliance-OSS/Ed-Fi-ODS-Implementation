﻿# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

$ErrorActionPreference = "Stop"

Import-Module -Force -Scope Global "$PSScriptRoot/nuget-helper.psm1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/utility/cross-platform.psm1")

function Invoke-CreatePackage {
    <#
    .SYNOPSIS
        Builds and publishes a NuGet package.

    .DESCRIPTION
        Builds a NuGet package based on a csproj or nuspec file and publishes it to a NuGet feed.

    .EXAMPLE
        $parameters = @{
            PackageDefinitionFile = "c:/temp/EdFi.Installer.WebApi.nuspec"
            Version = "1.0.0"
            Suffix = "pre0001"
            OutputDirectory = "c:/temp"
            Publish = $true
            Source = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
            ApiKey = $env:azureArtifacts.apiKey
        }
        Invoke-CreatePackage @parameters
    #>
    param (
        # Full path to a package definition file, which can either be a csproj or nuspec file.
        [string]
        [Parameter(Mandatory = $true)]
        $PackageDefinitionFile,

        # Package semantic version number, e.g. "1.2.3".
        [string]
        [Parameter(Mandatory = $true)]
        $Version,

        # Pre-release suffix, e.g. "pre1234".
        [string]
        $Suffix,

        # Output directory where the .nupkg file will land.
        [string]
        [Parameter(Mandatory = $true)]
        $OutputDirectory,

        # Set to true to push/publish the package to a NuGet feed.
        [switch]
        [Parameter(ParameterSetName = "Publish")]
        $Publish,

        # NuGet feed destination for package publishing.
        [string]
        $Source,

        # NuGet feed API Key for package publishing.
        [string]
        $ApiKey,

        # Additional Properties to pass when packaging
        [string]
        $Properties = "copyright=Copyright @ " + $((Get-Date).year) + " Ed-Fi Alliance, LLC and Contributors;version=$Version",

        [string]
        $AdditionalParameters
    )

    $verbose = $PSCmdlet.MyInvocation.BoundParameters["Verbose"]

    # Build release
    $parameters = @{
        PackageDefinitionFile = $PackageDefinitionFile
        Version               = $Version
        OutputDirectory       = $OutputDirectory
        Verbose               = $verbose
        Properties            = $Properties
    }
    New-Package @parameters

    # Build pre-release
    if ($Suffix) {
        $parameters["Suffix"] = $Suffix
        New-Package @parameters
        $Version += "-$Suffix"
    }

    # Publish
    if ($Publish) {

        # Extract package ID from the nuspec file name
        [ xml ] $fileContents = Get-Content -Path $PackageDefinitionFile
        $packageId = $fileContents.package.metadata.id

        $parameters = @{
            PackageFile = (Get-ChildItem "$OutputDirectory/$packageId*.$Version.nupkg").FullName
            Source      = $Source
            ApiKey      = $ApiKey
            Verbose     = $verbose
        }
        Publish-PrereleasePackage @parameters
    }
}

function New-Package {
    param (
        [string]
        [Parameter(Mandatory = $true)]
        $PackageDefinitionFile,

        [string]
        $PackageId,

        [string]
        [Parameter(Mandatory = $true)]
        $Version,

        [string]
        $Suffix,

        [string[]]
        $Properties = @(),

        [string]
        [Parameter(Mandatory = $true)]
        $OutputDirectory,

        [string]
        $ProjectFile,

        [string]
        $BuildConfiguration = 'Debug'
    )

    $parameters = @()

    $parameters += "-p:NuspecFile=$($PackageDefinitionFile)"
    $parameters += "--output"
    $parameters += $OutputDirectory
    $parameters += "--no-build"
    

    if ($Suffix) {
        $parameters += "--version-suffix"
        $parameters += $Suffix
    }

    if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { 
        $BuildConfiguration = $env:msbuild_buildConfiguration 
    }

    $parameters += "--configuration"
    $parameters += $BuildConfiguration

    $nuspecProperties = "-p:NuspecProperties=""version=$($Version)"


    foreach ($prop in $Properties) {
        $nuspecProperties += ";$prop"
    }

    $nuspecProperties += """"

    $parameters += $nuspecProperties

    if ($Verbose) {
        $parameters += "--verbosity"
        $parameters += "detailed"
    }

    # 'dotnet pack' requires a project or solution be specified,
    # even if it's contents are not used in the package.
    # Therefore, when creating a package defined by a .nuspec file,
    # we must create an empty project and then delete it after packing is complete
    if ([string]::IsNullOrEmpty($ProjectFile)) {
        & dotnet new classlib --name EmptyProject
        $ProjectFile = "EmptyProject"
    }

    $parameters = @("pack") + @($ProjectFile) + $parameters

    Write-Host -ForegroundColor Magenta "& dotnet $parameters"
    & dotnet $parameters | Out-Host

    try {
        Remove-Item -Path "./EmptyProject" -Recurse -Force | Out-Null
    } catch { }

}

function Publish-PrereleasePackage {
    param (
        [string]
        [Parameter(Mandatory = $true)]
        $PackageFile,

        [string]
        $Source,

        [string]
        $ApiKey
    )
    $parameters = @(
        "push", $PackageFile,
        "--source", $Source,
        "--api-key", $ApiKey
    )

    if ($Verbose) {
        $parameters += "--verbosity"
        $parameters += "detailed"
    }

    & dotnet nuget @parameters
}

Export-ModuleMember -Function Invoke-CreatePackage, New-Package
