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

& "$PSScriptRoot/Ed-Fi-ODS-Implementation/logistics/scripts/modules/load-path-resolver.ps1"
Import-Module -Force -Scope Global $folders.modules.invoke("packaging/nuget-helper.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("tasks/TaskHelper.psm1")

# Import the following with global  scope so that they are available inside of script blocks
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Install.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Uninstall.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Configuration.psm1")

function Install-EdFiOdsSwaggerUI {
    <#
    .SYNOPSIS
        Installs the Ed-Fi ODS Swagger application into IIS.

    .DESCRIPTION
        Installs and configures the Ed-Fi ODS Swagger application in IIS running
        in Windows 10 or Windows Server 2016+. As needed, will create a new "Ed-Fi"
        website in IIS, configure it for HTTPS, and load the SwaggerUI binaries as an
        application. Transforms the web.config by injecting the correct Ed-Fi ODS/API
        version and metadata URLs.

    .EXAMPLE
        PS c:\> $parameters = @{
            ToolsPath = "C:/temp/tools"
            WebApiMetadataUrl = "https://my-server.example/EdFiOdsWebApi/metadata"
            WebApiVersionUrl = "https://my-server.example/EdFiOdsWebApi"
        }
        PS c:\> Install-EdFiOdsSwaggerUI @parameters
    #>
    [CmdletBinding()]
    param (
        # NuGet package name. Default: EdFi.Suite3.Ods.SwaggerUI.
        [string]
        $PackageName = "EdFi.Suite3.Ods.SwaggerUI",

        # NuGet package version. If not set, will retrieve the latest full release package.
        [string]
        $PackageVersion,

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
        [string]
        $WebsiteName = "Ed-Fi",

        # Web site port number. Default: 443.
        [int]
        $WebSitePort = 443,

        # Path for the web application. Default: "c:\inetpub\Ed-Fi\SwaggerUI".
        [string]
        $WebApplicationPath = "c:\inetpub\Ed-Fi\SwaggerUI", # NB: _must_ use backslash with IIS settings

        # Web application name. Default: "SwaggerUI".
        [string]
        $WebApplicationName = "SwaggerUI",

        # Full URL to the Ed-Fi ODS / API metadata endpoint.
        [string]
        [Parameter(Mandatory=$true)]
        $WebApiMetadataUrl,

        # Full URL to the Ed-Fi ODS / API version endpoint.
        [string]
        [Parameter(Mandatory=$true)]
        $WebApiVersionUrl,

        # When true, pre-populated key and secret will not be injected into the config file.
        [switch]
        $DisablePrepopulatedCredentials,

        # Initial client key to load into the web.config file. Default: populatedSandbox.
        [string]
        $PrePopulatedKey = "populatedSandbox",

        # Initial client secret to load into the web.config file. Default: populatedSandboxSecret.
        [string]
        $PrePopulatedSecret = "populatedSandboxSecret",

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
        ToolsPath = $ToolsPath
        DownloadPath = $DownloadPath
        WebSitePath = $WebSitePath
        WebSiteName = $WebsiteName
        WebSitePort = $WebsitePort
        WebApplicationName = $WebApplicationName
        WebApiMetadataUrl = $WebApiMetadataUrl
        WebApiVersionUrl = $WebApiVersionUrl
        PrePopulatedKey = $PrePopulatedKey
        PrePopulatedSecret = $PrePopulatedSecret
        DisablePrepopulatedCredentials = $DisablePrepopulatedCredentials
        NoDuration = $NoDuration
    }

    $elapsed = Use-StopWatch {

        $result += Get-SwaggerPackage -Config $Config
        $result += Invoke-TransformWebConfigRelease -Config $Config
        $result += Invoke-TransformWebConfigOctopus -Config $Config
        $result += Invoke-TransformWebConfigAppSettings -Config $Config
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

function Uninstall-EdFiOdsSwaggerUI {
    <#
    .SYNOPSIS
        Removes the Ed-Fi ODS/API web application from IIS.
    .DESCRIPTION
        Removes the Ed-Fi ODS/API web application from IIS, including its application
        pool (if not used for any other application). Removes the web site as well if
        there are no remaining applications, and the site's app pool.

        Does not remove IIS or the URL Rewrite module.

    .EXAMPLE
        PS c:\> Uninstall-EdFiOdsSwaggerUI

        Uninstall using all default values.
    .EXAMPLE
        PS c:\> $p = @{
            WebSiteName="Ed-Fi-3"
            WebApplicationPath="d:/octopus/applications/staging/SwaggerUI-3"
            WebApplicationName = "SwaggerUI"
        }
        PS c:\> Uninstall-EdFiOdsSwaggerUI @p

        Uninstall when the web application and web site were setup with non-default values.
    #>
    [CmdletBinding()]
    param (
        # Path for storing installation tools, e.g. nuget.exe. Default: "./tools".
        [string]
        $ToolsPath = "$PSScriptRoot/tools",

        # Path for the web application. Default: "c:\inetpub\Ed-Fi\SwaggerUI".
        [string]
        $WebApplicationPath = "c:\inetpub\Ed-Fi\SwaggerUI",

        # Web application name. Default: "SwaggerUI".
        [string]
        $WebApplicationName = "SwaggerUI",

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

function Get-SwaggerPackage {
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
        }
        $packageDir = Get-NuGetPackage @parameters

        $Config.PackageDirectory = $packageDir
        $Config.WebConfigLocation = Resolve-Path (Join-Path $packageDir "Web.config")
    }
}

function Invoke-TransformWebConfigRelease {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $transformParams = @{
            sourceFile = "$($Config.PackageDirectory)/Web.Base.config"
            transformFile = "$($Config.PackageDirectory)/Web.Release.config"
            destinationFile = "$($Config.PackageDirectory)/Web.config"
            toolsPath = $Config.ToolsPath
        }
        Invoke-ConfigTransformation @transformParams
    }
}

function Invoke-TransformWebConfigOctopus {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $transformParams = @{
            sourceFile = "$($Config.PackageDirectory)/Web.Base.config"
            transformFile = "$($Config.PackageDirectory)/Web.Octopus.config"
            destinationFile = "$($Config.PackageDirectory)/Web.config"
            toolsPath = $Config.ToolsPath
        }
        Invoke-ConfigTransformation @transformParams
    }
}

function Invoke-TransformWebConfigAppSettings {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {

        if ($Config.DisablePrepopulatedCredentials) {
            $Config.PrePopulatedKey = [string]::Empty
            $Config.PrePopulatedSecret = [string]::Empty
        }

        $appSettings = @{
            "swagger.webApiMetadataUrl" = $Config.WebApiMetadataUrl
            "swagger.webApiVersionUrl" = $Config.WebApiVersionUrl
            "swagger.prepopulatedKey" = $Config.PrePopulatedKey
            "swagger.prepopulatedSecret" = $Config.PrePopulatedSecret
        }

        Set-ApplicationSettings -ConfigFile $Config.WebConfigLocation -appSettings $appSettings
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

Export-ModuleMember -Function Install-EdFiOdsSwaggerUI, Uninstall-EdFiOdsSwaggerUI
