# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5
$ErrorActionPreference = "Stop"

<#
To run manually from source code, instead of from an expanded NuGet package,
run the prep-installer-package.ps1 script first. Think of it as a "restore-packages"
step before compiling in C#.
#>

Import-Module -Force -Scope Global $PSScriptRoot/AppCommon/Utility/hashtable.psm1
Import-Module -Force -Scope Global $PSScriptRoot/AppCommon/Utility/nuget-helper.psm1
Import-Module -Force -Scope Global $PSScriptRoot/AppCommon/Utility/TaskHelper.psm1

Import-Module -Force -Scope Global $PSScriptRoot/AppCommon/Application/Install.psm1
Import-Module -Force -Scope Global $PSScriptRoot/AppCommon/Application/Uninstall.psm1
Import-Module -Force -Scope Global $PSScriptRoot/AppCommon/Application/Configuration.psm1


function Install-EdFiOdsSandboxAdmin {
    <#
    .SYNOPSIS
        Installs the Ed-Fi ODS Sandbox Admin application into IIS.

    .DESCRIPTION
        Installs and configures the Ed-Fi ODS Sandbox Admin application in IIS
        running in Windows 10 or Windows Server 2016+. As needed, will create
        a new "Ed-Fi" website in IIS, configure it for HTTPS, and load the
        SandboxAdmin binaries as an an application.

    .EXAMPLE
        PS c:/> Install-EdFiOdsSandboxAdmin

        Using all available default settings.

    .EXAMPLE
        PS c:/> Install-EdFiOdsSandboxAdmin -Engine PostgreSQL

        Using default connection strings for PostgreSQL

    .EXAMPLE
        PS c:/> $parameters = @{
            PackageVersion     = '5.2.0'
            WebSitePath        = 'c:\inetpub\Ed-Fi'
            WebSitePort        = 8765
            WebApplicationPath = 'SandboxAdmin'
            WebApplicationName = 'SandboxAdmin5.2.0'
            UseAlternateUserName       = $false
            Settings           = @{
                ConnectionStrings            = @{
                    EdFi_Ods      = 'Server=(local); Trusted_Connection=True; Database=EdFi_{0}; Application Name=EdFi.Ods.SandboxAdmin'
                    EdFi_Admin    = 'Server=(local); Trusted_Connection=True; Database=EdFi_Admin; Application Name=EdFi.Ods.SandboxAdmin'
                    EdFi_Security = 'Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True; Application Name=EdFi.Ods.SandboxAdmin'
                    EdFi_Master   = 'Server=(local); Trusted_Connection=True; Database=master; Application Name=EdFi.Ods.SandboxAdmin'
                }
                OAuthUrl                     = 'https://localhost/EdFiOdsWebApi'
                DefaultApplicationName       = 'My Sandbox Administrator'
                DefaultOperationalContextUri = 'uri://sample.edu'
                PreserveLoginUrl             = $false
                User                         = @{
                    'Test Admin' = @{
                        Email             = 'test@ed-fi.org'
                        Password          = '***REMOVED***'
                        Admin             = $true
                        NamespacePrefixes = @('uri://ed-fi.org', 'uri://gbisd.edu')
                        Sandboxes         = @{
                            'Populated Demonstration Sandbox' = @{
                                Key     = 'populatedSandbox'
                                Secret  = 'populatedSandboxSecret'
                                Type    = 'Sample'
                                Refresh = $false
                            }
                            'Minimal Demonstration Sandbox'   = @{
                                Key     = 'minimalSandbox'
                                Secret  = 'minimalSandboxSecret'
                                Type    = 'Minimal'
                                Refresh = $false
                            }
                        }
                    }
                }
            }
        }
        PS c:/> Install-EdFiOdsSandboxAdmin @parameters

        Detailed example setting many customizations.
    #>

    param (
        # NuGet package name. Default: EdFi.Suite3.Ods.SandboxAdmin.Web.
        [string]
        $PackageName = "EdFi.Suite3.Ods.SandboxAdmin",

        # NuGet package version. If not set, will retrieve the latest full release package.
        [string]
        $PackageVersion,

        # NuGet package source. default value is set for release package source for installer .
        [string]
        $PackageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi%40Release/nuget/v3/index.json",

        # Path for storing installation tools, e.g. nuget.exe. Default: "./tools".
        [string]
        $ToolsPath = "$PSScriptRoot/tools",

        # Path for storing downloaded packages. Default: "./downloads".
        [string]
        $DownloadPath = "$PSScriptRoot/downloads",

        # Path for the IIS WebSite. Default: c:\inetpub\Ed-Fi.
        [string]
        $WebSitePath = "c:\inetpub\Ed-Fi", # NB: _must_ use backslash with IIS settings

        # Web site name. Default: "Ed-Fi".
        $WebsiteName = "Ed-Fi",

        # Web site port number. Default: 443.
        [int]
        $WebSitePort = 443,

        # Path for the web application. Default: "SandboxAdmin".
        [string]
        $WebApplicationPath = "SandboxAdmin", # NB: _must_ use backslash with IIS settings

        # Web application name. Default: "SandboxAdmin".
        [string]
        $WebApplicationName = "SandboxAdmin",

        # Optional database engine, either "SQLServer" or "PostgreSQL".
        [string]
        [ValidateSet('SQLServer', 'PostgreSQL')]
        $Engine,

        # Optional hashtable containing appSettings override values.
        [hashtable]
        $Settings = @{ OAuthUrl = "https://localhost/EdFiOdsWebApi" },
        
        # Prompts user to enter an alternate username to be used for SQL Login
        # To use for SQL Server:
        #    UseIntegratedSecurity must be set to true
        #    The username provided must be a valid Windows user
        #    The application pool identity used by the Sandbox Admin app needs to be updated to use the same Windows username 
        # To user for Postgres:
        #    UsedIntegratedSecurity must be set to true or no provide password
        #    The username provided must be mapped to use passwordless authentication
        [switch]
        $UseAlternateUserName, 
        
        # Initial client key to load into the appSettings.config file. Default: Random string value.
        [string]
        $PrePopulatedKey,
        
        # Initial client secret to load into the appSettings.config file. Default: Random string value.
        [string]
        $PrePopulatedSecret,
        
        # Set Encrypt=false for all connection strings
        # Not recomended for production environment.
        [switch]
        $UnEncryptedConnection
    )

    Write-InvocationInfo $MyInvocation

    Clear-Error

    $result = @()

    $config = @{
        WebApplicationPath = (Join-Path $WebSitePath $WebApplicationPath)
        PackageName        = $PackageName
        PackageVersion     = $PackageVersion
        PackageSource      = $PackageSource
        ToolsPath          = $ToolsPath
        DownloadPath       = $DownloadPath
        WebSitePath        = $WebSitePath
        WebSiteName        = $WebSiteName
        WebSitePort        = $WebSitePort
        WebApplicationName = $WebApplicationName
        Engine             = $Engine
        Settings           = $Settings
        UseAlternateUserName       = $UseAlternateUserName 
        PrePopulatedKey = $PrePopulatedKey
        PrePopulatedSecret = $PrePopulatedSecret
        UnEncryptedConnection = $UnEncryptedConnection
    }

    $elapsed = Use-StopWatch {
        $result += Get-SandboxAdminPackage $config
        $result += Set-AppSettings $config
        $result += Install-Application $config
        $result += New-SqlLogins $config
        $result
    }

    Test-Error

    if (-not $NoDuration) {
        $result += New-TaskResult -name "-" -duration "-"
        $result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
        $result | Format-Table
    }
}

