# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5
param (
    [string]
    [Parameter(Mandatory=$true)]
    $SemanticVersion,

    [string]
    [Parameter(Mandatory=$true)]
    $BuildCounter,

    [string]
    $PreReleaseLabel = "pre",

    [switch]
    $Publish,

    [string]
    $NuGetFeed
)
$ErrorActionPreference = "Stop"

Invoke-Expression "$PSScriptRoot/../prep-installer-package.ps1 $PSScriptRoot"

$verbose = $PSCmdlet.MyInvocation.BoundParameters["Verbose"]

Import-Module "$PSScriptRoot/../../../logistics/scripts/modules/packaging/create-package.psm1" -Force

$parameters = @{
    PackageDefinitionFile = Resolve-Path ("$PSScriptRoot/EdFi.Installer.SandboxAdmin.nuspec")
    Version = $SemanticVersion
    Suffix = "$PreReleaseLabel$($BuildCounter.PadLeft(4,'0'))"
    OutputDirectory = Resolve-Path $PSScriptRoot
    Publish = $Publish
    Source = $NuGetFeed
    ToolsPath = "../../../tools"
}
Invoke-CreatePackage @parameters -Verbose:$verbose
