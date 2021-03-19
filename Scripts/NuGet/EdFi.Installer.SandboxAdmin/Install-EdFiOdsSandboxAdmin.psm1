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

Import-Module -Force -Scope Global "$PSScriptRoot/Ed-Fi-ODS-Implementation/logistics/scripts/modules/path-resolver.psm1"
Import-Module -Force -Scope Global $folders.modules.invoke("utility/hashtable.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("packaging/nuget-helper.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("tasks/TaskHelper.psm1")

# Import the following with global scope so that they are available inside of script blocks
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Install.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Uninstall.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Configuration.psm1")

function Install-EdFiOdsSandboxAdmin {
    <#
    .SYNOPSIS
        Installs the Ed-Fi ODS Sandbox Admin application into IIS.

    .DESCRIPTION
        Installs and configures the Ed-Fi ODS Sandbox Admin application in IIS
        running in Windows 10 or Windows Server 2016+. As needed, will create
        a new "Ed-Fi" website in IIS, configure it for HTTPS, and load the
        SandboxAdmin binaries as an an application. Transforms the web.config
        by injecting the correct Ed-Fi ODS/API version and metadata URLs.

    .EXAMPLE
        PS c:\> $parameters = @{
            OAuthUrl = "https://localhost/EdFiOdsWebApi"
        }
        PS c:\> Install-EdFiOdsSandboxAdmin @parameters

        Using all available default settings.

    .EXAMPLE
        PS c:\> $parameters = @{
            OAuthUrl = "https://localhost/EdFiOdsWebApi"
            PackageVersion = "3.4.0-b10596"
            WebSitePath = "c:\inetpub\Ed-Fi-Sandbox"
            WebSitePort = 8765
            WebApplicationPath = "c:\inetpub\Ed-Fi-Sandbox/3.4.0-b10596"
            WebApplicationName = "SandboxAdmin3.4"
            AppSettingsOverride = @{
                DefaultApplicationName = "My Sandbox Administrator"
                DefaultOperationalContextUri = "uri://sample.edu"
                PreserveLoginUrl = $false
            }
            AccountEmail = "nobody@ed-fi.org"
            AccountSecret = "AccountPassword$"
            PopulatedSecret = "PopulatedSecret$"
            MinimalSecret = "MinimalSecret$"
            ToolsPath = "c:/temp/tools"
        }
        PS c:\> Install-EdFiOdsSandboxAdmin @parameters

        Detailed example setting all customizations.
    #>
    [CmdletBinding()]
    param (
        # NuGet package name. Default: EdFi.Suite3.Ods.SandboxAdmin.Web.
        [string]
        $PackageName = "EdFi.Suite3.Ods.SandboxAdmin",

        # NuGet package version. If not set, will retrieve the latest full release package.
        [string]
        $PackageVersion,

        # NuGet package source . default value is set for release package source for installer .
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

        # Path for the web application. Default: "c:\inetpub\Ed-Fi\SandboxAdmin".
        [string]
        $WebApplicationPath = "c:\inetpub\Ed-Fi\SandboxAdmin", # NB: _must_ use backslash with IIS settings

        # Web application name. Default: "SandboxAdmin".
        [string]
        $WebApplicationName = "SandboxAdmin",

        # Full URL to the Ed-Fi ODS / API OAuth endpoint.
        [string]
        [Parameter(Mandatory=$true)]
        $OAuthUrl,

        # Optional hashtable containing appSettings override values.
        [hashtable]
        $AppSettingsOverrides = @{},

        # Web site user e-mail address. Default value: test@ed-fi.org.
        [string]
        $AccountEmail = "test@ed-fi.org",

        # Web site user password. Default value: ***REMOVED***.
        [string]
        $AccountSecret = "***REMOVED***",

        # Secret for the Populated Sandbox credentials
        [string]
        $PopulatedSecret = "populatedSandboxSecret",

        # Secret for the Minimal Sandbox credentials
        [string]
        $MinimalSecret = "minimumSandboxSecret",

        # Turns off display of script run-time duration.
        [switch]
        $NoDuration
    )

    Write-InvocationInfo $MyInvocation

    Clear-Error

    $result = @()

    $Config = @{
        WebApplicationPath = $WebApplicationPath
        PackageName = $PackageName
        PackageVersion = $PackageVersion
        PackageSource = $PackageSource
        ToolsPath = $ToolsPath
        DownloadPath = $DownloadPath
        WebSitePath = $WebSitePath
        WebSiteName = $WebSiteName
        WebSitePort = $WebSitePort
        WebApplicationName = $WebApplicationName
        OAuthUrl = $OAuthUrl
        AppSettingsOverrides = $AppSettingsOverrides
        AccountEmail = $AccountEmail
        AccountSecret = $AccountSecret
        PopulatedSecret = $PopulatedSecret
        MinimalSecret = $MinimalSecret
        NoDuration = $NoDuration
    }

    $elapsed = Use-StopWatch {

        $result += Get-SandboxAdminPackage -Config $Config
        $result += Invoke-TransformWebConfigAppSettings -Config $Config
        $result += Invoke-TransformWebConfigAccountInitialization -Config $Config
        $result += Install-Application -Config $Config

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
        [Parameter(Mandatory=$true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $parameters = @{
            PackageName = $Config.PackageName
            PackageVersion = $Config.PackageVersion
            ToolsPath = $Config.ToolsPath
            OutputDirectory = $Config.DownloadPath
            PackageSource = $Config.PackageSource
        }
        $packageDir = Get-NuGetPackage @parameters
        Test-Error

        $Config.PackageDirectory = $packageDir
        $Config.WebConfigLocation = $packageDir
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

function Invoke-TransformWebConfigAppSettings {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $settingsFile = Join-Path $Config.WebConfigLocation "appsettings.json"
        $settings = Get-Content $settingsFile | ConvertFrom-Json | ConvertTo-Hashtable
        $settings.OAuthUrl=$Config.OAuthUrl
        $mergedSettings = Merge-Hashtables $settings, $Config.AppSettingsOverrides
        New-JsonFile $settingsFile $mergedSettings -Overwrite
    }
}

function Invoke-TransformWebConfigAccountInitialization {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )
    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $webConfigPath = "$($Config.PackageDirectory)/appsettings.json"
        $settings = Get-Content $webConfigPath | ConvertFrom-Json | ConvertTo-Hashtable

        $InitializationSetting =@{
            User = @{
                "Test Admin" = @{
                    Email             = $Config.AccountEmail
                    Password          = $Config.AccountSecret
                    Admin             = "true"
                    NamespacePrefixes = @(
                        "uri://ed-fi.org"
                        "uri://gbisd.org"
                    )
                    Sandboxes         = @{
                        "Populated Demonstration Sandbox" = @{
                            Key     = "populatedSandbox"
                            Secret  = $Config.PopulatedSecret
                            Type    = "Sample"
                            Refresh = "false"
                        }
                        "Minimal Demonstration Sandbox"   = @{
                            Key     = "minimalSandbox"
                            Secret  = $Config.MinimalSecret
                            Type    = "Minimal"
                            Refresh = "false"
                        }
                    }
                }
            }
        }

        $mergedSettings = Merge-Hashtables $settings, $InitializationSetting
        New-JsonFile $webConfigPath  $mergedSettings -Overwrite
       
    }
}

function Install-Application {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )
    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {

        $iisParams = @{
            SourceLocation = $Config.PackageDirectory
            WebApplicationPath = $Config.WebApplicationPath
            WebApplicationName = $Config.WebApplicationName
            WebSitePath = $Config.WebSitePath
            WebSitePort = $WebSitePort
            WebSiteName = $Config.WebSiteName
        }
        Install-EdFiApplicationIntoIIS @iisParams
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
        PS c:\> Uninstall-EdFiOdsSandboxAdmin

        Uninstall using all default values.
    .EXAMPLE
        PS c:\> $p = @{
            WebSiteName="Ed-Fi-3"
            WebApplicationPath="d:/octopus/applications/staging/Sandbox-3"
            WebApplicationName = "Sandbox"
        }
        PS c:\> Uninstall-EdFiOdsSandboxAdmin @p

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

    $config = @{
        ToolsPath = $ToolsPath
        WebApplicationPath = $WebApplicationPath
        WebApplicationName = $WebApplicationName
        WebSiteName = $WebSiteName
    }

    $result = @()

    $elapsed = Use-StopWatch {

        $parameters = @{
            WebApplicationPath = $Config.WebApplicationPath
            WebApplicationName = $Config.WebApplicationName
            WebSiteName = $Config.WebSiteName
        }
        Uninstall-EdFiApplicationFromIIS @parameters

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