function Get-SandboxAdminPackage {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory = $true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $parameters = @{
            PackageName     = $Config.PackageName
            PackageVersion  = $Config.PackageVersion
            OutputDirectory = $Config.DownloadPath
            PackageSource   = $Config.PackageSource
        }
        $Config.PackageDirectory = Get-NuGetPackage @parameters

        Write-Host $Config.PackageDirectory -ForegroundColor Green
    }
}

function Get-DefaultConnectionStringsByEngine {
    return  @{
        SQLServer  = @{
            ConnectionStrings = @{
                EdFi_Ods      = "Server=(local); Trusted_Connection=True; Database=EdFi_{0}; Application Name=EdFi.Ods.SandboxAdmin"
                EdFi_Admin    = "Server=(local); Trusted_Connection=True; Database=EdFi_Admin; Application Name=EdFi.Ods.SandboxAdmin"
                EdFi_Security = "Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True; Application Name=EdFi.Ods.SandboxAdmin"
                EdFi_Master   = "Server=(local); Trusted_Connection=True; Database=master; Application Name=EdFi.Ods.SandboxAdmin"
            }
        }
        PostgreSQL = @{
            ConnectionStrings = @{
                EdFi_Ods      = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_{0}; Pooling=true; Minimum Pool Size=10; Maximum Pool Size=50; Application Name=EdFi.Ods.SandboxAdmin"
                EdFi_Admin    = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Admin; Pooling=true; Minimum Pool Size=10; Maximum Pool Size=50; Application Name=EdFi.Ods.SandboxAdmin"
                EdFi_Security = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Security; Pooling=true; Minimum Pool Size=10; Maximum Pool Size=50; Application Name=EdFi.Ods.SandboxAdmin"
                EdFi_Master   = "Host=localhost; Port=5432; Username=postgres; Database=postgres; Pooling=false; Application Name=EdFi.Ods.SandboxAdmin"
            }
        }
    }
}

