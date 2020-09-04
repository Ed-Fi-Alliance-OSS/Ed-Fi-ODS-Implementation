# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')

function Get-DevelopmentSettingsByProject {
    return @{
        "EdFi.Ods.WebApi.NetCore"             = @{
            Urls              = "http://localhost:54746"
            Engine            = ""
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
        "EdFi.Ods.Api.IntegrationTestHarness" = @{

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
            Engine            = ""
            ConnectionStrings = @{ }
        }
    }
}

function Get-ConnectionStringsByEngine {
    return  @{
        SQLServer  = @{
            ConnectionStrings = @{
                EdFi_Ods      = "Server=(local); Trusted_Connection=True; Database=EdFi_{0};"
                EdFi_Admin    = "Server=(local); Trusted_Connection=True; Database=EdFi_Admin;"
                EdFi_Security = "Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True;"
                EdFi_Master   = "Server=(local); Trusted_Connection=True; Database=master;"
            }
        }
        PostgreSQL = @{
            ConnectionStrings = @{
                EdFi_Ods      = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_{0};"
                EdFi_Admin    = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Admin;"
                EdFi_Security = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Security;"
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

function Get-MergedSettings {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [string] $Engine,

        [string] $Project,

        [hashtable] $Settings = @{ }
    )

    $projectPath = Get-ProjectPath $Project

    if (-not (Test-Path $projectPath)) { return $Settings }

    $appSettingsFileNames = "appsettings.json", "appsettings.development.json", "appsettings.user.json"

    $mergedSettings = @{ }

    foreach ($settingsFileName in $appSettingsFileNames) {
        $settingsPath = Join-Path $projectPath $settingsFileName

        if (-not (Test-Path $settingsPath)) { continue }

        $settings = Get-Content $settingsPath | ConvertFrom-Json | ConvertTo-Hashtable
        $mergedSettings = Merge-Hashtables $mergedSettings, $settings
    }

    return $mergedSettings
}

function Add-EngineSpecificSettings {
    param(
        [string] $Engine,

        [hashtable] $Settings = @{ }
    )

    $newSettings = @{ }

    foreach ($project in $Settings.Keys) {

        $connectionStringsForEngine = (Get-ConnectionStringsByEngine)[$Engine]
        $newConnectionStrings = Get-HashtableDeepClone $connectionStringsForEngine

        foreach ($key in $connectionStringsForEngine.ConnectionStrings.Keys) {
            if (-not ($connectionStringsForEngine.ConnectionStrings[$key] -like '*Application Name*')) {
                $newConnectionStrings.ConnectionStrings[$key] += " Application Name=$project;"
            }
        }

        $newSettings[$project] = Merge-Hashtables $Settings[$project], $newConnectionStrings

        if ($newSettings[$project].ContainsKey("Engine")) { $newSettings[$project].Engine = $Engine }
    }

    return $newSettings
}

function New-DevelopmentSettings {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [string] $Engine = 'SQLServer',

        [hashtable] $Settings = @{ }
    )

    $newDevelopmentSettings = (Add-EngineSpecificSettings $Engine (Get-DevelopmentSettingsByProject))

    $newDevelopmentSettings = Merge-Hashtables $newDevelopmentSettings, $Settings

    return $newDevelopmentSettings
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

        [switch] $Force
    )

    if (-not $force -and (Test-Path $FilePath)) { return }
    $Hashtable | ConvertTo-Json -Depth 10 | Out-File -FilePath $FilePath -NoNewline -Encoding UTF8 -Force:$Force
}

function New-DevelopmentAppSettings {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [string] $Engine = 'SQLServer',

        [hashtable] $Settings = @{ }
    )

    $newSettingsFiles = @()

    $newDevelopmentSettings = New-DevelopmentSettings $Engine $Settings

    foreach ($project in $newDevelopmentSettings.Keys) {
        $projectPath = Get-ProjectPath $project

        $newDevelopmentSettingsPath = Join-Path $projectPath "appsettings.development.json"
        New-JsonFile $newDevelopmentSettingsPath $newDevelopmentSettings[$project] -Force
        $newSettingsFiles += $newDevelopmentSettingsPath

        $credentialSettings = Merge-Hashtables @{ }, (Get-CredentialSettingsByProject)[$project]
        $newUserSettingsPath = Join-Path $projectPath "appsettings.user.json"
        New-JsonFile $newUserSettingsPath $credentialSettings
        $newSettingsFiles += $newUserSettingsPath
    }

    $newSettingsFiles | Test-AppSettings
    return $newSettingsFiles
}
