# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

[cmdletbinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    $FeedsURL,

    [Parameter(Mandatory = $true)]
    $PackagesURL,

    [Parameter(Mandatory = $true)]
    $Username,

    [Parameter(Mandatory = $true)]
    [SecureString] $Password,

    [Parameter(Mandatory = $true)]
    $View
)

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/promotion.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/utility/hashtable.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/tasks/TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/tasks/TaskHelper.psm1")

function Select-DatabaseTemplatePackages {
    & "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
    Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/utility/hashtable.psm1')

    $configurationFile = (Get-RepositoryResolvedPath 'DatabaseTemplate/Scripts/configuration.json')

    $configuration = Get-Content $configurationFile | ConvertFrom-Json | ConvertTo-Hashtable

    $result = @{ }

    foreach ($key in $configuration.Keys) { $result.add($configuration[$key].PackageName.ToLower().Trim(), $configuration[$key].PackageVersion) }

    return $result
}

function Select-DotNetToolPackages {

    $parameters = @{
        SettingsFiles = @(
            "$(Get-RepositoryResolvedPath 'Application/EdFi.Ods.WebApi')/appsettings.json"
        )
        Project       = (Get-ProjectTypes).WebApi
    }

    $settings = Get-MergedAppSettings @parameters

    $result = @{ }

    foreach ($key in $settings.Tools.Keys) {
        $result.add(
            $settings.Tools[$key].Name.ToLower().Trim(),
            $settings.Tools[$key].Version
        )
    }

    return $result
}

function Select-PluginPackages {
    $pluginFolder = Get-PluginFolderFromSettings (Get-EdFiDeveloperPluginSettings)
    $configurationFile = Join-Path $pluginFolder "configuration.json"
    $configuration = Get-Content $configurationFile | ConvertFrom-Json | ConvertTo-Hashtable

    $result = @{ }

    foreach ($key in $configuration.Keys) { $result.add($configuration[$key].PackageName.ToLower().Trim(), $configuration[$key].PackageVersion) }

    return $result
}

$packages = @{ }

Invoke-Task -name 'gather package versions' -task {

    $searchPaths = (Get-ChildItem (Get-RepositoryRoot) -Recurse -Filter '*.sln').FullName

    $packages = Merge-Hashtables @(
        (Select-DotNetPackages $searchPaths),
        (Select-DotNetToolPackages),
        (Select-DatabaseTemplatePackages),
        (Select-PluginPackages)
    )
    $azurePackages = (Get-AzurePackages $FeedsURL)

    $result = @{ }

    # intersection
    foreach ($key in $packages.Keys) {
        if (-not ($key -in $azurePackages.keys)) { continue }
        $result.add($key.ToLower(), $packages[$key])
    }

    Write-Host "Found $($result.Count) packages in common:"

    Write-FlatHashtable $result
}

Invoke-Task -name 'promote packages' -task {

    $parameters = @{
        PackagesURL = $PackagesURL
        Username    = $Username
        Password    = $Password
        View        = $View
        Packages    = $result
    }

    if (-not $PSCmdlet.ShouldProcess($PackagesURL)) { $parameters.WhatIf = $true }

    Invoke-PromotePackages @parameters
}
