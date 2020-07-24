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

# Import the following with global scope so that they are available inside of script blocks
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Install.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Uninstall.psm1")
Import-Module -Force -Scope Global $folders.modules.invoke("Application/Configuration.psm1")

function Install-EdFiOdsWebApi {
    <#
    .SYNOPSIS
        Installs the Ed-Fi ODS WebApi application into IIS.

    .DESCRIPTION
        Installs and configures the Ed-Fi ODS WebApi application in IIS running in Windows 10 or
        Windows Server 2016+. As needed, will create a new "Ed-Fi" website in IIS, configure it
        for HTTPS, and load the WebAPI binaries as an an application. Transforms the web.config
        as needed for the database engine of choice, to set connection strings, and override
        default feature settings. Supports all API mode/install types: Shared Instance, Year
        Specific, Sandbox, District.

        This function has two different parameter sets for database connectivity: one parameter for
        all three Ed-Fi databases residing the same server, and an alternate set of parameters
        for supporting databases residing on separate servers. However, all three databases
        must be on the same database engine - should not install on a mix of SQL Server and
        PostgreSQL.

    .EXAMPLE
        PS c:\> $parameters = @{
            DbConnectionInfo = @{
                Engine="SqlServer"
                Server="my-sql-server.example"
                UseIntegratedSecurity=$true
            }
        }
        PS c:\> Install-EdFiOdsWebApi @parameters

        Use all available default values, connecting to databases on a single SQL Server instance.
        Connect to the database with integrated security. The WebApi application will be set to
        Shared Instance mode. This will create IIS website "Ed-Fi" with root c:\inetpub\Ed-Fi,
        and the application files will be in "c:\inetpub\Ed-Fi\WebApi". Installs the most recent full
        release of the WebApi software.
    .EXAMPLE
        PS c:\> $parameters = @{
            AdminDbConnectionInfo = @{
                Engine="SqlServer"
                Server="edfi-auth.my-sql-server.example"
                UseIntegratedSecurity=$true
            }
            OdsDbConnectionInfo = @{
                DatabaseName="EdFi_ODS_Staging"
                Engine="SqlServer"
                Server="edfi-stage.my-sql-server.example"
                Username="ods-write"
                Password="@#$%^&*(GHJ%^&*YUKSDF"
            }
            AdminDbConnectionInfo = @{
                Engine="SqlServer"
                Server="edfi-auth.my-sql-server.example"
                UseIntegratedSecurity=$true
            }
        }
        PS c:\> Install-EdFiOdsWebApi @parameters

        Install with all web application defaults, but using separate database connections.
        Override the name of the ODS database and use username/password for the ODS connection.

    .EXAMPLE
        PS c:\> $parameters = @{
            InstallType="YearSpecific"
            DbConnectionInfo=@{
                Engine="PostgreSQL"
                Server="my-pg-server.example"
                Username="ods-admin"
            }
            WebSiteName="Ed-Fi-3"
            WebSitePath="c:\inetpub\Ed-Fi-3"
            WebApplicationPath="d:/octopus/applications/staging/EdFiOdsApi-3"
            WebSitePort=843
            CertThumbprint="a909502dd82ae41433e6f83886b00d4277a32a7b"
        }
        PS c:\> Install-EdFiOdsWebApi @parameters

        Install in Year Specific mode on PostgreSQL, with alternate IIS configuration.
        Assumes the presence of pgconf file for the password. Note that a Year Specific
        connection string should include {0}. That token will be injected if it is omitted.
        Furthermore, this mode expects "Ods" in the database name. Thus for input value
        "EdFi", the connection string will contain "EdFi_{0}" and the database server
        should have a database named "EdFi_Ods_2020" (or whatever year is in use).

    .EXAMPLE
        PS c:\> $parameters = @{
            InstallType="Sandbox"
            DbConnectionInfo=@{
                DatabaseName="EdFi_Sandbox"
                Engine="SqlServer"
                Server="localhost"
                UseIntegratedSecurity=$true
            }
        }
        PS c:\> Install-EdFiOdsWebApi @parameters

        Install in Sandbox mode on SQL Server with default IIS configuration.
        Override the default ODS database name. Note that a Sandbox connection string
        must include {0}. That token will be injected if it is omitted. Furthermore,
        the Sandbox mode expects "Ods" in the database name. Thus for input value
        "EdFi_Sandbox", the connection string will contain "EdFi_Sandbox_{0}" and the
        database server should have databases named "EdFi_Sandbox_Ods_Minimal_Template"
        and "EdFi_Sandbox_Ods_Populated_Template".

    .EXAMPLE
        PS c:\> $parameters = @{
            DbConnectionInfo=@{
                Engine="SqlServer"
                Server="my-sql-server.example"
                UseIntegratedSecurity=$true
            }
            WebApiFeatures = @{
                BearerTokenTimeoutMinutes="23"
                ExcludedExtensionSources="GrandBend"
                FeatureIsEnabled=@{
                    changeQueries = $true
                    openApiMetadata = $false
                    composites = $false
                    profiles = $false
                    identityManagement = $false
                    extensions = $false
                    ownershipBasedAuthorization = $true
                    uniqueIdValidation = $true
                }
            }
        }
        PS c:\> Install-EdFiOdsWebApi @parameters

        Install in the default mode (shared) instance with basic database
        configuration, with override all available web.config app settings.
    #>
    [CmdletBinding()]
    param (
        # NuGet package name. Default: EdFi.Suite3.Ods.WebApi.
        [string]
        $PackageName = "EdFi.Suite3.Ods.WebApi",

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

        # Path for the web application. Default: "c:\inetpub\Ed-Fi\WebApi".
        [string]
        $WebApplicationPath = "c:\inetpub\Ed-Fi\WebApi", # NB: _must_ use backslash with IIS settings

        # Web application name. Default: "WebApi".
        [string]
        $WebApplicationName = "WebApi",

        # TLS certificate thumbprint, optional. When not set, a self-signed certificate will be created.
        [string]
        $CertThumbprint,

        # API mode / install type: Sandbox, SharedInstance, YearSpecific, DistrictSpecific. Default: SharedInstance.
        [string]
        [ValidateSet("Sandbox", "SharedInstance", "YearSpecific", "DistrictSpecific")]
        $InstallType = "SharedInstance",

        # Name for the Admin database. Default: EdFi_Admin.
        [string]
        [Parameter(ParameterSetName="SharedCredentials")]
        $AdminDatabaseName = "EdFi_Admin",

        # Name for the ODS Database. Replaces "_ODS" with "_{0}" if not present
        # and InstallType is not SharedInstance. Default: EdFi_ODS.
        [string]
        [Parameter(ParameterSetName="SharedCredentials")]
        $OdsDatabaseName = "EdFi_Ods",

        # Name for the Security database. Default: EdFi_Security.
        [string]
        [Parameter(ParameterSetName="SharedCredentials")]
        $SecurityDatabaseName = "EdFi_Security",

        # Shared database connectivity information.
        #
        # The hashtable must include: Server, Engine (SqlServer or PostgreSQL), and
        # either UseIntegratedSecurity or Username and Password (Password can be skipped
        # for PostgreSQL when using pgconf file). Optionally can include Port.
        [hashtable]
        [Parameter(Mandatory=$true, ParameterSetName="SharedCredentials")]
        $DbConnectionInfo,

        # Database connectivity only for the admin database.
        #
        # The hashtable must include: Server, Engine (SqlServer or PostgreSQL), and
        # either UseIntegratedSecurity or Username and Password (Password can be skipped
        # for PostgreSQL when using pgconf file). Optionally can include Port and
        # DatabaseName.
        [hashtable]
        [Parameter(Mandatory=$true, ParameterSetName="SeparateCredentials")]
        $AdminDbConnectionInfo,

        # Database connectivity only for the ODS database.
        #
        # The hashtable must include: Server, Engine (SqlServer or PostgreSQL), and
        # either UseIntegratedSecurity or Username and Password (Password can be skipped
        # for PostgreSQL when using pgconf file). Optionally can include Port and
        # DatabaseName.
        [hashtable]
        [Parameter(Mandatory=$true, ParameterSetName="SeparateCredentials")]
        $OdsDbConnectionInfo,

        # Database connectivity only for the security database.
        #
        # The hashtable must include: Server, Engine (SqlServer or PostgreSQL), and
        # either UseIntegratedSecurity or Username and Password (Password can be skipped
        # for PostgreSQL when using pgconf file). Optionally can include Port and
        # DatabaseName.
        [hashtable]
        [Parameter(Mandatory=$true, ParameterSetName="SeparateCredentials")]
        $SecurityDbConnectionInfo,

        # Optional overrides for features and settings in the web.config.
        #
        # The hashtable can include: BearerTokenTimeoutMinutes, ExcludedExtensionsSources,
        # and FeatureIsEnabled dictionary. The dictionary enable/disable any feature in
        # the web.config file, for example "changeQueries" or "composites".
        [hashtable]
        $WebApiFeatures,

        # Turns off display of script run-time duration.
        [switch]
        $NoDuration
    )
    Write-InvocationInfo $MyInvocation

    Clear-Error

    $result = @()

    $config = @{
        WebApplicationPath = $WebApplicationPath
        PackageName = $PackageName
        PackageVersion = $PackageVersion
        ToolsPath = $ToolsPath
        DownloadPath = $DownloadPath
        WebSitePath = $WebSitePath
        WebSiteName = $WebsiteName
        WebSitePort = $WebsitePort
        CertThumbprint = $CertThumbprint
        WebApplicationName = $WebApplicationName
        InstallType = $InstallType
        AdminDatabaseName = $AdminDatabaseName
        SecurityDatabaseName = $SecurityDatabaseName
        OdsDatabaseName = $OdsDatabaseName
        DbConnectionInfo = $DbConnectionInfo
        AdminDbConnectionInfo = $AdminDbConnectionInfo
        OdsDbConnectionInfo = $OdsDbConnectionInfo
        SecurityDbConnectionInfo = $SecurityDbConnectionInfo
        WebApiFeatures = $WebApiFeatures
        NoDuration = $NoDuration
    }

    $elapsed = Use-StopWatch {
        $result += Initialize-Configuration -Config $config
        $result += Get-WebApiPackage -Config $config
        $result += Invoke-TransformWebConfigRelease -Config $config

        if (Test-IsPostgreSQL -Engine $config.Engine) {
            $result += Invoke-TransformWebConfigPostgreSQL -Config $config
        }

        $result += Invoke-TransformWebConfigAppSettings -Config $config
        $result += Invoke-TransformWebConfigConnectionStrings -Config $config
        $result += Install-Application -Config $config
        $result += New-SqlLogins -Config $config

        $result
    }

    Test-Error

    if (-not $NoDuration) {
        $result += New-TaskResult -name "-" -duration "-"
        $result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format
        $result | Format-Table
    }
}

