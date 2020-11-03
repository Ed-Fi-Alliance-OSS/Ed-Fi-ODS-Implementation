# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

function Get-PluginFolderFromSettings([hashtable] $Settings) {

    $folder = $Settings.Plugin.Folder

    if ($null -eq $folder) { return [string]::Empty }

    if (-not (Test-Path $folder)) { $folder = (Join-Path (Get-RepositoryResolvedPath).Path $folder) }

    if (-not (Test-Path $folder)) { $folder = (Get-RepositoryResolvedPath $folder) }

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

function Get-PluginScriptsForPackaging([hashtable] $Settings) {

    $result = @()

    $pluginFolder = (Get-PluginFolderFromSettings $Settings)

    $result += Get-ChildItem $pluginFolder -Recurse -File | Where-Object { $_.extension -notin ".nupkg", ".dll" }

    return $result
}

Export-ModuleMember -Function Get-Plugins, Get-PluginScriptsForPackaging
