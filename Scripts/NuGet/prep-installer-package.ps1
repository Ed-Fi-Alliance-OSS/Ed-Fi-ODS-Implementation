# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

param (
    [string]
    [Parameter(Mandatory = $true)]
    $PackageDirectory,

    [string]
    $AppCommonVersion 
)
$ErrorActionPreference = "Stop"

Push-Location $PackageDirectory

$edFiRepoContainer = "$PackageDirectory/../../../.."
$repositoryNames = @('Ed-Fi-ODS-Implementation')
& "$edFiRepoContainer/Ed-Fi-ODS-Implementation/logistics/scripts/modules/load-path-resolver.ps1" $repositoryNames
Import-Module -Force $folders.modules.invoke("packaging/nuget-helper.psm1")

# Download App Common
$parameters = @{
    PackageName = "EdFi.Installer.AppCommon"
    PackageVersion = $AppCommonVersion
    ToolsPath = "../../../tools"
}
$appCommonDirectory = Get-NuGetPackage @parameters

Copy-Item -Path $appCommonDirectory -Destination $PackageDirectory/AppCommon -recurse -Force

Pop-Location
