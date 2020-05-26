# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.


$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tasks\TaskHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\restore-packages.psm1')

function Get-Configuration {
    Merge-Configurations $global:templateConfiguration (& $global:templateConfigurationScript)

    return $global:templateConfiguration
}

function Invoke-RestoreLoadToolsPackages {
    param(
        [hashtable] $config = (Get-Configuration)
    )

    $toolsPath = Join-Path (Get-RepositoryResolvedPath) 'tools'
    Restore-Packages -toolsPath $toolsPath -solutionPath (Get-ChildItem $config.loadToolsSolution).FullName
}

function Invoke-BuildLoadTools {
    param(
        [hashtable] $config = (Get-Configuration),
        [string] $msBuildFilePath = $env:msbuild_exe
    )

    $buildConfiguration = $config.buildConfiguration
    if ($config.buildConfiguration -eq 'Npgsql') { $buildConfiguration = 'Debug' }

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

    if (-not [string]::IsNullOrWhiteSpace($msBuildFilePath)) { $params.MsBuildFilePath = $msBuildFilePath }

    ($params).GetEnumerator() | Sort-Object -Property Name | Format-Table -HideTableHeaders -AutoSize -Wrap | Out-Host
    $buildResult = Invoke-MsBuild @params

    if ($buildResult.BuildSucceeded -eq $true) { return }
    if ($null -eq $buildResult.BuildSucceeded -or $buildResult.BuildSucceeded -eq $false) {
        throw "Build failed after $(Get-DurationString $buildResult.BuildDuration). Check the build log file '$($buildResult.BuildLogFilePath)' for errors."
    }
}

function Invoke-SmokeTestClient {
    param(
        [hashtable] $config = (Get-Configuration)
    )

    Write-HashtableInfo $config

    $smokeTestExecutable = (Get-ChildItem -Recurse $config.smokeTestExecutable).FullName
    $smokeTestSdkDll = (Get-ChildItem -Recurse $config.smokeTestDll).FullName
    $testSetDependsOnSdk = ($config.testSets -contains 'NonDestructiveSdk') -or ($config.testSets -contains 'DestructiveSdk')

    if (-not (Test-Path $smokeTestExecutable)) { throw [System.IO.FileNotFoundException] "$smokeTestExecutable not found." }

    if ([string]::IsNullOrWhiteSpace($config.apiUrlOAuth)) { throw "apiUrlOAuth is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiUrlMetadata)) { throw "apiUrlMetdata is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiUrlData)) { throw "apiUrlData is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiKey)) { throw "apiKey is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiSecret)) { throw "apiSecret is required" }
    if ([string]::IsNullOrWhiteSpace($config.apiYear)) { $config.apiYear = [string]::Empty }

    if ([string]::IsNullOrWhiteSpace($config.apiNamespaceUri)) { $config.apiNamespaceUri = "http://edfi.org" }

    if ($testSetDependsOnSdk -and -not (Test-Path $smokeTestSdkDll)) { throw [System.IO.FileNotFoundException]  "$smokeTestSdkDll not found." }

    foreach ($testSet in $config.testSets) {
        $parms = @(
            '-o', '"{0}"' -f $config.apiUrlOAuth
            '-m', '"{0}"' -f $config.apiUrlMetadata
            '-a', '"{0}"' -f $config.apiUrlData
            '-k', '"{0}"' -f $config.apiKey
            '-s', '"{0}"' -f $config.apiSecret
            '-n', '"{0}"' -f $config.apiNamespaceUri
            '-t', '"{0}"' -f $testSet
        )

        if ($config.apiYear) { $parms += ('-y', '"{0}"' -f $config.apiYear) }
        if ($testSetDependsOnSdk) { $parms += ('-l', '"{0}"' -f $smokeTestSdkDll) }

        $cmd = $smokeTestExecutable + $parms
        Write-Host -ForegroundColor Magenta $cmd

        $exitCode = (Start-Process -FilePath $smokeTestExecutable -ArgumentList $parms -NoNewWindow -PassThru -Wait).ExitCode

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
    $apiUrlData = $config.apiUrlData
    $apiUrlMetadata = $config.apiUrlMetadata
    $apiUrlDependencies = $config.apiUrlDependencies
    $apiUrlOAuth = $config.apiUrlOAuth
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
    if (-not [string]::IsNullOrWhiteSpace($apiUrlData)) { $params += "-a", $apiUrlData }
    if (-not [string]::IsNullOrWhiteSpace($apiUrlMetadata)) { $params += "-m", $apiUrlMetadata }
    if (-not [string]::IsNullOrWhiteSpace($apiUrlOAuth)) { $params += "-o", $apiUrlOAuth }
    if (-not [string]::IsNullOrWhiteSpace($apiUrlDependencies)) { $params += "-g", $apiUrlDependencies }
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
    Start-Process -FilePath $executable -ArgumentList $params -NoNewWindow -Wait

    return $totalRecordCount
}

function Get-RandomString {
    Param(
        [int] $length = 20
    )
    return ([char[]]([char]65..[char]90) + ([char[]]([char]97..[char]122)) + 0..9 | Sort-Object { Get-Random })[0..$length] -join ""
}

function Add-RandomKeySecret {
    param(
        [hashtable] $config = (Get-Configuration)
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

function Invoke-SetTestHarnessConfig {
    param(
        [hashtable] $config = (Get-Configuration)
    )

    if ((-not $config.noExtensions) -and (-not $config.noChanges)) { return }

    $testHarnessAppConfig = (Get-ChildItem -Recurse $config.testHarnessAppConfig).FullName
    Write-Host "Editing $testHarnessAppConfig"

    $xml = [xml](Get-Content $testHarnessAppConfig)

    if ($config.noExtensions) {
        Write-Host "Disabling Extensions..."
        if (($key = $xml.SelectSingleNode("//appSettings/add[@key = 'extensions:featureIsEnabled']"))) {
            $key.SetAttribute("value", "false")
        }
    }

    if ($config.noChanges) {
        Write-Host "Disabling Change Queries..."
        if (($key = $xml.SelectSingleNode("//appSettings/add[@key = 'changeQueries:featureIsEnabled']"))) {
            $key.SetAttribute("value", "false")
        }
    }

    $xml.Save($testHarnessAppConfig)
}

Export-ModuleMember -function Add-RandomKeySecret,
Get-RandomString,
Invoke-BulkLoadClient,
Invoke-SmokeTestClient,
Invoke-BuildLoadTools,
Invoke-RestoreLoadToolsPackages,
Invoke-SetTestHarnessConfig  -Alias *
