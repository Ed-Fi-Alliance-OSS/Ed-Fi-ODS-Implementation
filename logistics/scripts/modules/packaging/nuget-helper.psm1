# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

function Install-NuGetCli {
    <#
    .SYNOPSIS
        Installs the latest version of the NuGet command line executable

    .DESCRIPTION
        Installs the latest version of the NuGet command line executable

    .PARAMETER toolsPath
        The path to store nuget.exe to

    .PARAMETER sourceNuGetExe
        Web location to the nuget file. Defaulted to the version 5.3.1.0 of nuget.exe.
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string] $ToolsPath,

        [string] $sourceNuGetExe = "https://dist.nuget.org/win-x86-commandline/v5.3.1/nuget.exe"
    )

    if (-not $(Test-Path $ToolsPath)) {
        mkdir $ToolsPath | Out-Null
    }

    $nuget = (Join-Path $ToolsPath "nuget.exe")

    if (-not $(Test-Path $nuget)) {
        Write-Host "Downloading nuget.exe official distribution from " $sourceNuGetExe
        Invoke-WebRequest $sourceNuGetExe -OutFile $nuget
    }
    else {
        $info = Get-Command $nuget

        if ("5.3.1.0" -ne $info.Version.ToString()) {
            Write-Host "Updating nuget.exe official distribution from " $sourceNuGetExe
            Invoke-WebRequest $sourceNuGetExe -OutFile $nuget
        }
    }

    # Add the tools directory to the path if not already there
    if (-not ($env:PATH.Contains($ToolsPath))) {
        $env:PATH = "$ToolsPath;$env:PATH"
    }

    return $nuget
}

function Get-NuGetPackage {
    <#
    .SYNOPSIS
        Download and unzip a NuGet package for the purpose of bundling into another package.
    .DESCRIPTION
        Uses nuget command line to download a NuGet package and unzip it into an output
        directory. Uses the Ed-Fi Azure Artifacts package feed by default. Default output directory
        is .\downloads.
    .PARAMETER packageName
        Alias "applicationId". Name of the package to download.
    .PARAMETER packageVersion
        Package version number. Can include pre-release information. Optional. If not
        specified, installs the most recent full release version.
    .PARAMETER toolsPath
        The path in which to find the NuGet command line client.
    .PARAMETER outputDirectory
        The path into which the package is unzipped. Defaults to ".\downloads".
    .PARAMETER packageSource
        The NuGet package source. Defaults to "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json".
    .EXAMPLE
        $parameters = @{
            packageName = "EdFi.Suite3.Ods.WebApi"
            packageVersion = "5.0.0-b11661"
            toolsPath = ".\tools"
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
        [Parameter(Mandatory = $true)]
        $ToolsPath,

        [string]
        $OutputDirectory = '.\downloads',

        [string]
        $PackageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
    )

    $nuget = Install-NuGetCli $ToolsPath

    if (-not $PackageVersion) {
        # Lookup current "latest" version
        $latestVersion = & "$ToolsPath\nuget" list -source $PackageSource $PackageName
        if ($latestVersion) {
            # output is like "packageName packageVersion", split to get second part
            $parts = $latestVersion.split(' ')
            if ($parts.length -eq 2) {
                $PackageVersion = $parts[1]
            }
        }
    }

    $downloadedPackagePath = Join-Path $OutputDirectory "$PackageName.$PackageVersion"

    if (Test-Path $downloadedPackagePath) {
        Write-Debug "Reusing already downloaded package for: $PackageName"

        return $downloadedPackagePath
    }

    $parameters = @(
        "install", $PackageName,
        "-source", $PackageSource,
        "-version", $PackageVersion,
        "-outputDirectory", $OutputDirectory
    )

    Write-Host -ForegroundColor Magenta "$ToolsPath\nuget $parameters"
    & "$ToolsPath\nuget" $parameters | Out-Null

    return Resolve-Path $downloadedPackagePath
}

$exports = @(
    "Install-NuGetCli"
    "Get-NuGetPackage"
)

Export-ModuleMember -Function $exports