function Initialize-Configuration {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )
    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        # Validate the input parameters. Couldn't do so in the parameter declaration
        # because the function is contained in the Configuration module imported above.
        $Config.usingSharedCredentials = $Config.ContainsKey("DbConnectionInfo") -and (-not $null -eq $Config.DbConnectionInfo)
        if ($Config.usingSharedCredentials) {
            Assert-DatabaseConnectionInfo -DbConnectionInfo $Config.DbConnectionInfo
            $Config.DbConnectionInfo.ApplicationName = "Ed-Fi ODS WebApi"
            $Config.engine = $Config.DbConnectionInfo.Engine
        }
        else {
            Assert-DatabaseConnectionInfo -DbConnectionInfo $Config.AdminDbConnectionInfo
            Assert-DatabaseConnectionInfo -DbConnectionInfo $Config.OdsDbConnectionInfo
            Assert-DatabaseConnectionInfo -DbConnectionInfo $Config.SecurityDbConnectionInfo
            $Config.AdminDbConnectionInfo.ApplicationName = "Ed-Fi ODS WebApi"
            $Config.OdsDbConnectionInfo.ApplicationName = "Ed-Fi ODS WebApi"
            $Config.SecurityDbConnectionInfo.ApplicationName = "Ed-Fi ODS WebApi"
            $Config.engine = $Config.OdsDbConnectionInfo.Engine
        }
    }
}

