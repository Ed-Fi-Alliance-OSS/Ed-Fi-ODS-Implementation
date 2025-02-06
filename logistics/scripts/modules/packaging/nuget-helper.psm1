# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot/../../../../logistics/scripts/modules/load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/utility/cross-platform.psm1")

function Get-NuGetPackage {
    <#
    .SYNOPSIS
        Download and unzip a NuGet package for the purpose of bundling into another package.
    .DESCRIPTION
        Uses nuget command line to download a NuGet package and unzip it into an output
        directory. Uses the Ed-Fi Azure Artifacts package feed by default. Default output directory
        is ./downloads.
    .PARAMETER packageName
        Alias "applicationId". Name of the package to download.
    .PARAMETER packageVersion
        Package version number. Can include pre-release information. Optional. If not
        specified, installs the most recent full release version.
    .PARAMETER outputDirectory
        The path into which the package is unzipped. Defaults to "./downloads".
    .PARAMETER packageSource
        The NuGet package source. Defaults to "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json".
    .EXAMPLE
        $parameters = @{
            packageName = "EdFi.Suite3.Ods.WebApi"
            packageVersion = "5.2.0-b11661"
        }
        Get-NuGetPackage @parameters
    #>
    [CmdletBinding()]
    param (
        [string]
        [Parameter(Mandatory = $true)]
        [Alias("applicationId")]
        $PackageName,

        [string]
        $PackageVersion,

        [string]
        $OutputDirectory = './downloads',

        [string]
        $PackageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json",

        [switch]
        $ExcludeVersion
    )

    $parameters = @(
        "install", $PackageName,
        "-source", $PackageSource,
        "-outputDirectory", $OutputDirectory
    )
    if ($ExcludeVersion) {
        $parameters += "-ExcludeVersion"
    }
    if ($PackageVersion) {
        $parameters += "-version"
        $parameters += $PackageVersion
    }

    # 'dotnet pack' requires a project or solution be specified,
    # even if it's contents are not used in the package.
    # Therefore, when creating a package defined by a .nuspec file,
    # we must create an empty project and then delete it after packing is complete

    $temporaryProjectDirectory = "./temporary-project"
    $temporaryProjectFileName = "temporary-project.csproj"
    $temporaryProjectFileContents = 
@"
<Project Sdk="Microsoft.NET.Sdk">
    <PropertyGroup>
    <TargetFramework>net8.0</TargetFramework>
    </PropertyGroup>
</Project>
"@

    If(!(Test-Path -PathType container $temporaryProjectDirectory))
    {
        New-Item -ItemType Directory -Path $temporaryProjectDirectory | Out-Null
    }

    If(!(test-path -PathType container $OutputDirectory))
    {
        New-Item -ItemType Directory -Path $OutputDirectory | Out-Null
    }

    $temporaryProjectFileContents | Out-File -FilePath "$temporaryProjectDirectory/$temporaryProjectFileName" | Out-Null

    $parameters = @(
        "add", "$temporaryProjectDirectory/$temporaryProjectFileName"
        "package", $PackageName
        "-s", $PackageSource
        "-v", $PackageVersion
        "--package-directory", $OutputDirectory
    )

    Write-Host -ForegroundColor Magenta "& dotnet $parameters"
    & dotnet $parameters

    try {
        Remove-Item -Path $temporaryProjectDirectory -Recurse -Force | Out-Null 
    } catch { }

    if ($ExcludeVersion) {
        return Resolve-Path "$outputDirectory/$PackageName*" | Select-Object -Last 1
    }

    return Resolve-Path "$outputDirectory/$PackageName.$PackageVersion*" | Select-Object -Last 1
}

$exports = @(
    "Install-NuGetCli"
    "Get-NuGetPackage"
)

Export-ModuleMember -Function $exports
