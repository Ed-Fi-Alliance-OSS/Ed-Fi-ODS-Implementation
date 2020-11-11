# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')

$script:testHarnessFolder = (Get-RepositoryResolvedPath "Application\EdFi.Ods.Api.IntegrationTestHarness")
$script:testHarnessName = (Get-Item $script:testHarnessFolder).Name

function Add-RandomKeySecret {
    param(
        [hashtable] $config
    )

    $content = (Get-Content (Get-ChildItem $config.testHarnessJsonConfig).FullName -Raw -Encoding UTF8 | ConvertFrom-Json)
    foreach ($vendor in $content.vendors) {
        foreach ($application in $vendor.applications) {
            foreach ($apiClient in $application.apiClients) {
                if (-not @($config.apiClientNameBootstrap, $config.apiClientNameSandbox) -contains $apiClient.ApiClientName) { continue; }

                if ([string]::IsNullOrWhiteSpace($config.apiKey)) { $randomKey = Get-RandomString }
                else { $randomKey = $config.apiKey }

                if ([string]::IsNullOrWhiteSpace($config.apiSecret)) { $randomSecret = Get-RandomString }
                else { $randomSecret = $config.apiSecret }

                $apiClient | Add-Member -MemberType NoteProperty -Name 'Key' -Value $randomKey
                $apiClient | Add-Member -MemberType NoteProperty -Name 'Secret' -Value $randomSecret

                $apiClient | Format-List | Out-Host

                if ($apiClient.ApiClientName -eq $config.apiClientNameBootstrap) {
                    $config.apiBootstrapKey = $randomKey
                    $config.apiBootstrapSecret = $randomSecret
                }
                if ($apiClient.ApiClientName -eq $config.apiClientNameSandbox) {
                    $config.apiSandboxKey = $randomKey
                    $config.apiSandboxSecret = $randomSecret
                }

                $testHarnessJsonConfigLEAs = $config.testHarnessJsonConfigLEAs
                if (-not ($null -eq $testHarnessJsonConfigLEAs) -and ($testHarnessJsonConfigLEAs.Length -gt 0)) {
                    $apiClient.LocalEducationOrganizations = $testHarnessJsonConfigLEAs
                }
            }
        }
    }

    $bulkLoadTempJsonConfig = $config.bulkLoadTempJsonConfig
    $content | ConvertTo-Json -Depth 10 | Set-Content $bulkLoadTempJsonConfig -Encoding UTF8

    Write-Host "Created Temp Config: $bulkLoadTempJsonConfig"
}

function Get-TestHarnessExecutable {
    $testHarnessExecutableFilter = "$(Get-RepositoryResolvedPath "\Application\$($script:testHarnessName)")\bin\**\$($script:testHarnessName).exe"
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
            $params = @("--configurationFilePath=$configurationFilePath")
            if (-not [string]::IsNullOrEmpty($environmentFilePath)) { $params += @("--environmentFilePath=$environmentFilePath") }
            $params += "--environment=Development"

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

    $response = @{}
    $isPingSuccessful = $false;

    while ($isPingSuccessful -eq $false -and (Get-Date) -le $timeOut) {
        try {
            $response = Invoke-RestMethod -Uri $apiUrl
            $isPingSuccessful = $true;
            Write-Host
        }
        catch {
            Write-Host "Waiting for TestHarness startup at $apiUrl..."
        }
    }

    if ($isPingSuccessful -eq $false) {
        throw "No response from $apiUrl"
    }

    Write-FlatHashtable ($response | ConvertTo-Hashtable)
}

function Stop-TestHarness {
    Get-Process -name $script:testHarnessName -ErrorAction SilentlyContinue |
    ForEach-Object {
        $_ | Sort-Object -Property Name | Format-Table -AutoSize -Wrap | Out-Host
        Stop-Process -Id $_.Id
    }
}

Export-ModuleMember -function Add-RandomKeySecret, Start-TestHarness,
Stop-TestHarness -Alias *
