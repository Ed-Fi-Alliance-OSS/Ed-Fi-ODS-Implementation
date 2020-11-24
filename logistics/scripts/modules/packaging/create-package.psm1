# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

$ErrorActionPreference = "Stop"

Import-Module -Force -Scope Global "$PSScriptRoot\nuget-helper.psm1"

function Invoke-CreatePackage {
    <#
    .SYNOPSIS
        Builds and publishes a NuGet package.

    .DESCRIPTION
        Builds a NuGet package based on a csproj or nuspec file and publishes it to a NuGet feed.

    .EXAMPLE
        $parameters = @{
            PackageDefinitionFile = "c:\temp\EdFi.Installer.WebApi.nuspec"
            Version = "1.0.0"
            Suffix = "pre0001"
            OutputDirectory = "c:\temp"
            Publish = $true
            Source = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
            ApiKey = $env:azureArtifacts.apiKey
            ToolsPath = "tools"
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
        [Parameter(Mandatory = $true)]
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

        # Path to download and store nuget.exe if not already present in the path.
        [string]
        $ToolsPath
    )
    $verbose = $PSCmdlet.MyInvocation.BoundParameters["Verbose"]

    # Ensure we have a NuGet.exe to work with
    $nuget = Get-Command -Name nuget.exe -ErrorAction SilentlyContinue

    Install-NuGetCli -ToolsPath $ToolsPath
    $nuget = Join-Path -Path $ToolsPath -ChildPath "nuget.exe"

    # Build release
    $parameters = @{
        PackageDefinitionFile = $PackageDefinitionFile
        Version = $Version
        OutputDirectory = $OutputDirectory
        NuGet = $nuget
        Verbose = $verbose
    }
    New-Package @parameters

    # Build pre-release
    $parameters["Suffix"] = $Suffix
    New-Package @parameters

    # Publish pre-release
    if ($Publish) {

     # Extract package ID from the  nuspec file name

    [ xml ] $fileContents = Get-Content -Path $PackageDefinitionFile
    $packageId= $fileContents.package.metadata.id
    $parameters = @{
            PackageFile = (Get-ChildItem "$OutputDirectory/$packageId*.$Version-$Suffix.nupkg").FullName
            Source = $Source
            ApiKey = $ApiKey
            NuGet = $nuget
            Verbose = $verbose
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
        [Parameter(Mandatory = $true)]
        $Version,

        [string]
        $Suffix,

        [string]
        [Parameter(Mandatory = $true)]
        $OutputDirectory,

        [string]
        [Parameter(Mandatory = $true)]
        $NuGet
    )
    $parameters = @(
        "pack", $PackageDefinitionFile,
        "-Version", $Version,
        "-OutputDirectory", $OutputDirectory
    )

    if ($Suffix) {
        $parameters += "-Suffix"
        $parameters += $Suffix
    }

    if ($Verbose) {
        $parameters += "-Verbosity"
        $parameters += "detailed"
    }

    Write-Host $NuGet @parameters -ForegroundColor Magenta
    &$NuGet @parameters
}


function Publish-PrereleasePackage {
    param (
        [string]
        [Parameter(Mandatory = $true)]
        $PackageFile,

        [string]
        $Source,

        [string]
        $ApiKey,

        [string]
        [Parameter(Mandatory = $true)]
        $NuGet
    )
    $parameters = @(
        "push", $PackageFile,
        "-Source", $Source,
        "-ApiKey", $ApiKey
    )

    if ($Verbose) {
        $parameters += "-Verbosity"
        $parameters += "detailed"
    }

    Write-Host $NuGet @parameters -ForegroundColor Magenta
    &$NuGet @parameters
}

Export-ModuleMember -Function Invoke-CreatePackage
