# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')

function Get-DefaultDevelopmentSettingsByProject {
    return @{
        "Application/EdFi.Ods.WebApi.NetCore"             = @{
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
        }
        "Application/EdFi.Ods.Api.IntegrationTestHarness" = @{
            Urls              = "http://localhost:8765"
            ApiSettings       = @{
                Engine = ""
            }
            ConnectionStrings = @{ }
        }
        "Application/EdFi.Ods.SandboxAdmin"               = @{
            Urls              = "http://localhost:38928"
            ApiSettings       = @{
                Engine = ""
            }
            ConnectionStrings = @{ }
            Logging           = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        "Application/EdFi.Ods.SwaggerUI"                  = @{
            Urls             = "http://localhost:56641"
            WebApiVersionUrl = "http://localhost:54746"
            Logging          = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
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
        "Application/EdFi.Ods.SandboxAdmin"               = @{
            User = @{
                "Test Admin" = @{
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
                            Refresh = "false"
                        }
                        "Minimal Demonstration Sandbox"   = @{
                            Key     = Get-RandomString
                            Secret  = Get-RandomString
                            Type    = "Minimal"
                            Refresh = "false"
                        }
                    }
                }
            }
        }
        "Application/EdFi.Ods.SwaggerUI"        = @{
            SwaggerUIOptions = @{
                OAuthConfigObject = @{
                    ClientId     = $populatedKey
                    ClientSecret = $populatedSecret
                }
            }
        }
    }
}

function Get-DatabaseTypes {
    return @{
        Ods      = 'Ods'
        Admin    = 'Admin'
        Security = 'Security'
        Master   = 'Master'
    }
}

function Get-ConnectionStringKeyByDatabaseTypes {
    return @{
        (Get-DatabaseTypes).Ods      = 'EdFi_Ods'
        (Get-DatabaseTypes).Admin    = 'EdFi_Admin'
        (Get-DatabaseTypes).Security = 'EdFi_Security'
        (Get-DatabaseTypes).Master   = 'EdFi_Master'
    }
}

function Get-DefaultDevelopmentSettingsByEngine {
    return  @{
        SQLServer  = @{
            ConnectionStrings = @{
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Ods])      = "Server=(local); Trusted_Connection=True; Database=EdFi_{0};"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Admin])    = "Server=(local); Trusted_Connection=True; Database=EdFi_Admin;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Security]) = "Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Master])   = "Server=(local); Trusted_Connection=True; Database=master;"
            }
            DatabaseTemplate  = @{
                MinimalTemplateScript   = 'EdFiMinimalTemplate'
                PopulatedTemplateScript = 'GrandBend'
            }
        }
        PostgreSQL = @{
            ConnectionStrings = @{
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Ods])      = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_{0};"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Admin])    = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Admin;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Security]) = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Security;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Master])   = "Host=localhost; Port=5432; Username=postgres; Database=postgres;"
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

function Assert-ValidAppSettings([string[]] $SettingsFiles = (Get-ChildItem "$(Get-RepositoryRoot 'Ed-Fi-ODS-Implementation')\**\appsettings*.json" -Recurse)) {
    $result = @()

    foreach ($file in $SettingsFiles) {
        try {
            Get-Content $file -ErrorAction Stop | ConvertFrom-Json | Out-Null
            $result += @{ file = $file; success = $true }
        }
        catch {
            $result += @{ file = $file; success = $false; exception = $_ }
        }
    }

    return $result
}

