# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tasks\TaskHelper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\packaging.psm1')

function New-EdFiStandardDescriptorsPackage {
    param(
        [string]
        $OutputPath = (Join-Path $env:temp 'EdFi.Standard.Descriptors/'),

        # NOTE: the target folder version is the api version the migration utility is migrating to NOT the data standard version
        [hashtable[]]
        $PackageFiles = @(
            @{ src = (Get-RepositoryResolvedPath "../Ed-Fi-Standard/Descriptors/"); target = (Join-Path $OutputPath "any/netcoreapp3.1/Descriptors/3.1") }
        )
    )

    Write-Host "OutputPath $OutputPath"
    $PackageFiles | % { Write-HashtableInfo $_ }

    $config = @{
        OutputPath = $OutputPath
        PackageFiles = $PackageFiles
    }

    $script:tasks = @(
        'Remove-TempDirectory'
        'New-TempDirectory'
        'Copy-PackageFiles'
        'New-PackageNuspec'
    )

    $script:result = @()

    $elapsed = Use-StopWatch {
        foreach ($task in $tasks) {
            $script:result += Invoke-Task -name $task -task { & $task $config }
        }
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format

    return $script:result | Format-Table
}

function Remove-TempDirectory([hashtable] $config) {
    if (-not (Test-Path $config.OutputPath)) { return }

    Remove-Item $config.OutputPath -Force -Recurse

    Write-Host "Removed Temp Directory: " -NoNewLine
    Write-Host $config.OutputPath -ForegroundColor DarkGray
}

function New-TempDirectory([hashtable] $config) {
    $config.OutputPath = New-Item -Force $config.OutputPath -ItemType Directory

    Write-Host "New Temp Directory: " -NoNewLine
    Write-Host $config.OutputPath -ForegroundColor Green

    return $config.OutputPath
}

function Copy-PackageFiles([hashtable] $config) {
    foreach ($file in $config.PackageFiles) {
        New-Item -Path $file.target -ItemType "Directory" -Force
        $items = Get-ChildItem $file.src -Recurse

        foreach ($item in $items) {
            Write-Host "copy $($item.Fullname)" -ForegroundColor DarkGray

            $destination = Copy-Item -Path $item.Fullname -destination $file.target -Force -PassThru

            Write-Host '  -> ' -NoNewLine -ForegroundColor DarkGray
            Write-Host $destination.FullName -ForegroundColor Green
        }
        Write-Host
        Write-Host "$($items.Length) items copied."
        Write-Host
    }
}

function New-PackageNuspec([hashtable] $config) {
    $nuspecPath = Join-Path $config.OutputPath 'package.nuspec'

    $params = @{
        nuspecPath = $nuspecPath
        id = '$id$'
        title = '$title$'
        description = '$description$'
        version = '$version$'
        authors = '$authors$'
        copyright = '$copyright$'
        owners = '$owners$'
        requireLicenseAcceptance = $false
        forceOverwrite = $true
    }
    New-Nuspec @params

    function Add-Files([string] $nuspecPath) {
        [xml]$xml = Get-Content $nuspecPath

        $file = $xml.CreateElement('file')

        $file.SetAttribute('src', '**/*')
        $file.SetAttribute('target', 'contentFiles/')

        $filesElem = $xml.GetElementsByTagName('files')[0]
        $filesElem.AppendChild($file)

        $xml.Save($nuspecPath)
    }

    function Add-ContentFiles([string] $nuspecPath) {
        [xml]$xml = Get-Content $nuspecPath

        $files = $xml.CreateElement('files')

        $files.SetAttribute('include', 'any/netcoreapp2.2/**/*')
        $files.SetAttribute('buildAction', 'None')
        $files.SetAttribute('copyToOutput', 'true')

        $metadata = $xml.GetElementsByTagName('metadata')[0]
        $contentFiles = $xml.CreateElement('contentFiles')
        $metadata.AppendChild($contentFiles)
        $contentFiles.AppendChild($files)

        $xml.Save($nuspecPath)
    }

    Add-Files $nuspecPath
    Add-ContentFiles $nuspecPath

    Write-Host "Nuspec Created: " -NoNewline
    Write-Host (Get-ChildItem $nuspecPath).FullName -ForegroundColor Green
    Write-Host
}

Export-ModuleMember -Function New-EdFiStandardDescriptorsPackage