function Get-WebApiPackage {
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
        Test-Error

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

function Invoke-TransformWebConfigPostgreSQL {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )
    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        $transformParams = @{
            sourceFile = "$($Config.PackageDirectory)/Web.config"
            transformFile = "$($Config.PackageDirectory)/Web.Npgsql.config"
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
        $appSettings = @{
            "apiStartup:type" = $Config.InstallType
        }

        if ($Config.WebApiFeatures) {
            if ($Config.WebApiFeatures.ContainsKey("BearerTokenTimeoutMinutes")) {
                $appSettings.BearerTokenTimeoutMinutes = $Config.WebApiFeatures.BearerTokenTimeoutMinutes
            }
            if ($Config.WebApiFeatures.ContainsKey("ExcludedExtensionSources")) {
                $appSettings.ExcludedExtensionSources = $Config.WebApiFeatures.ExcludedExtensionSources
            }
            if ($Config.WebApiFeatures.FeatureIsEnabled) {
                $Config.WebApiFeatures.FeatureIsEnabled.GetEnumerator() | ForEach-Object {
                    $appSettings["$($_.key):featureIsEnabled"] = $_.value.toString()
                }
            }
        }

        Set-ApplicationSettings -ConfigFile $Config.WebConfigLocation -appSettings $appSettings
    }
}

