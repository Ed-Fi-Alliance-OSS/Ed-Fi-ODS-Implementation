# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

function Get-PluginFolderFromSettings([hashtable] $Settings) {

    $folder = $Settings.Plugin.Folder

    if ([string]::IsNullOrWhitespace($folder)) { return [string]::Empty }

    # if an absolute path is provided, just return it
    if ([System.IO.Path]::IsPathRooted($folder)) { return $folder }

    # in a developer environment the plugin folder is relative to the WebApi project
    if (-not (Test-Path $folder)) { $folder = (Join-Path (Get-RepositoryResolvedPath) "$((Get-ProjectTypes).WebApi)/$($Settings.Plugin.Folder)") }

    # in a deployment environment the plugin folder is relative to the repo since the WebApi project is not a part of the database package
    if (-not (Test-Path $folder)) { $folder = (Get-RepositoryResolvedPath $Settings.Plugin.Folder) }

    return (Resolve-Path $folder)
}

function Get-PluginScriptsFromSettings([hashtable] $Settings) {

    $scripts = $Settings.Plugin.Scripts

    if ($null -eq $scripts) { return @() }

    return , $scripts
}

function Get-PluginScript([string] $pluginFolder, [string] $scriptName) {

    $scriptPath = Get-ChildItem $pluginFolder -File -Filter "$scriptName.ps1"

    return ($scriptPath | Select-Object -First 1 -ExpandProperty FullName)
}

function Invoke-PluginScript([string] $scriptPath) {

    if (($null -eq $scriptPath) -or (-not (Test-Path $scriptPath))) { return }

    Write-Host -ForegroundColor Magenta "& $scriptPath"
    & $scriptPath
}

function Get-Plugins([hashtable] $Settings) {

    $folder = (Get-PluginFolderFromSettings $Settings)
    $scripts = (Get-PluginScriptsFromSettings $Settings)

    $result = @()

    foreach ($script in $scripts) {
        $scriptPath = Get-PluginScript $folder $script
        $extensionPath = Invoke-PluginScript $scriptPath
        Write-Host $extensionPath
        $result += $extensionPath
    }

    return $result
}

function Remove-Plugins([hashtable] $Settings) {
    $folder = (Get-PluginFolderFromSettings $Settings)

    if ([string]::IsNullOrWhitespace($folder)) { return }
    if (-not (Test-Path $folder)) { return }

    Write-Host $folder
    Get-ChildItem -Path $folder -Directory -Recurse | Remove-Item -Recurse
}

function Get-PluginScriptsForPackaging([hashtable] $Settings) {

    $pluginScripts = Get-ChildItem (Get-PluginFolderFromSettings $Settings) -File

    return ($pluginScripts | Where-Object { $_.extension -in ".ps1", ".psm1" }).FullName
}

Export-ModuleMember -Function Get-PluginFolderFromSettings, Get-PluginScriptsFromSettings, Get-Plugins, Remove-Plugins, Get-PluginScriptsForPackaging
