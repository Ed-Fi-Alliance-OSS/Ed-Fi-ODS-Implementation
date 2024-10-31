# SPDX-License-Identifier: Apache-2.0
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
        [string[]]
        $Properties = @("copyright=Copyright @ " + $((Get-Date).year) + " Ed-Fi Alliance, LLC and Contributors"),

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
        $OutputDirectory
    )

    Get-Content $PackageDefinitionFile -ReadCount 10000 | ForEach-Object { $_ -replace "<version>0.0.0</version>", "<version>$($Version)</version>" } | set-content $PackageDefinitionFile

    $parameters = @(
        "-p:NuspecFile=$($PackageDefinitionFile)",
        "-p:Version=$($Version)",
        "--output", $OutputDirectory
        "--no-build"
    )

    if ($Suffix) {
        $parameters += "--version-suffix"
        $parameters += $Suffix
    }

    foreach ($prop in $Properties) {
        $splitProp = $prop.Split('=');
        $parameters += "-p:$($splitProp[0])=""$($splitProp[1])"""
    }

    if ($Verbose) {
        $parameters += "--verbosity"
        $parameters += "detailed"
    }

    & dotnet new classlib

    & dotnet pack @parameters 

    try {
        Remove-Item -Path "./Class1.cs" -Recurse -Force | Out-Null
        Remove-Item -Path "./Ed-Fi-ODS-Implementation.csproj" -Recurse -Force | Out-Null
        Remove-Item -Path "./bin" -Recurse -Force | Out-Null
        Remove-Item -Path "./obj" -Recurse -Force | Out-Null
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
