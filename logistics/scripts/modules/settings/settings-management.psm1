# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\plugin\plugin-source.psm1')

function Get-ProjectTypes {
    return @{
        WebApi                 = 'Application/EdFi.Ods.WebApi'
        IntegrationTestHarness = 'Application/EdFi.Ods.Api.IntegrationTestHarness'
        SandboxAdmin           = 'Application/EdFi.Ods.SandboxAdmin'
        SwaggerUI              = 'Application/EdFi.Ods.SwaggerUI'
        Databases              = 'Scripts/NuGet/EdFi.RestApi.Databases'
    }
}

function Get-DefaultDevelopmentSettingsByProject {
    return @{
        ((Get-ProjectTypes).WebApi)                 = @{
            Urls              = "http://localhost:54746"
            ApiSettings       = @{
                Engine           = ""
                PlainTextSecrets = $true
            }
            ConnectionStrings = @{ }
            Logging           = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        ((Get-ProjectTypes).IntegrationTestHarness) = @{
            Urls              = "http://localhost:8765"
            ApiSettings       = @{
                Engine = ""
            }
            ConnectionStrings = @{ }
        }
        ((Get-ProjectTypes).SandboxAdmin)           = @{
            Urls                         = "http://localhost:38928"
            ApiSettings                  = @{
                Engine = ""
            }
            ConnectionStrings            = @{ }
            Logging                      = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
            OAuthUrl                     = "http://localhost:54746/oauth/"
            DefaultOperationalContextUri = "uri://ed-fi-api-host.org"
            MailSettings                 = @{
                Smtp = @{
                    UserName                 = "Bingo"
                    Password                 = "Tingo"
                    DeliveryMethod           = "SpecifiedPickupDirectory"
                    From                     = "noreply@ed-fi.org"
                    SpecifiedPickupDirectory = @{
                        PickupDirectoryLocation = "C:\Temp\AdminConsole\Artifacts\Emails"
                    }

                }
            }
        }
        ((Get-ProjectTypes).SwaggerUI)              = @{
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
        ((Get-ProjectTypes).SandboxAdmin) = @{
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
        ((Get-ProjectTypes).SwaggerUI)    = @{
            SwaggerUIOptions = @{
                OAuthConfigObject = @{
                    ClientId     = $populatedKey
                    ClientSecret = $populatedSecret
                }
            }
        }
    }
}

function Get-EdFiDeveloperPluginSettings {
    return @{
        Plugin = @{
            Folder  = "../../Plugin"
            Scripts = @("sample", "homograph", "tpdm", "profiles.sample")
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

function Get-DefaultConnectionStringsByEngine {
    return  @{
        SQLServer  = @{
            ConnectionStrings = @{
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Ods])      = "Server=(local); Trusted_Connection=True; Database=EdFi_{0};"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Admin])    = "Server=(local); Trusted_Connection=True; Database=EdFi_Admin;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Security]) = "Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Master])   = "Server=(local); Trusted_Connection=True; Database=master;"
            }
        }
        PostgreSQL = @{
            ConnectionStrings = @{
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Ods])      = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_{0};"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Admin])    = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Admin;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Security]) = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Security;"
                ((Get-ConnectionStringKeyByDatabaseTypes)[(Get-DatabaseTypes).Master])   = "Host=localhost; Port=5432; Username=postgres; Database=postgres;"
            }
        }
    }
}

