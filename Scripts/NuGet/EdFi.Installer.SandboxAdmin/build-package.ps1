# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5
param (
    [string]
    [Parameter(Mandatory = $true)]
    $SemanticVersion,

    [string]
    $BuildCounter,

    [string]
    $PreReleaseLabel,

    [switch]
    $Publish,

    [string]
    $NuGetFeed,

    [string]
    $NuGetApiKey  
)
$ErrorActionPreference = "Stop"

Invoke-Expression "$PSScriptRoot/../prep-installer-package.ps1 $PSScriptRoot"

$verbose = $PSCmdlet.MyInvocation.BoundParameters["Verbose"]

Import-Module "$PSScriptRoot/../../../logistics/scripts/modules/packaging/create-package.psm1" -Force

$parameters = @{
    PackageDefinitionFile = Resolve-Path ("$PSScriptRoot/EdFi.Installer.SandboxAdmin.nuspec")
    Version               = $SemanticVersion
    OutputDirectory       = Resolve-Path $PSScriptRoot
    Publish               = $Publish
    Source                = $NuGetFeed
    ApiKey                = $NuGetApiKey
    ToolsPath             = "../../../tools"
}

if ($BuildCounter) { $parameters.Suffix = "$PreReleaseLabel$($BuildCounter.PadLeft(4,'0'))" }

Invoke-CreatePackage @parameters -Verbose:$verbose
