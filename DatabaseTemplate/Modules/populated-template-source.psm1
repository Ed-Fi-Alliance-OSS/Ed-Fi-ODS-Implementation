# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

$global:populatedTemplateFolder = Resolve-Path "$PSScriptRoot\..\"
$global:populatedTemplateScriptFolder = "$global:populatedTemplateFolder\Scripts"
$global:populatedTemplateModulesFolder = "$global:populatedTemplateFolder\Modules"
$global:populatedTemplateDatabaseFolder = "$global:populatedTemplateFolder\Database"
$script:populatedTemplateDefaultScript = "$global:populatedTemplateModulesFolder\get-populated-from-nuget.ps1"
$script:populatedTemplateScriptConfigKey = "PopulatedTemplateScript"

function Get-PopulatedTemplateScriptNameFromConfig {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configName
    )
    $jsonFromFile = (Get-Content $configName -Raw -Encoding UTF8 | ConvertFrom-JSON)
    $sandboxtemplate=$jsonFromFile.ApiSettings.SandboxTemplate
   
    Write-Warning "This script is deprecated, and will be removed in the near future. Use the script database-template-source.psm1 instead." | Out-Host
    $scriptName = $sandboxtemplate.Where({$_.Key -eq $script:populatedTemplateScriptConfigKey}).Value
    if ([string]::IsNullOrWhiteSpace($scriptName)) { return "" }
    return $scriptName
}

function Get-PopulatedTemplateScripts {
    Write-Warning "This script is deprecated, and will be removed in the near future. Use the script database-template-source.psm1 instead." | Out-Host
    $result = @()

    $result += Get-ChildItem $global:populatedTemplateScriptFolder -File
    $result += Get-ChildItem $global:populatedTemplateModulesFolder -File

    return ($result | Where-Object { $_.extension -in ".ps1", ".psm1" })
}

function Get-PopulatedTemplateScriptPath {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$scriptName
    )
    Write-Warning "This script is deprecated, and will be removed in the near future. Use the script database-template-source.psm1 instead." | Out-Host
    $scriptPath = Get-ChildItem $global:populatedTemplateScriptFolder -File -Filter "$scriptName.ps1"
    return $scriptPath | Select-Object -First 1 -ExpandProperty FullName
}

function Invoke-PopulatedTemplateScript {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$scriptPath
    )
    Write-Warning "This script is deprecated, and will be removed in the near future. Use the script database-template-source.psm1 instead." | Out-Host
    if (-not (Test-Path $scriptPath)) { return }
    & $scriptPath
}

function Get-PopulatedTemplateBackupPath {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline)]
        [string]$backupFolder = $global:populatedTemplateDatabaseFolder
    )
    Write-Warning "This script is deprecated, and will be removed in the near future. Use the script database-template-source.psm1 instead." | Out-Host
    if (-not (Test-Path $backupFolder)) { return }
    return (Get-ChildItem $backupFolder -File -Filter "*.bak" | Select-Object -First 1 -Expand FullName)
}

function Initialize-PopulatedTemplateSource {
    [CmdletBinding()] param(
        [parameter(ValueFromPipeline, Mandatory)]
        [string]$configName
    )
    Write-Warning "This script is deprecated, and will be removed in the near future. Use the script database-template-source.psm1 instead." | Out-Host
    $scriptName = Get-PopulatedTemplateScriptNameFromConfig $configName
    $scriptPath = Get-PopulatedTemplateScriptPath $scriptName
    Invoke-PopulatedTemplateScript $scriptPath
}

Export-ModuleMember -Function * -Alias *