function Get-DefaultTemplateSettingsByEngine {
    return  @{
        SQLServer  = @{
            ApiSettings = @{
                MinimalTemplateScript   = 'EdFiMinimalTemplate'
                PopulatedTemplateScript = 'GrandBend'
            }
        }
        PostgreSQL = @{
            ApiSettings = @{
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
        publishing                  = 'Publishing'
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

function Format-Json {
    <#
    .SYNOPSIS
        Prettifies JSON output.
    .DESCRIPTION
        Reformats a JSON string so the output looks better than what ConvertTo-Json outputs.
    .PARAMETER Json
        Required: [string] The JSON text to prettify.
    .PARAMETER Minify
        Optional: Returns the json string compressed.
    .PARAMETER Indentation
        Optional: The number of spaces (1..1024) to use for indentation. Defaults to 2.
    .PARAMETER AsArray
        Optional: If set, the output will be in the form of a string array, otherwise a single string is output.
    .EXAMPLE
        $json | ConvertTo-Json  | Format-Json -Indentation 2
    #>
    [CmdletBinding(DefaultParameterSetName = 'Prettify')]
    Param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string] $Json,

        [Parameter(ParameterSetName = 'Minify')]
        [switch] $Minify,

        [Parameter(ParameterSetName = 'Prettify')]
        [ValidateRange(1, 1024)]
        [int] $Indentation = 2,

        [Parameter(ParameterSetName = 'Prettify')]
        [switch] $AsArray
    )

    if ($PSCmdlet.ParameterSetName -eq 'Minify') {
        return ($Json | ConvertFrom-Json) | ConvertTo-Json -Depth 100 -Compress
    }

    # If the input JSON text has been created with ConvertTo-Json -Compress
    # then we first need to reconvert it without compression
    if ($Json -notmatch '\r?\n') {
        $Json = ($Json | ConvertFrom-Json) | ConvertTo-Json -Depth 100
    }

    $indent = 0
    $regexUnlessQuoted = '(?=([^"]*"[^"]*")*[^"]*$)'

    $result = $Json -split '\r?\n' |
        ForEach-Object {
            # If the line contains a ] or } character,
            # we need to decrement the indentation level unless it is inside quotes.
            if ($_ -match "[}\]]$regexUnlessQuoted") {
                $indent = [Math]::Max($indent - $Indentation, 0)
            }

            # Replace all colon-space combinations by ": " unless it is inside quotes.
            $line = (' ' * $indent) + ($_.TrimStart() -replace ":\s+$regexUnlessQuoted", ': ')

            # If the line contains a [ or { character,
            # we need to increment the indentation level unless it is inside quotes.
            if ($_ -match "[\{\[]$regexUnlessQuoted") {
                $indent += $Indentation
            }

            $line
        }

    if ($AsArray) { return $result }
    return $result -Join [Environment]::NewLine
}

function New-JsonFile {
    param(
        [string] $FilePath,

        [hashtable] $Hashtable,

        [switch] $Overwrite
    )

    if (-not $Overwrite -and (Test-Path $FilePath)) { return }

    $Hashtable | ConvertTo-Json -Depth 10 | Format-Json | Out-File -FilePath $FilePath -NoNewline -Encoding UTF8
}

function Get-UserSecrets([string] $Project) {
    if ([string]::IsNullOrWhitespace($Project)) { return @{ } }

    $inputTable = @{ }
    $resultTable = @{ }

    try {
        $projectPath = Get-RepositoryResolvedPath $Project
        $userSecretList = dotnet user-secrets list --project $projectPath --id (Get-UserSecretsIdByProject).$Project | Out-String

        if ($userSecretList -notlike "*No secrets configured for this application*" -and ($null -ne $userSecretList)) {
            $inputTable = ConvertFrom-StringData -StringData $userSecretList
        }

        $resultTable = Get-UnFlatHashtable($inputTable)
    }
    catch {
        Write-Host $_.Exception.Message -ForegroundColor Yellow
    }

    return ($resultTable)
}

function Get-MergedAppSettings([string[]] $SettingsFiles = @() , [string]$Project) {

    $mergedSettings = @{ }

    foreach ($settingsFile in $SettingsFiles) {
        if (-not (Test-Path $settingsFile)) { continue }

        $settings = Get-Content $settingsFile | ConvertFrom-Json | ConvertTo-Hashtable
        $mergedSettings = Merge-Hashtables $mergedSettings, $settings
    }

    $userSecrets = Get-UserSecrets $Project

    $mergedSettings = Merge-Hashtables $mergedSettings, $userSecrets

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

    $pluginFolder = (Get-PluginFolderFromSettings $Settings)
    if (-not [string]::IsNullOrWhitespace($pluginFolder)) {
        $pluginArtifactSource += ((Get-ChildItem -Path $pluginFolder -Filter "*Artifacts*" -Recurse -Directory).Parent).FullName

        if ($null -ne $pluginArtifactSource) { $folders += $pluginArtifactSource }
    }

    return $folders
}

function Add-DeploymentSpecificSettings([hashtable] $Settings = @{ }) {
    $newDeploymentSettings = @{
        ApiSettings = @{
            DatabaseTypes        = Get-DatabaseTypes
            ConnectionStringKeys = Get-ConnectionStringKeyByDatabaseTypes
            Csbs                 = Get-ConnectionStringBuildersFromSettings $Settings
            SubTypes             = Get-FeatureSubTypesFromSettings $Settings
            FilePaths            = Get-DatabaseScriptFoldersFromSettings $Settings
        }
    }

    return (Merge-Hashtables $Settings, $newDeploymentSettings)
}

function Add-WebApiSpecificSettings([hashtable] $Settings = @{ }, [string] $ProjectName) {
    if (($ProjectName -ne ((Get-ProjectTypes).WebApi)) -and ($ProjectName -ne ((Get-ProjectTypes).IntegrationTestHarness))) { return $Settings }

    $newSettings = (Get-DefaultTemplateSettingsByEngine)[$Settings.ApiSettings.Engine]

    $newSettings = (Merge-HashtablesOrDefaults $Settings, $newSettings)

    return $newSettings
}

function Add-TestHarnessSpecificAppSettings([hashtable] $Settings = @{ }, [string] $ProjectName) {
    if ($ProjectName -ne ((Get-ProjectTypes).IntegrationTestHarness)) { return $Settings }

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

function Remove-WebApiSpecificSettings([hashtable] $Settings = @{ }, [string] $ProjectName) {
    if ($ProjectName -eq ((Get-ProjectTypes).WebApi)) { return $Settings }
    if ($null -eq $Settings.ApiSettings.Mode) { return $Settings }

    $newSettings = Get-HashtableDeepClone $settings
    $newSettings.ApiSettings.Remove('Mode')

    return $newSettings
}

function Get-UserSecretsIdByProject {
    return @{
        ((Get-ProjectTypes).SandboxAdmin)           = "f1506d66-289c-44cb-a2e2-80411cc690ea"
        ((Get-ProjectTypes).SwaggerUI)              = "f1506d66-289c-44cb-a2e2-80411cc690eb"
        ((Get-ProjectTypes).WebApi)                 = "f1506d66-289c-44cb-a2e2-80411cc690ec"
        ((Get-ProjectTypes).IntegrationTestHarness) = "f1506d66-289c-44cb-a2e2-80411cc690ed"
    }
}

function New-DevelopmentAppSettings([hashtable] $Settings = @{ }) {
    $newSettingsFiles = @()
    $developmentSettingsByProject = Get-DefaultDevelopmentSettingsByProject

    $credentialSettingsByProject = Get-CredentialSettingsByProject

    foreach ($project in $developmentSettingsByProject.Keys) {
        $newDevelopmentSettings = (Get-DefaultConnectionStringsByEngine)[$Settings.ApiSettings.Engine]
        $newDevelopmentSettings = Add-ApplicationNameToConnectionStrings $newDevelopmentSettings $project
        $newDevelopmentSettings = Merge-Hashtables $developmentSettingsByProject[$project], $newDevelopmentSettings

        $newDevelopmentSettings = Add-TestHarnessSpecificAppSettings $newDevelopmentSettings $project

        $newDevelopmentSettings = Merge-Hashtables $newDevelopmentSettings, $credentialSettingsByProject[$project], $Settings

        $newDevelopmentSettings = Add-WebApiSpecificSettings $newDevelopmentSettings $project
        $newDevelopmentSettings = Remove-WebApiSpecificSettings $newDevelopmentSettings $project

        $projectPath = Get-RepositoryResolvedPath $Project

        $newDevelopmentSettingsPath = Join-Path $projectPath "appsettings.development.json"
        New-JsonFile $newDevelopmentSettingsPath $newDevelopmentSettings -Overwrite
        $newSettingsFiles += $newDevelopmentSettingsPath
    }

    return $newSettingsFiles
}

function Set-Feature([hashtable] $Settings = { }, [string] $FeatureName, [bool] $IsEnabled) {
    $features = $Settings.ApiSettings.Features | Where-Object { $_.Name -eq $featureName }

    if ($features.Length -eq 0) {
        $properties = @{ Name = $FeatureName; IsEnabled = $IsEnabled }

        if ($Settings.ApiSettings.Features.Length -eq 0) {
            $Settings.ApiSettings.Features = @()
        }

        $Settings.ApiSettings.Features += New-Object psobject -Property $properties
    }
    else {
        foreach ($feature in $Settings.ApiSettings.Features) {
            if ($feature.Name -eq $FeatureName) {
                $feature.IsEnabled = $IsEnabled
            }
        }
    }

    return $Settings
}
