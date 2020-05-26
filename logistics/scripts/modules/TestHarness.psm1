# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"

$testHarnessFolder = (Get-RepositoryResolvedPath "Application\EdFi.Ods.Api.IntegrationTestHarness")
$testHarnessName = (Get-Item $testHarnessFolder).Name

function Get-TestHarnessExecutable {
    $testHarnessExecutableFilter = "$(Get-RepositoryResolvedPath "\Application\$testHarnessName")\bin\**\$testHarnessName.exe"
    $testHarnessExecutable = (Get-ChildItem -Recurse -Path $testHarnessExecutableFilter).FullName

    return $testHarnessExecutable
}

function Start-TestHarness {
    param(
        [Parameter(Mandatory = $true)] [string] $apiUrl,
        [string] $configurationFilePath,
        [string] $environmentFilePath,
        [string] $testHarnessExecutable

    )

    Stop-TestHarness

    if ([string]::IsNullOrEmpty($testHarnessExecutable)) { $testHarnessExecutable = (Get-TestHarnessExecutable) }

    if (-not [string]::IsNullOrEmpty($configurationFilePath)) {
        if (Test-Path $configurationFilePath) {
            $params = @('--configurationFilePath', $configurationFilePath)
            if (-not [string]::IsNullOrEmpty($environmentFilePath)) { $params += @('--environmentFilePath', $environmentFilePath) }

            Write-Host "$testHarnessExecutable $params" -ForegroundColor Magenta
            Start-Process $testHarnessExecutable -ArgumentList ($params -join " ") -NoNewWindow
        }
        else {
            throw "Configuration file '$configurationFilePath' does not exist."
        }
    }
    else {
        Start-Process $testHarnessExecutable -NoNewWindow
    }

    $timeOut = (Get-Date).AddSeconds(60);

    $isPingSuccessful = $false;

    while ($isPingSuccessful -eq $false -and (Get-Date) -le $timeOut) {
        try {
            Invoke-RestMethod -Uri $apiUrl
            $isPingSuccessful = $true;
        }
        catch {
            Write-Host "pinging $apiUrl..."
        }
    }

    if ($isPingSuccessful -eq $false) {
        throw "No response from $apiUrl"
    }
}

function Stop-TestHarness {
    Get-Process -name $testHarnessName -ErrorAction SilentlyContinue |
    ForEach-Object {
        $_ | Sort-Object -Property Name | Format-Table -AutoSize -Wrap | Out-Host
        Stop-Process -Id $_.Id
    }
}

function Invoke-StartTestHarness {
    param(
        [hashtable] $config = (Get-TemplateConfiguration)
    )

    $config = Get-TemplateConfiguration
    $params = @{
        apiUrl                = $config.apiUrlBase
        configurationFilePath = $config.bulkLoadTempJsonConfig
    }
    Start-TestHarness @params
}

Export-ModuleMember -function Invoke-StartTestHarness,
Start-TestHarness,
Stop-TestHarness -Alias *
