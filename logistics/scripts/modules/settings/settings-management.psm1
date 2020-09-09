# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')

function Get-DevelopmentSettingsByProject {
    return @{
        "EdFi.Ods.WebApi.NetCore"             = @{
            Urls              = "http://localhost:54746"
            ApiSettings       = @{
                Engine = ""
            }
            ConnectionStrings = @{ }
            Plugin            = @{
                Scripts = @("development")
            }
            Logging           = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
            Deployment        = @{

            }
        }
        "EdFi.Ods.Api.IntegrationTestHarness" = @{
            ApiSettings       = @{
                Engine = ""
            }
            ConnectionStrings = @{ }
        }
        "EdFi.Ods.SandboxAdmin.Web"           = @{
            Urls              = "http://localhost:38928"
            Engine            = ""
            ConnectionStrings = @{ }
            Logging           = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        "EdFi.Ods.SwaggerUI"                  = @{
            Urls             = "http://localhost:56641"
            WebApiVersionUrl = "http://localhost:54746"
            Logging          = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        "EdFi.RestApi.Databases"              = @{
            ApiSettings       = @{
                Engine = ""
            }
            ConnectionStrings = @{ }
        }
    }
}

function Get-CredentialSettingsByProject {

    function Get-RandomString([int] $length = 20) {
        return ([char[]]([char]65..[char]90) + ([char[]]([char]97..[char]122)) + 0..9 | Sort-Object { Get-Random })[0..$length] -join ''
    }

    $populatedKey = Get-RandomString
    $populatedSecret = Get-RandomString

    return @{
        "EdFi.Ods.SandboxAdmin.Web" = @{
            User = @{
                Name              = "Test Admin"
                Email             = "test@ed-fi.org"
                Password          = Get-RandomString
                Admin             = "true"
                NamespacePrefixes = @(
                    "uri://ed-fi.org"
                    "uri://gbisd.org"
                )
                Sandboxes         = @{
                    "Populated Demonstration Sandbox" = @{
                        Key     = $populatedKey
                        Secret  = $populatedSecret
                        Type    = "Sample"
                        Refresh = "true"
                    }
                    "Minimal Demonstration Sandbox"   = @{
                        Key     = Get-RandomString
                        Secret  = Get-RandomString
                        Type    = "Minimal"
                        Refresh = "true"
                    }
                }
            }
        }
        "EdFi.Ods.SwaggerUI"        = @{
            SwaggerUIOptions = @{
                OAuthConfigObject = @{
                    ClientId     = $populatedKey
                    ClientSecret = $populatedSecret
                }
            }
        }
    }
}

function Get-ConnectionStringKeyByDatabaseTypes {
    return @{
        Ods      = 'EdFi_Ods'
        Admin    = 'EdFi_Admin'
        Security = 'EdFi_Security'
        Master   = 'EdFi_Master'
    }
}

function Get-ConnectionStringsByEngine {
    return  @{
        SQLServer  = @{
            ConnectionStrings = @{
                ((Get-ConnectionStringKeyByDatabaseTypes)['Ods'])      = "Server=(local); Trusted_Connection=True; Database=EdFi_{0};"
                ((Get-ConnectionStringKeyByDatabaseTypes)['Admin'])    = "Server=(local); Trusted_Connection=True; Database=EdFi_Admin;"
                ((Get-ConnectionStringKeyByDatabaseTypes)['Security']) = "Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True;"
                ((Get-ConnectionStringKeyByDatabaseTypes)['Master'])   = "Server=(local); Trusted_Connection=True; Database=master;"
            }
            DatabaseTemplate  = @{
                MinimalTemplateScript   = 'EdFiMinimalTemplate'
                PopulatedTemplateScript = 'GrandBend'
            }
        }
        PostgreSQL = @{
            ConnectionStrings = @{
                ((Get-ConnectionStringKeyByDatabaseTypes)['Ods'])      = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_{0};"
                ((Get-ConnectionStringKeyByDatabaseTypes)['Admin'])    = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Admin;"
                ((Get-ConnectionStringKeyByDatabaseTypes)['Security']) = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Security;"
            }
            DatabaseTemplate  = @{
                MinimalTemplateScript   = 'PostgreSQLMinimalTemplate'
                PopulatedTemplateScript = 'PostgreSQLPopulatedTemplate'
            }
        }
    }
}

function Get-SubtypesByFeature {
    return @{
        changeQueries               = 'changes'
        ownershipBasedAuthorization = 'RecordOwnership'
    }
}

function Test-AppSettings {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Path
    )

    if (-not (Test-Path $Path)) { return $false }

    try {
        Get-Content $Path | ConvertFrom-Json | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

function Assert-ValidAppSettings([string[]] $SettingsFiles = (Get-ChildItem "$(Get-RepositoryRoot 'Ed-Fi-ODS-Implementation')\**\appsettings*.json" -Recurse)) {
    $result = @()

    foreach ($file in $SettingsFiles) {
        if (Test-AppSettings $file) {
            $result += @{ file = $file; success = $true }
        }
        else {
            try {
                Get-Content $file | ConvertFrom-Json
            }
            catch {
                $result += @{ file = $file; success = $false; exception = $_ }
            }
        }
    }

    return $result
}

function Add-ApplicationNameToConnectionStrings([hashtable] $ConnectionStrings = @{ }, [string] $ApplicationName) {
    $newConnectionStrings = Merge-Hashtables @{ }, $ConnectionStrings

    foreach ($key in $ConnectionStrings.ConnectionStrings.Keys) {
        if (-not ($ConnectionStrings.ConnectionStrings[$key] -like '*Application Name*')) {
            $newConnectionStrings.ConnectionStrings[$key] += " Application Name=$ApplicationName;"
        }
    }

    return $newConnectionStrings
}

function Get-ProjectPath {
    param(
        [string] $Project
    )

    if (-not $Project) { return }

    $path = Find-RepositoryResolvedPath "Application/$Project"

    if (-not $path) { $path = Find-RepositoryResolvedPath "Scripts/NuGet/$Project" }

    return $path
}

function New-JsonFile {
    param(
        [string] $FilePath,

        [hashtable] $Hashtable,

        [switch] $Overwrite
    )

    if (-not $Overwrite -and (Test-Path $FilePath)) { return }

    $Hashtable | ConvertTo-Json -Depth 10 | Out-File -FilePath $FilePath -NoNewline -Encoding UTF8
}

function Get-MergedAppSettings([string[]] $SettingsFiles = @()) {

    $mergedSettings = @{ }

    foreach ($settingsFile in $SettingsFiles) {
        if (-not (Test-Path $settingsFile)) { continue }

        $settings = Get-Content $settingsFile | ConvertFrom-Json | ConvertTo-Hashtable
        $mergedSettings = Merge-Hashtables $mergedSettings, $settings
    }

    return $mergedSettings
}


function Get-ConnectionStringsFromSettings([hashtable] $Settings = @{ }) {
    $connectionStrings = @{ }

    foreach ($key in $Settings.ConnectionStrings.Keys) {
        $csb = New-Object System.Data.Common.DbConnectionStringBuilder
        # using set_ConnectionString correctly uses the underlying C# setter functionality
        # resulting in a dictionary of connection string properties instead of a string
        $csb.set_ConnectionString($Settings.ConnectionStrings[$key])
        $connectionStrings[$key] = $csb
    }

    return $connectionStrings
}

function Get-EnabledFeaturesFromSettings([hashtable] $Settings = @{ }) {
    return ($Settings.ApiSettings.Features | Where-Object { $_.IsEnabled -eq $true })
}

function Get-FeatureSubTypesFromSettings([hashtable] $Settings = @{ }) {
    $enabledFeatureSubTypes = @()

    foreach ($feature in (Get-SubtypesByFeature).Keys) {
        $enabledFeatureSubTypes += ((Get-EnabledFeaturesFromSettings $Settings) | Where-Object { $_.Name -eq $feature })
    }

    $enabledSubTypes = $enabledFeatureSubTypes | ForEach-Object { (Get-SubtypesByFeature)[$_.Name] }

    return $enabledSubTypes
}

function Get-DatabaseScriptFoldersFromSettings([hashtable] $Settings = @{ }) {
    if ((Get-EnabledFeaturesFromSettings $Settings) -contains "Extensions") {
        $excludedExtensionSources = $Settings.ApiSettings.ExcludedExtensionSources
        $artifactSources = Select-SupportingArtifactResolvedSources |
            Select-ExtensionArtifactResolvedName -exclude $excludedExtensionSources
    }

    $folders = @()

    $folders = Get-RepositoryArtifactPaths

    $folders += Get-ExtensionScriptFiles $artifactSources

    return $folders
}

function Add-DeploymentSpecificSettings([hashtable] $Settings = @{ }) {
    $newDeploymentSettings = @{
        DeploymentSettings = @{
            databaseIds = Get-ConnectionStringKeyByDatabaseTypes
            csbs        = Get-ConnectionStringsFromSettings $Settings
            SubTypes    = Get-FeatureSubTypesFromSettings $Settings
            FilePaths   = Get-DatabaseScriptFoldersFromSettings $Settings
        }
    }

    return (Merge-Hashtables $Settings, $newDeploymentSettings)
}


function New-DevelopmentAppSettings([hashtable] $Settings = @{ }) {
    $newSettingsFiles = @()
    $developmentSettingsByProject = Get-DevelopmentSettingsByProject

    foreach ($project in $developmentSettingsByProject.Keys) {
        $connectionStringsForEngine = (Get-ConnectionStringsByEngine)[$Settings.ApiSettings.Engine]
        $connectionStringsForEngine = Add-ApplicationNameToConnectionStrings $connectionStringsForEngine $project

        $newDevelopmentSettings = Merge-HashTables $developmentSettingsByProject[$project], $connectionStringsForEngine, $Settings

        $projectPath = Get-ProjectPath $project

        $newDevelopmentSettingsPath = Join-Path $projectPath "appsettings.development.json"
        New-JsonFile $newDevelopmentSettingsPath $newDevelopmentSettings -Overwrite
        $newSettingsFiles += $newDevelopmentSettingsPath

        $credentialSettings = Merge-Hashtables @{ }, (Get-CredentialSettingsByProject)[$project]
        $newUserSettingsPath = Join-Path $projectPath "appsettings.user.json"
        New-JsonFile $newUserSettingsPath $credentialSettings
        $newSettingsFiles += $newUserSettingsPath
    }

    return $newSettingsFiles
}
