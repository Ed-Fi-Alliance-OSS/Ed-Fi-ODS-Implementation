# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Octopus lifecycle script called automatically after deploying the EdFi.RestApi.Databases NuGet package created by .\prep-package.ps1
# see: https://octopus.com/docs/deployment-examples/custom-scripts/scripts-in-packages
param(
    [string] $PathResolverRepositoryOverride = $OctopusParameters["PathResolverRepositoryOverride"],
    [string] $InstallType = $OctopusParameters["InstallType"],
    [string] $OdsYears = $OctopusParameters["OdsYears"],
    [string] $OdsTokens = $OctopusParameters["OdsTokens"],
    [string] $Transient = $OctopusParameters["TransientDatabases"],
    [string] $ExcludedExtensionSources = $OctopusParameters["ExcludedExtensionSources"],
    [string] $EnabledFeatureNames = $OctopusParameters["EnabledFeatureNames"],
    [string] $UsePlugins = $OctopusParameters["UsePlugins"],
    [switch] $WhatIf
)

# Fall back to OdsYears Octopus parameter if no tokens provided, for backwards compatibility
if ([string]::IsNullOrWhiteSpace($OdsTokens)) {
    $OdsTokens = $OdsYears
}
foreach ($var in "PathResolverRepositoryOverride", "InstallType", "OdsTokens") {
    if (-not (Test-Path variable:/$var)) {
        throw "Missing Octopus parameter '$var'. This script should be run from an Octopus Tentacle. Either it is being run from outside of a Tentacle, or Octopus is not correctly configured."
    }
}


Import-Module -Force -Scope Global "$PSScriptRoot\Deployment.psm1"

$deploymentParams = @{
    PathResolverRepositoryOverride = $PathResolverRepositoryOverride
    InstallType = $InstallType
    OdsTokens = $OdsTokens
    Transient = [Boolean]::Parse("$Transient")
    ExcludedExtensionSources = $ExcludedExtensionSources
    EnabledFeatureNames = $EnabledFeatureNames
    UsePlugins = [Boolean]::Parse("$UsePlugins")
}
Initialize-DeploymentEnvironment @deploymentParams
