# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5

<#
.description
    Runs Invoke-SdkGen
.parameter configurationFile
    Path to the Json file containing the Integration Test Harness configuration
.parameter apiUrl
    API URL for the Integration Test Harness
.parameter environmentFilePath
    Path to environment file used to run Postman integration tests

    .EXAMPLE
    PS> Invoke-SdkGen.ps1
#>
param(
    [string] $configurationFile = $(Get-RepositoryResolvedPath "logistics/scripts/smokeTestHarnessConfiguration.json"),
    [string] $apiUrl = "http://localhost:8765",
    [string] $environmentFilePath = (Resolve-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath "modules")).Path,
    [Boolean] $generateApiSdkPackage = $false,
    [Boolean] $generateTestSdkPackage = $false,
    [string] $packageVersion,
    [Boolean] $noRestore = $false,
    [String] $standardVersion,
	[String] $javaPath 
)

$ErrorActionPreference = 'Stop'

$error.Clear()

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/load-path-resolver.ps1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'Initialize-PowershellForDevelopment.ps1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/TestHarness.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/restore-packages.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/packaging/create-package.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/settings/settings-teamcity.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/config/config-management.psm1')

function Invoke-SdkGen {
    $script:result = @()
    $sdkGenSolution = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.sln")
    $apiMetadataUrl = ($apiUrl + "/metadata?sdk=true")
    $teamCityParameters = Get-TeamCityParameters
    $envBuildConfiguration = $Env:CONFIGURATION;
    $buildConfiguration = if($null -ne $envBuildConfiguration) { $envBuildConfiguration} else { Get-ValueOrDefault $teamCityParameters['msbuild.buildConfiguration'] 'Debug'}
    $version = if($packageVersion){ $packageVersion } else { (Get-ValueOrDefault $teamCityParameters['version'] '0.0.0') }
    
    Write-Host -ForegroundColor Magenta "Invoke-SdkGen -NoRestore is " $noRestore    
    $elapsed = Use-StopWatch {
        if($generateApiSdkPackage) {

            try {
                $script:result += Invoke-Task "Clean-SdkGen-Console-Output" { Invoke-Clean-SdkGen-Output }
                $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal"  $sdkGenSolution $noRestore $standardVersion }
                $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath $null "EdFiOdsApiSdk" }
                $sdkCliVersion = Get-ValueOrDefault $teamCityParameters['SdkCliVersion'] '7.19.0'
                $arguments = @("-v",$sdkCliVersion,"--core-only","-j","""$javaPath""")
                $script:result += Invoke-Task "Invoke-SdkGenConsole" { Invoke-SdkGenConsole $apiMetadataUrl $buildConfiguration $arguments }
            }
            finally {
                $script:result += Invoke-Task -name "Stop-TestHarness" -task { Stop-TestHarness }
            }

            $sdkSolutionFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/csharp/EdFi.OdsApi.Sdk.sln")
            $script:result += Invoke-Task "Restore-ApiSdk-Packages" { Invoke-Restore-ApiSdk-Packages $sdkSolutionFile }
            $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal" $sdkSolutionFile $noRestore $standardVersion }

            $nuspecFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/EdFi.OdsApi.Sdk.nuspec")
            $suffix = Get-ValueOrDefault $teamCityParameters['odsapi.package.suffix'] ".Suite3"
            Write-Host "Updating package id and title to EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion"
            (Get-Content -path $nuspecFile -Raw) | ForEach-Object {
                $_.replace("<id>EdFi.OdsApi.Sdk</id>","<id>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</id>").replace("<title>EdFi.OdsApi.Sdk</title>","<title>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</title>")
            } | Set-Content -Path $nuspecFile

            $script:result += Invoke-Task "Pack-ApiSdk" { Invoke-Pack-ApiSdk -OutputDirectory -ProjectPath (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/" | Select-Object -ExpandProperty Path) -BuildConfiguration $buildConfiguration -TeamCityParameters $teamCityParameters -Version $version -StandardVersion $standardVersion }
        }

        if($generateTestSdkPackage) {
            try {
                $script:result += Invoke-Task "Clean-SdkGen-Console-Output" { Invoke-Clean-SdkGen-Output }
                $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal" $sdkGenSolution $noRestore $standardVersion }
                $script:result += Invoke-Task -name "Start-TestHarness" -task { Start-TestHarness $apiUrl $configurationFile $environmentFilePath $null "EdFiOdsApiSdk" }
                $sdkCliVersion = Get-ValueOrDefault $teamCityParameters['SdkCliVersion'] '7.19.0'
                $arguments = @("-v",$sdkCliVersion,"-c","-i","-p","-j","""$javaPath""")
                $script:result += Invoke-Task "Invoke-SdkGenConsole" { Invoke-SdkGenConsole $apiMetadataUrl $buildConfiguration $arguments }
            }
            finally {
                $script:result += Invoke-Task -name "Stop-TestHarness" -task { Stop-TestHarness }
            }

            $sdkSolutionFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/csharp/EdFi.OdsApi.Sdk.sln")
            $script:result += Invoke-Task "Restore-TestSdk-Packages" { Invoke-Restore-ApiSdk-Packages $sdkSolutionFile }
            $script:result += Invoke-Task "Invoke-RebuildSolution" { Invoke-RebuildSolution $buildConfiguration "minimal" $sdkSolutionFile $noRestore $standardVersion }

            $nuspecFile = (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/EdFi.OdsApi.Sdk.nuspec")
            $suffix = Get-ValueOrDefault $teamCityParameters['odsapi.package.suffix'] ".Suite3"
            Write-Host "Updating package id and title to EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion"
            (Get-Content -path $nuspecFile -Raw) | ForEach-Object {
                $_.replace("<id>EdFi.OdsApi.Sdk</id>","<id>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</id>").replace("<title>EdFi.OdsApi.Sdk</title>","<title>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</title>").replace("<id>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</id>","<id>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</id>").replace("<title>EdFi$suffix.OdsApi.Sdk.Standard.$standardVersion</title>","<title>EdFi$suffix.OdsApi.TestSdk.Standard.$standardVersion</title>")
            } | Set-Content -Path $nuspecFile

            $script:result += Invoke-Task "Pack-TestSdk" { Invoke-Pack-ApiSdk -ProjectPath (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/" | Select-Object -ExpandProperty Path) -BuildConfiguration $buildConfiguration -TeamCityParameters $teamCityParameters -Version $version }
        }
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
    return $script:result | Format-Table
}

function Invoke-Restore-ApiSdk-Packages {
    param (
        [string] $sdkSolutionFile
    )

    $params = @{
        SolutionPath = $sdkSolutionFile
    }
    Restore-Packages @params
}

function Invoke-Pack-ApiSdk {
    param(
        [string] $BuildConfiguration = "Debug",

        [string[]] $TeamCityParameters = @(),

        [ValidateSet('4.0.0', '5.2.0', '6.1.0')]
        [string] $StandardVersion,

        [string] $ProjectPath = "$ProjectPath/csharp",

        [string] $PackageDefinitionFile = "$ProjectPath/EdFi.OdsApi.Sdk.nuspec",

        [string] $PackageId,

        [string] $Version = "0.0.0",

        [string[]] $Properties = @()
    )

    Invoke-Task -name "$($MyInvocation.MyCommand.Name) ($(Split-Path $ProjectPath -Leaf))" -task {

        if (-not [string]::IsNullOrWhiteSpace($env:msbuild_buildConfiguration)) { $BuildConfiguration = $env:msbuild_buildConfiguration }

        $nugetOutput = Get-ValueOrDefault $teamCityParameters['nuget.pack.output'] 'NugetPackages'

        $params = @(
            "build", $ProjectPath,
            "--configuration", $BuildConfiguration,
            "--no-restore",
            "-p:StandardVersion=$StandardVersion"
        )

        $Properties += @("configuration=$BuildConfiguration")

        Write-Host -ForegroundColor Magenta "& dotnet $params"
        & dotnet $params | Out-Host

        $PackageDefinitionFile = (Get-ChildItem $PackageDefinitionFile)

        # The package must declare what the generated SDK project actually references
        Set-NuspecDependenciesFromProject `
            -PackageDefinitionFile $PackageDefinitionFile `
            -ProjectFile (Join-Path $ProjectPath "csharp/src/EdFi.OdsApi.Sdk/EdFi.OdsApi.Sdk.csproj")

        if (-not [string]::IsNullOrWhiteSpace($PackageId)) {
            [xml] $xml = Get-Content $PackageDefinitionFile
            $xml.package.metadata.id = $PackageId
            $xml.Save($PackageDefinitionFile)
        }

        $params = @{
            PackageDefinitionFile = $PackageDefinitionFile
            Version               = $Version
            Properties            = $Properties
            OutputDirectory       = $nugetOutput
        }

        New-Package @params | Out-Host
    }
}

function Set-NuspecDependenciesFromProject {
    <#
    .description
        Replaces the dependencies in the .nuspec file with the package references of the generated SDK project, so the
        package declares what the compiled SDK uses. The generator writes the references and their versions into the
        project, so they change with the generator version.
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string] $PackageDefinitionFile,

        [Parameter(Mandatory = $true)]
        [string] $ProjectFile
    )

    if (-not (Test-Path $ProjectFile)) {
        throw "The generated SDK project was not found at '$ProjectFile'."
    }

    [xml] $project = Get-Content $ProjectFile

    $references = @(
        $project.SelectNodes('//PackageReference') |
            Where-Object { $_.GetAttribute('Include') } |
            # References with PrivateAssets="all" (analyzers, build tools) are not dependencies of the package
            Where-Object { $_.GetAttribute('PrivateAssets') -ne 'all' -and $_.PrivateAssets -ne 'all' } |
            ForEach-Object {
                $version = if ($_.GetAttribute('Version')) { $_.GetAttribute('Version') } else { $_.Version }

                if ([string]::IsNullOrWhiteSpace($version)) {
                    throw "The package reference '$($_.GetAttribute('Include'))' in '$ProjectFile' has no version."
                }

                # The generator writes versions with a trailing space (Version="10.0.1 ")
                [PSCustomObject] @{ Id = $_.GetAttribute('Include'); Version = $version.Trim() }
            }
    )

    if ($references.Count -eq 0) {
        throw "No package references were found in '$ProjectFile'."
    }

    [xml] $nuspec = Get-Content $PackageDefinitionFile
    $metadata = $nuspec.package.metadata
    $namespace = $nuspec.package.NamespaceURI

    $existing = $metadata.SelectSingleNode('*[local-name()="dependencies"]')
    if ($null -ne $existing) { $metadata.RemoveChild($existing) | Out-Null }

    $dependencies = $nuspec.CreateElement('dependencies', $namespace)

    foreach ($reference in $references) {
        $dependency = $nuspec.CreateElement('dependency', $namespace)
        $dependency.SetAttribute('id', $reference.Id)
        $dependency.SetAttribute('version', $reference.Version)
        $dependencies.AppendChild($dependency) | Out-Null
    }

    $metadata.AppendChild($dependencies) | Out-Null
    $nuspec.Save($PackageDefinitionFile)

    Write-Host "Package dependencies from $(Split-Path $ProjectFile -Leaf): $(($references | ForEach-Object { "$($_.Id) $($_.Version)" }) -join ', ')"
}

function Invoke-Clean-SdkGen-Output {
    try {
        Remove-Item ("//?/" + (Get-RepositoryResolvedPath "Utilities/SdkGen/EdFi.SdkGen.Console/csharp")) -Recurse -Force
    }
    catch {
        # catching if this call throws, which just means the path does not exist so sdkgen has not been run yet
    }
    
}

Invoke-SdkGen