function Invoke-TransformWebConfigConnectionStrings {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )
    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {
        if ($Config.usingSharedCredentials) {
            # ODS database name needs to have {0} for all but the SharedInstance mode. Convention is "_{0}".
            if ((-not ("SharedInstance" -ieq $Config.InstallType)) -and (-not $Config.OdsDatabaseName.Contains("{0}"))) {
                $Config.OdsDatabaseName += "_{0}"

                # Eliminate potential duplication of "Ods" in token
                $Config.OdsDatabaseName = $Config.OdsDatabaseName -replace "_Ods_\{0\}", "_{0}"
            }

            $Config.AdminDbConnectionInfo = $Config.DbConnectionInfo.Clone()
            $Config.AdminDbConnectionInfo.DatabaseName = $Config.AdminDatabaseName

            $Config.OdsDbConnectionInfo = $Config.DbConnectionInfo.Clone()
            $Config.OdsDbConnectionInfo.DatabaseName = $Config.OdsDatabaseName

            $Config.SecurityDbConnectionInfo = $Config.DbConnectionInfo.Clone()
            $Config.SecurityDbConnectionInfo.DatabaseName = $Config.SecurityDatabaseName
        }
        else {
            # Inject default database names if not provided
            if (-not $Config.AdminDbConnectionInfo.DatabaseName) {
                $Config.AdminDbConnectionInfo.DatabaseName = "EdFi_Admin"
            }
            if (-not $Config.OdsDbConnectionInfo.DatabaseName) {
                if ("SharedInstance" -ieq "$Config.InstallType") {
                    $Config.OdsDbConnectionInfo.DatabaseName = "EdFi_Ods"
                }
                else {
                    $Config.OdsDbConnectionInfo.DatabaseName = "EdFi_{0}"
                }
            }
            if (-not $Config.SecurityDbConnectionInfo.DatabaseName) {
                $Config.SecurityDbConnectionInfo.DatabaseName = "EdFi_Security"
            }
        }

        Write-Host "Setting database connections in $($Config.WebConfigLocation)"
        $parameters = @{
            ConfigFile = $Config.WebConfigLocation
            AdminDbConnectionInfo = $Config.AdminDbConnectionInfo
            OdsDbConnectionInfo = $Config.OdsDbConnectionInfo
            SecurityDbConnectionInfo = $Config.SecurityDbConnectionInfo
        }
        Set-DatabaseConnections @parameters
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
            CertThumbprint = $Config.CertThumbprint
        }
        Install-EdFiApplicationIntoIIS @iisParams
    }
}

function New-SqlLogins {
    [CmdletBinding()]
    param (
        [hashtable]
        [Parameter(Mandatory=$true)]
        $Config
    )

    Invoke-Task -Name ($MyInvocation.MyCommand.Name) -Task {

        if($Config.usingSharedCredentials)
        {
            Add-SqlLogins $Config.DbConnectionInfo $Config.WebApplicationName
        }
        else
        {
            Add-SqlLogins $Config.AdminDbConnectionInfo $Config.WebApplicationName
            Add-SqlLogins $Config.OdsDbConnectionInfo $Config.WebApplicationName
            Add-SqlLogins $Config.SecurityDbConnectionInfo $Config.WebApplicationName
        }
    }
}

function Uninstall-EdFiOdsWebApi {
    <#
    .SYNOPSIS
        Removes the Ed-Fi ODS/API web application from IIS.

    .DESCRIPTION
        Removes the Ed-Fi ODS/API web application from IIS, including its application
        pool (if not used for any other application). Removes the web site as well if
        there are no remaining applications, and the site's app pool.

        Does not remove IIS or the URL Rewrite module.

    .EXAMPLE
        Uninstall using all default values.

        PS c:\> Uninstall-EdFiOdsWebApi

    .EXAMPLE
        Uninstall when the web application and web site were setup with non-default values.

        PS c:\> $p = @{
            WebSiteName="Ed-Fi-3"
            WebApplicationPath="d:/octopus/applications/staging/EdFiOdsApi-3"
            WebApplicationName = "EdFiOdsWebApi"
        }
        PS c:\> Uninstall-EdFiOdsWebApi @p
    #>
    [CmdletBinding()]
    param (
        # Path for storing installation tools, e.g. nuget.exe. Default: "./tools".
        [string]
        $ToolsPath = "$PSScriptroot/tools",

        # Path for the web application. Default: "c:\inetpub\Ed-Fi\WebApi".
        [string]
        $WebApplicationPath = "c:\inetpub\Ed-Fi\WebApi",

        # Web application name. Default: "WebApi".
        [string]
        $WebApplicationName = "WebApi",

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
            WebApplicationPath = $config.WebApplicationPath
            WebApplicationName = $config.WebApplicationName
            WebSiteName = $config.WebSiteName
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

Export-ModuleMember -Function Install-EdFiOdsWebApi, Uninstall-EdFiOdsWebApi
