# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

param (
    [string]
    [Parameter(Mandatory = $true)]
    $PackageDirectory
)
$ErrorActionPreference = "Stop"

Push-Location $PackageDirectory

$dependencyVersions = @{
    AppCommon = "1.0.0-pre1061"
}

$edFiRepoContainer = "$PackageDirectory/../../../.."
$repositoryNames = @('Ed-Fi-ODS-Implementation')
& "$edFiRepoContainer/Ed-Fi-ODS-Implementation/logistics/scripts/modules/load-path-resolver.ps1" $repositoryNames
Import-Module -Force $folders.modules.invoke("packaging/nuget-helper.psm1")

# Download App Common
$parameters = @{
    PackageName = "EdFi.Installer.AppCommon"
    PackageVersion = $dependencyVersions.AppCommon
    ToolsPath = "../../../tools"
}
$appCommonDirectory = Get-NuGetPackage @parameters

# Copy Ed-Fi-XYZ folders from App Common folder to current
@(
    "Ed-Fi-ODS"
    "Ed-Fi-ODS-Implementation"
) | ForEach-Object {
    Copy-Item -Recurse -Path $appCommonDirectory/$_ -Destination $PackageDirectory -Force
}

# Move AppCommon's modules into Ed-Fi-ODS-Implementation so that they are discoverable with pathresolver
@(
    "Application"
    "Environment"
    "IIS"
) | ForEach-Object {
    $parameters = @{
        Recurse = $true
        Force = $true
        Path = "$appCommonDirectory/$_"
        Destination = "$PackageDirectory/Ed-Fi-ODS-Implementation/logistics/scripts/modules"
    }
    Copy-Item @parameters
}

Pop-Location
