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

    if (([string]::IsNullOrEmpty($scriptPath)) -or (-not (Test-Path $scriptPath))) { return }

    Write-Host -ForegroundColor Magenta "& $scriptPath"
    & $scriptPath
}

function Assert-NoDuplicatePlugins([hashtable] $Settings) {
    $pluginFolder = (Get-PluginFolderFromSettings $Settings)

    $apiModelFiles = Get-ChildItem -Path $pluginFolder -Filter "ApiModel-EXTENSION.json" -Recurse

    $schemaNameToFolderNames = @{}

    foreach ($apiModelFilePath in $apiModelFiles) {
        $json = Get-Content $apiModelFilePath.FullName | ConvertFrom-Json

        $schemaName = $json.schemaDefinition.physicalName

        $pluginFolderName = (Get-Item $apiModelFilePath.FullName).Directory.Parent.Parent.Name

        if ($schemaNameToFolderNames.ContainsKey($schemaName)) {
            $schemaNameToFolderNames[$schemaName] += $pluginFolderName
        }
        else {
            $schemaNameToFolderNames[$schemaName] = @($pluginFolderName)
        }
    }

    $duplicatePlugins = $schemaNameToFolderNames.GetEnumerator() | Where-Object { $_.Value.Length -gt 1 }

    foreach ($duplicatePlugin in $duplicatePlugins) {
        $message = "Found duplicate plugin extension schema name '$($duplicatePlugin.Name)' in plugin folder: '$pluginFolder'."
        $message += " You will be able to deploy only one of the following plugins '$([string]::Join("' or '", $duplicatePlugin.Value))'."
        $message += " Please remove the conflicting plugins and retry."
        Write-Host $message -ForegroundColor Red
    }

    if ($duplicatePlugins) { throw "Found duplicate plugin extension schema name." }
}

function Get-Plugins([hashtable] $Settings) {

    $folder = (Get-PluginFolderFromSettings $Settings)
    $scripts = (Get-PluginScriptsFromSettings $Settings)

    $result = @()

    $prefix = "EdFi.Suite3.Ods."
    $filePath = (Get-RepositoryResolvedPath 'configuration.packages.json')
    foreach ($script in $scripts) {
        $scriptPath = Get-PluginScript $folder $script

        if("profiles.sample" -ne $script){
            $originalConfig = Get-Content $filePath | ConvertFrom-Json
            Update-PackageName $script  $filePath
            $extensionPath = Invoke-PluginScript $scriptPath
            $originalConfig | ConvertTo-Json | Format-Json | Out-File -FilePath $filePath -Encoding UTF8
        }
        else {
            $extensionPath = Invoke-PluginScript $scriptPath
        }

        Write-Host "Extension path" $extensionPath
        $extensionFolder = Split-Path $extensionPath -leaf
        Write-Host "Foldername" $extensionFolder

        $newExtensionFolderName = $extensionFolder -replace "^$prefix"
        $postfix = "(.*$script).*"
        $newExtensionFolderName = $newExtensionFolderName -replace "$postfix", '$1'
        $newExtensionPath = Join-Path $folder $newExtensionFolderName
        Write-Host "New Extension path" $newExtensionPath

        if (Test-Path $newExtensionPath) {
            Remove-Item $newExtensionPath -Recurse 
        }

        Rename-Item -Path $extensionPath -NewName $newExtensionFolderName -Force
        $result += $newExtensionPath
    }

    Assert-NoDuplicatePlugins $Settings

    return $result
}

function Update-PackageName([string] $scriptName, [string] $filePath) {

    $config = Get-Content $filePath | ConvertFrom-Json
    $packageName = $config.packages.($scriptName).PackageName
   
    $StandardVersion = $Settings.ApiSettings.StandardVersion
    $internalExtensions = @("sample", "homograph")

    if($internalExtensions -contains $scriptName){
        $config.packages.($scriptName).PackageName = $packageName.Replace("{StandardVersion}",$StandardVersion)
    }
    elseif('tpdm' -contains $scriptName){
        $config.packages.($scriptName).PackageName = $packageName.Replace("{StandardVersion}",$StandardVersion).Replace("{ExtensionVersion}", $Settings.ApiSettings.ExtensionVersion)
    }
    $config | ConvertTo-Json | Format-Json | Out-File -FilePath $filePath -Encoding UTF8

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
