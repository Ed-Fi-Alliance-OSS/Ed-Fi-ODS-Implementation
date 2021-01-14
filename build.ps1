# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot/Initialize-PowershellForDevelopment.ps1"

$params = @{
    InstallType   = "Sandbox"
    OdsTokens     = @()
    Engine        = "SqlServer"
    NoCodeGen     = $false
    NoRebuild     = $false
    NoDeploy      = $false
    RunPester     = $false
    RunDotnetTest = $false
    RunPostman    = $false
    RunSmokeTest  = $false
    UsePlugins    = $false
    Settings      = @{ }
}

Write-FlatHashtable $params
Initialize-DevelopmentEnvironment @params