function Add-ApplicationNameToConnectionStrings([hashtable] $Settings = @{ }, [string] $ApplicationName) {
    $csbs = Get-ConnectionStringBuildersFromSettings $Settings
    $newConnectionStrings = @{ }

    foreach ($key in $csbs.Keys) {
        if (-not [string]::IsNullOrEmpty($csbs[$key]['Application Name'])) { continue }
        $csbs[$key]['Application Name'] = (Split-Path -Leaf $ApplicationName).ToString()
        $newConnectionStrings[$key] = $csbs[$key].ToString()
    }

    $newSettings = Merge-Hashtables $Settings, @{ ConnectionStrings = $newConnectionStrings }

    return $newSettings
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


function Get-ConnectionStringBuildersFromSettings([hashtable] $Settings = @{ }) {
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
    return ($Settings.ApiSettings.Features | Where-Object { $_.IsEnabled -eq $true } | ForEach-Object { $_.Name })
}

function Get-FeatureSubTypesFromSettings([hashtable] $Settings = @{ }) {
    $enabledFeatureSubTypes = @()

    $enabledFeatures = (Get-EnabledFeaturesFromSettings $Settings)
    foreach ($feature in (Get-SubtypesByFeature).Keys) {
        $enabledFeatureSubTypes += ($enabledFeatures | Where-Object { $_ -eq $feature })
    }

    $enabledSubTypes = $enabledFeatureSubTypes | ForEach-Object { (Get-SubtypesByFeature)[$_] }

    return $enabledSubTypes
}

function Get-DatabaseScriptFoldersFromSettings([hashtable] $Settings = @{ }) {
    if ((Get-EnabledFeaturesFromSettings $Settings) -contains "Extensions") {
        $excludedExtensions = $Settings.ApiSettings.ExcludedExtensions
        $artifactSources = Select-SupportingArtifactResolvedSources |
            Select-ExtensionArtifactResolvedName -exclude $excludedExtensions
    }

    $folders = @()

    $folders = Get-RepositoryArtifactPaths

    $folders += Get-ExtensionScriptFiles $artifactSources

    return $folders
}

function Add-DeploymentSpecificSettings([hashtable] $Settings = @{ }) {
    $newDeploymentSettings = @{
        DeploymentSettings = @{
            DatabaseTypes        = Get-DatabaseTypes
            ConnectionStringKeys = Get-ConnectionStringKeyByDatabaseTypes
            Csbs                 = Get-ConnectionStringBuildersFromSettings $Settings
            SubTypes             = Get-FeatureSubTypesFromSettings $Settings
            FilePaths            = Get-DatabaseScriptFoldersFromSettings $Settings
        }
    }

    return (Merge-Hashtables $Settings, $newDeploymentSettings)
}

function Add-TestHarnessSpecificAppSettings([hashtable] $Settings = @{ }, [string] $ProjectName) {
    if ($ProjectName -ne 'Application/EdFi.Ods.Api.IntegrationTestHarness') { return $Settings }

    $databaseName = @{
        ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Ods])      = "EdFi_Ods_Populated_Template_Test"
        ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Admin])    = "EdFi_Admin_Test"
        ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Security]) = "EdFi_Security_Test"
    }

    $newSettings = @{
        ConnectionStrings = @{ }
        ApiSettings       = @{
            Mode = "SharedInstance"
        }
    }

    $csbs = Get-ConnectionStringBuildersFromSettings $Settings
    foreach ($key in $databaseName.Keys) {
        $csbs[$key].database = $databaseName[$key]
        $newSettings.ConnectionStrings[$key] = $csbs[$key].ToString()
    }
    $newSettings = (Merge-Hashtables $Settings, $newSettings)

    return $newSettings
}

function New-DevelopmentAppSettings([hashtable] $Settings = @{ }) {
    $newSettingsFiles = @()
    $developmentSettingsByProject = Get-DefaultDevelopmentSettingsByProject


    foreach ($project in $developmentSettingsByProject.Keys) {
        $developmentSettingsForEngine = (Get-DefaultDevelopmentSettingsByEngine)[$Settings.ApiSettings.Engine]
        $developmentSettingsForEngine = Add-ApplicationNameToConnectionStrings $developmentSettingsForEngine $project

        $newDevelopmentSettings = Merge-Hashtables $developmentSettingsByProject[$project], $developmentSettingsForEngine, $Settings

        $newDevelopmentSettings = Add-TestHarnessSpecificAppSettings $newDevelopmentSettings $project

        $projectPath = Get-RepositoryResolvedPath $Project

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
