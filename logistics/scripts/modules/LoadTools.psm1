# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.


$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tasks\TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\restore-packages.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\settings\settings-management.psm1')

function Invoke-RestoreLoadToolsPackages {
    param(
        [hashtable] $config
    )

    $toolsPath = Join-Path (Get-RepositoryResolvedPath) 'tools'
    Restore-Packages -toolsPath $toolsPath -solutionPath (Get-ChildItem $config.loadToolsSolution).FullName
}

function Invoke-BuildLoadTools {
    param(
        [hashtable] $config
    )

    $buildConfiguration = $config.buildConfiguration

    $msBuildParameters = @(
        "`"/property:Configuration=$($buildConfiguration)`"",
        "`"/target:clean;build`"",
        "`"/verbosity:minimal`"",
        "`"/m`"",
        "`"/nr:false`"",
        "`"/p:Platform=Any CPU`""
    ) -join ' '

    $params = @{
        Path                           = (Get-ChildItem $config.loadToolsSolution).FullName
        MsBuildParameters              = $msBuildParameters
        ShowBuildOutputInCurrentWindow = $true
    }

    if (-not [string]::IsNullOrWhiteSpace($config.msbuild_exe)) { $params.MsBuildFilePath = $config.msbuild_exe }

    ($params).GetEnumerator() | Sort-Object -Property Name | Format-Table -HideTableHeaders -AutoSize -Wrap | Out-Host
    $buildResult = Invoke-MsBuild @params

    if ($buildResult.BuildSucceeded -eq $true) { return }
    if ($null -eq $buildResult.BuildSucceeded -or $buildResult.BuildSucceeded -eq $false) {
        throw "Build failed after $(Get-DurationString $buildResult.BuildDuration). Check the build log file '$($buildResult.BuildLogFilePath)' for errors."
    }
}

function Invoke-SmokeTestClient {
    param(
        [hashtable] $config
    )

    Write-HashtableInfo $config

    $smokeTestExecutable = (Get-ChildItem -Recurse $config.smokeTestExecutable).FullName
    $smokeTestSdkDll = (Get-ChildItem -Recurse $config.smokeTestDll).FullName
    $testSetDependsOnSdk = ($config.testSets -contains 'NonDestructiveSdk') -or ($config.testSets -contains 'DestructiveSdk')

    if (-not (Test-Path $smokeTestExecutable)) { throw [System.IO.FileNotFoundException] "$smokeTestExecutable not found." }

    if ([string]::IsNullOrWhiteSpace($config.apiUrlBase)) {throw "apiUrlBase is required"}
    if ([string]::IsNullOrWhiteSpace($config.apiKey)) { throw "apiKey is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiSecret)) { throw "apiSecret is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiYear)) { $config.apiYear = [string]::Empty }

    if ([string]::IsNullOrWhiteSpace($config.apiNamespaceUri)) { $config.apiNamespaceUri = "http://edfi.org" }

    if ($testSetDependsOnSdk -and -not (Test-Path $smokeTestSdkDll)) { throw [System.IO.FileNotFoundException]  "$smokeTestSdkDll not found." }

    foreach ($testSet in $config.testSets) {
        $params = @(
            '-b', '"{0}"' -f $config.apiUrlBase
            '-k', '"{0}"' -f $config.apiKey
            '-s', '"{0}"' -f $config.apiSecret
            '-n', '"{0}"' -f $config.apiNamespaceUri
            '-t', '"{0}"' -f $testSet
        )

        if ($config.apiYear) { $params += ('-y', '"{0}"' -f $config.apiYear) }
        if ($testSetDependsOnSdk) { $params += ('-l', '"{0}"' -f $smokeTestSdkDll) }

        Write-Host -ForegroundColor Magenta $smokeTestExecutable $params
        $exitCode = (Start-Process -FilePath $smokeTestExecutable -ArgumentList $params -NoNewWindow -PassThru -Wait).ExitCode

        Test-Error
        if ($exitCode -gt 0) { throw "$testSet exited with an error" }
    }
}

