# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

$databaseTemplateFolder = Resolve-Path "$PSScriptRoot\..\"
$databaseTemplateScriptFolder = "$databaseTemplateFolder\Scripts"
$databaseTemplateModulesFolder = "$databaseTemplateFolder\Modules"
$databaseTemplateDatabaseFolder = "$databaseTemplateFolder\Database"
$databasePopulatedTemplateScriptConfigKey = "databaseTemplate:populatedTemplateScript"
$databaseMinimalTemplateScriptConfigKey = "databaseTemplate:minimalTemplateScript"

# required for get-populated-from-nuget.ps1 and for get-populated-from-web.ps1
$global:templateDatabaseFolder = $databaseTemplateDatabaseFolder
$global:templateFolder = $databaseTemplateFolder

function Get-TemplateScriptNameFromConfig {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configFileName,
        [parameter(Mandatory)]
        [string]$configKey
    )
    $configDoc = New-Object System.Xml.XmlDocument
    $configDoc.Load($configFileName)
    $scriptName = ($configDoc.SelectSingleNode("/configuration/appSettings/add[@key='$configKey']/@value")).Value
    if ([string]::IsNullOrWhiteSpace($scriptName)) { return "" }
    return $scriptName
}

function Get-TemplateScripts {
    $result = @()

    $result += Get-ChildItem $databaseTemplateScriptFolder -File
    $result += Get-ChildItem $databaseTemplateModulesFolder -File

    return ($result | Where-Object { $_.extension -in ".ps1", ".psm1" })
}

function Get-TemplateScriptPath {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$scriptName
    )
    $scriptPath = Get-ChildItem $databaseTemplateScriptFolder -File -Filter "$scriptName.ps1"
    return $scriptPath | Select-Object -First 1 -ExpandProperty FullName
}

# specific for the testing database
function Get-EdFiDefaultPopulatedTemplateBackupPath {
    return Initialize-TemplateSourceFromScriptName -scriptName "Grandbend"
}

function Get-EdFiDefaultMinimalTemplateBackupPath {
    return Initialize-TemplateSourceFromScriptName -scriptName "EdFiMinimalTemplate"
}

function Get-PopulatedTemplateBackupPath {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configFileName
    )
    return Get-TemplateSourceFromConfig -configFileName $configFileName -configKey $databasePopulatedTemplateScriptConfigKey
}

function Get-MinimalTemplateBackupPath {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configFileName
    )
    return Get-TemplateSourceFromConfig -configFileName $configFileName -configKey $databaseMinimalTemplateScriptConfigKey
}

function Invoke-TemplateScript {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$scriptPath
    )
    if (-not (Test-Path $scriptPath)) { return }
    & $scriptPath
}

function Get-TemplateBackupPath {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline)]
        [string]$backupFolder = $databaseTemplateDatabaseFolder
    )
    if (-not (Test-Path $backupFolder)) { return }
    return (Get-ChildItem $backupFolder -File -Filter "*.bak" | Select-Object -First 1 -Expand FullName)
}

function  Get-TemplateSourceFromConfig {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configFileName,
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configKey
    )
    $scriptName = Get-TemplateScriptNameFromConfig -configFileName $configFileName  -configKey $configKey
    return Initialize-TemplateSourceFromScriptName $scriptName
}

function Initialize-TemplateSourceFromScriptName {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$scriptName
    )

    $scriptPath = Get-TemplateScriptPath $scriptName
    $returnedPath = Invoke-TemplateScript $scriptPath

    $returnedValidPath = ($returnedPath -is [string]) -and (-not [string]::IsNullOrWhiteSpace($returnedPath)) -and (Test-Path $returnedPath)
    if ($returnedValidPath) { return $returnedPath }

    return Get-TemplateBackupPath
}

Export-ModuleMember -Function Get-MinimalTemplateBackupPath,
Get-PopulatedTemplateBackupPath,
Get-EdFiDefaultMinimalTemplateBackupPath,
Get-EdFiDefaultPopulatedTemplateBackupPath,
Get-TemplateBackupPath,
Get-TemplateScripts -Alias *
