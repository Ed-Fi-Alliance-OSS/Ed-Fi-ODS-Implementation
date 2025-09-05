# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot/../../../../logistics/scripts/modules/load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/utility/cross-platform.psm1")

<#
.SYNOPSIS
    Downloads and extracts the latest compatible version of a NuGet package.

.OUTPUTS
    Directory name containing the downloaded files.

.EXAMPLE
    Get-NugetPackage -PackageName "EdFi.Suite3.RestApi.Databases" -OutputDirectory ".packages"  -PackageVersion "5.3.0"
#>
function Get-NugetPackage {
    [CmdletBinding()]
    [OutputType([String])]
    param(
        # Exact package name
        [Parameter(Mandatory = $true)]
        [string]
        $PackageName,

        # Extracted package output directory
        [Parameter(Mandatory = $false)]
        $OutputDirectory = './downloads',

        # Exact package version
        [Parameter(Mandatory = $true)]
        [string]
        $PackageVersion,

        # URL for the NuGet package feed
        [string]
        $PackageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json",

        [switch]
        $ExcludeVersion
    )

    # The first URL just contains metadata for looking up more useful services
    $nugetServices = Invoke-RestMethod $PackageSource

    $packageService = $nugetServices.resources `
    | Where-Object { $_."@type" -like "PackageBaseAddress*" } `
    | Select-Object -Property "@id" -ExpandProperty "@id"

    $file = "$($PackageName).$($PackageVersion)"

    $zipName = $file
    
    if($ExcludeVersion) {
        $zipName = $PackageName
    }
    
    New-Item -Path $OutputDirectory -Force -ItemType Directory | Out-Null

    Push-Location $OutputDirectory

    if ($null -ne (Get-ChildItem $zipName -ErrorAction SilentlyContinue)) {
        # Already exists, don't re-download
        Pop-Location
        return "$($OutputDirectory)/$($zipName)"
    }

    $lowerId = $PackageName.ToLower()

    try {
        Invoke-RestMethod "$($packageService)$($lowerId)/$($PackageVersion)/$($file).nupkg" -OutFile "$($zipName).zip"

        Expand-Archive "$($zipName).zip" -Force

        Remove-Item "$($zipName).zip"
    }
    catch {
        throw $_
    }
    finally {
        Pop-Location
    }

    return "$($OutputDirectory)/$($zipName)"
}

$exports = @(
    "Install-NuGetCli"
    "Get-NuGetPackage"
)

Export-ModuleMember -Function $exports