function Invoke-BulkLoadClient {
    param(
        [hashtable] $config
    )

    Write-HashtableInfo $config

    $apiKey = $config.apiKey
    $apiSecret = $config.apiSecret
    $apiBaseUrl = $config.apiUrlBase
    $apiYear = $config.apiYear
    $bulkLoadConnectionLimit = $config.bulkLoadConnectionLimit
    $bulkLoadDirectoryData = $config.bulkLoadDirectoryData
    $bulkLoadDirectoryMetadata = $config.bulkLoadDirectoryMetadata -replace '\\', '/'
    $bulkLoadDirectorySchema = $config.bulkLoadDirectorySchema -replace '\\', '/'
    $bulkLoadDirectoryWorking = $config.bulkLoadDirectoryWorking -replace '\\', '/'
    $bulkLoadForceReloadMetadata = $config.bulkLoadForceReloadMetadata -replace '\\', '/'
    $bulkLoadMaxRequests = $config.bulkLoadMaxRequests
    $BulkLoadNoXmlValidation = $config.BulkLoadNoXmlValidation
    $bulkLoadRetries = $config.bulkLoadRetries
    $bulkLoadTaskCapacity = $config.bulkLoadTaskCapacity

    $params = @()
    if (-not [string]::IsNullOrWhiteSpace($apiKey)) { $params += "-k", $apiKey }
    if (-not [string]::IsNullOrWhiteSpace($apiSecret)) { $params += "-s", $apiSecret }
    if (-not [string]::IsNullOrWhiteSpace($apiBaseUrl)) { $params += "-b", $apiBaseUrl }
    if (-not [string]::IsNullOrWhiteSpace($apiYear)) { $params += "-y", $apiYear }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadConnectionLimit)) { $params += "-c", $bulkLoadConnectionLimit }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadDirectoryData)) { $params += "-d", "`"$bulkLoadDirectoryData`"" }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadDirectoryMetadata)) { $params += "-i", "`"$bulkLoadDirectoryMetadata`"" }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadDirectorySchema)) { $params += "-x", "`"$bulkLoadDirectorySchema`"" }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadDirectoryWorking)) { $params += "-w", "`"$bulkLoadDirectoryWorking`"" }
    if ($bulkLoadForceReloadMetadata) { $params += "-f" }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadMaxRequests)) { $params += "-l", $bulkLoadMaxRequests }
    if ($BulkLoadNoXmlValidation) { $params += "-n" }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadRetries)) { $params += "-r", $bulkLoadRetries }
    if (-not [string]::IsNullOrWhiteSpace($bulkLoadTaskCapacity)) { $params += "-t", $bulkLoadTaskCapacity }

    $executable = (Get-ChildItem -Recurse $config.bulkLoadClientExecutable).FullName

    Write-Host -ForegroundColor Magenta $executable $params
    $exitCode = (Start-Process -FilePath $executable -ArgumentList $params -NoNewWindow -PassThru -Wait).ExitCode

    Test-Error
    if ($exitCode -gt 0) { throw "BulkLoadClient exited with non-zero exit code" }
}

function Get-RandomString {
    Param(
        [int] $length = 20
    )
    return ([char[]]([char]65..[char]90) + ([char[]]([char]97..[char]122)) + 0..9 | Sort-Object { Get-Random })[0..$length] -join ""
}

function Invoke-SetTestHarnessConfig {
    param(
        [hashtable] $config
    )

    $settings = $config.appSettings

    if ($config.noExtensions)
    {
        $settings = Set-Feature -Settings $settings -FeatureName "Extensions" -IsEnabled $false
    }

    New-JsonFile $config.appSettingsFiles[-1] $settings -Overwrite
}

Export-ModuleMember -function Add-RandomKeySecret,
Get-RandomString,
Invoke-BulkLoadClient,
Invoke-SmokeTestClient,
Invoke-BuildLoadTools,
Invoke-RestoreLoadToolsPackages,
Invoke-SetTestHarnessConfig  -Alias *