function Get-DefaultCredentialSettings {
    param(
        [string] $PrePopulatedKey,

        [string] $PrePopulatedSecret
    )
    
    function Get-RandomString([int] $length = 20) {
        return ([char[]]([char]65..[char]90) + ([char[]]([char]97..[char]122)) + 0..9 | Sort-Object { Get-Random })[0..$length] -join ''
    }

    return @{
        User = @{
            "Test Admin" = @{
                Email             = "test@ed-fi.org"
                Password          = Get-RandomString
                Admin             = "true"
                NamespacePrefixes = @(
                    "uri://ed-fi.org"
                    "uri://gbisd.edu"
                    "uri://tpdm.ed-fi.org"
                )
                Sandboxes         = @{
                    "Populated Demonstration Sandbox" = @{
                        Key     = if ($PrePopulatedKey.Length -ne 0) {$PrePopulatedKey} else {Get-RandomString}
                        Secret  = if ($PrePopulatedSecret.Length -ne 0) {$PrePopulatedSecret} else {Get-RandomString}
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

function Set-AppSettings {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory = $true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $settingsPath = (Join-Path $Config.PackageDirectory 'appsettings.json')
        $settings = Get-Content $settingsPath | ConvertFrom-Json | ConvertTo-Hashtable

        if (-not [string]::IsNullOrEmpty($Config.Engine)) {
            $engine = @{ ApiSettings = @{ Engine = $Config.Engine } }
            $settings = Merge-Hashtables $settings, (Get-DefaultConnectionStringsByEngine)[$Config.Engine], $engine
            New-JsonFile $settingsPath $settings -Overwrite

        }

        if ($Config.UnEncryptedConnection) {
            $connectionStrings = $settings.ConnectionStrings.Clone()
            foreach ($connectionStringKey in $connectionStrings.Keys) {
                $settings.ConnectionStrings[$connectionStringKey] += ";Encrypt=false"
            }
        }

        $settings = Merge-Hashtables $settings, (Get-DefaultCredentialSettings -PrepopulatedKey: $Config.PrepopulatedKey -PrepopulatedSecret: $Config.PrepopulatedSecret), $Config.Settings
        New-JsonFile $settingsPath $settings -Overwrite

        $Config.MergedSettings = $settings

        Write-Host "Using settings file at:"
        Write-Host $settingsPath -ForegroundColor Green
        Write-FlatHashtable $settings
    }
}

function Install-Application {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory = $true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $params = @{
            SourceLocation     = $Config.PackageDirectory
            WebApplicationPath = $Config.WebApplicationPath
            WebApplicationName = $Config.WebApplicationName
            WebSitePath        = $Config.WebSitePath
            WebSitePort        = $Config.WebSitePort
            WebSiteName        = $Config.WebSiteName
        }
        Install-EdFiApplicationIntoIIS @params
    }
}

function Convert-ConnectionStringtoDatabaseConnectionInfo {
    [CmdletBinding()]
    param (
        [string]
        [Parameter(Mandatory = $true)]
        $ConnectionString
    )

    $csb = New-Object System.Data.Common.DbConnectionStringBuilder
    # using set_ConnectionString correctly uses the underlying C# setter functionality resulting in a dictionary of connection string properties
    $csb.set_ConnectionString($ConnectionString)

    $useIntegratedSecurity = $false;
    if($ConnectionString.Replace(" ","").ToLower().Contains("integratedsecurity=true")) {
        $useIntegratedSecurity = $true
    }
    
    if($ConnectionString.Replace(" ","").ToLower().Contains("trusted_connection=true")) {
        $useIntegratedSecurity = $true
    }
    
    $dbConnectionInfo = @{
        UseIntegratedSecurity = $useIntegratedSecurity
        Engine                = $Config.MergedSettings.ApiSettings.Engine
    }
    if ($null -ne $csb.Server) { $dbConnectionInfo.Server = $csb.Server }
    if ($null -ne $csb.Host) { $dbConnectionInfo.Server = $csb.Host }

    return $dbConnectionInfo
}

function New-SqlLogins {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory = $true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $adminDbConnectionInfo = (Convert-ConnectionStringtoDatabaseConnectionInfo $Config.MergedSettings.ConnectionStrings.EdFi_Ods)
        $odsDbConnectionInfo = (Convert-ConnectionStringtoDatabaseConnectionInfo $Config.MergedSettings.ConnectionStrings.EdFi_Admin)
        $securityDbConnectionInfo = (Convert-ConnectionStringtoDatabaseConnectionInfo $Config.MergedSettings.ConnectionStrings.EdFi_Security)

        if ($Config.UseAlternateUserName ) { Write-Host ""; Write-Host "Regarding the Admin DB:"; }
        
        Add-SqlLogins $adminDbConnectionInfo $Config.WebApplicationName -IsCustomLogin:$Config.UseAlternateUserName 
        
        if ($Config.UseAlternateUserName ) { Write-Host ""; Write-Host "Regarding the Ed-Fi ODS:"; }
        Add-SqlLogins $odsDbConnectionInfo $WebApplicationName -IsCustomLogin:$Config.UseAlternateUserName 
        
        if ($Config.UseAlternateUserName ) { Write-Host ""; Write-Host "Regarding the Security DB:"; }
        Add-SqlLogins $securityDbConnectionInfo $Config.WebApplicationName -IsCustomLogin:$Config.UseAlternateUserName 
    }
}


function Uninstall-EdFiOdsSandboxAdmin {
    <#
    .SYNOPSIS
        Removes the Ed-Fi ODS/API web application from IIS.
    .DESCRIPTION
        Removes the Ed-Fi ODS/API web application from IIS, including its application
        pool (if not used for any other application). Removes the web site as well if
        there are no remaining applications, and the site's app pool.

        Does not remove IIS or the URL Rewrite module.

    .EXAMPLE
        PS c:/> Uninstall-EdFiOdsSandboxAdmin

        Uninstall using all default values.
    .EXAMPLE
        PS c:/> $p = @{
            WebSiteName="Ed-Fi"
            WebApplicationPath="d:/octopus/applications/staging/Sandbox-3"
            WebApplicationName = "Sandbox"
        }
        PS c:/> Uninstall-EdFiOdsSandboxAdmin @p

        Uninstall when the web application and web site were setup with non-default values.
    #>
    [CmdletBinding()]
    param (
        # Path for storing installation tools, e.g. nuget.exe. Default: "./tools".
        [string]
        $ToolsPath = "$PSScriptRoot/tools",

        # Path for the web application. Default: "c:\inetpub\Ed-Fi\SandboxAdmin".
        [string]
        $WebApplicationPath = "c:\inetpub\Ed-Fi\SandboxAdmin",

        # Web application name. Default: "SandboxAdmin".
        [string]
        $WebApplicationName = "SandboxAdmin",

        # Web site name. Default: "Ed-Fi".
        [string]
        $WebSiteName = "Ed-Fi",

        # Turns off display of script run-time duration.
        [switch]
        $NoDuration
    )

    $result = @()

    $elapsed = Use-StopWatch {
        $parameters = @{
            WebApplicationPath = $WebApplicationPath
            WebApplicationName = $WebApplicationName
            WebSiteName        = $WebSiteName
        }
        $result += Uninstall-EdFiApplicationFromIIS @parameters
        $result
    }

    Test-Error

    if (-not $NoDuration) {
        $result += New-TaskResult -name "-" -duration "-"
        $result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
        $result | Format-Table
    }
}

Export-ModuleMember -Function Install-EdFiOdsSandboxAdmin, Uninstall-EdFiOdsSandboxAdmin
