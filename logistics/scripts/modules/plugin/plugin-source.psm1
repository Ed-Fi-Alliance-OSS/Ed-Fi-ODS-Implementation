# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

$script:pluginFolderConfigKey = 'plugin:folder'
$script:pluginScriptConfigKey = 'plugin:script'
$script:defaultConfig = 'Application\EdFi.Ods.WebApi\appsettings.json'

function Get-PluginFolderFromConfig {
    param(
        $configFile = (Get-RepositoryResolvedPath $script:defaultConfig)
    )
    $jsonFromFile = (Get-Content $configFile -Raw -Encoding UTF8 | ConvertFrom-JSON)
    $folder = $jsonFromFile.Plugin.Folder

    if ($null -eq $folder) { return [string]::Empty }

    if (-not (Test-Path $folder)) { $folder = Join-Path $configFile $folder }

    return Resolve-Path $folder
}

function Get-PluginScriptsFromConfig {
    param(
        $configFile = (Get-RepositoryResolvedPath $script:defaultConfig)
    )

    $jsonFromFile = (Get-Content $configFile -Raw -Encoding UTF8 | ConvertFrom-JSON)
    $scripts = $jsonFromFile.Plugin.Scripts

    if ($null -eq $scripts) { return [string]::Empty }
    return $scripts.Split(',')
}

function Get-PluginScript {
    param(
        [parameter(Mandatory)] $pluginFolder,
        [parameter(ValueFromPipeline, Mandatory)] $scriptName
    )

    $scriptPath = Get-ChildItem $pluginFolder -File -Filter "$scriptName.ps1"
    return $scriptPath | Select-Object -First 1 -ExpandProperty FullName
}

function Invoke-PluginScript {
    param(
        [parameter(ValueFromPipeline, Mandatory)] $scriptPath
    )

    if (($null -eq $scriptPath) -or (-not (Test-Path $scriptPath))) { return }
    & $scriptPath
}

function Get-Plugins {
    param(
        $configFile = (Get-RepositoryResolvedPath $script:defaultConfig)
    )

    $pluginFolder = (Get-PluginFolderFromConfig $configFile)

    return Get-PluginScriptsFromConfig $configFile |
        Get-PluginScript $pluginFolder |
        Invoke-PluginScript
}

function Get-PluginScriptsForPackaging {

    $result = @()

    $pluginFolder = (Get-RepositoryResolvedPath "Plugin").Path

    $result += Get-ChildItem $pluginFolder -Recurse -File | Where-Object { $_.extension -notin ".nupkg", ".dll" -and $_.directoryname -notlike "*Homograph*" }

    return $result
}

Export-ModuleMember -Function 'Invoke-PluginScript', 'Get-PluginScriptsForPackaging'
