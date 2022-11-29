# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# This script should not be included in the NuGet package. It can be used
# to run various test scenarios during manual/exploratory testing.
Param(
    $Scenario
)

import-module -force "$PSScriptRoot/Install-EdFiOdsWebApi.psm1"

function Invoke-DifferentWebSite {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "SharedInstance"
        DbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        WebSiteName = "DifferentWebSite"
        WebSitePath = "c:\inetpub\DifferentWebSite"
        WebSitePort = 444
        WebApplicationPath = "c:\inetpub\DifferentWebSite\DifferentAppPath"
        WebApplicationName = "SomethingElse"
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-NonDefaultApplication {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "SharedInstance"
        DbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        PackageName = "EdFi.Ods.WebApi.SF"
        PackageVersion = "3.4.0-b10567"
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-DifferentPackageSource {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "SharedInstance"
        DbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        PackageSource  = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-SeparateConnectionInfo {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "SharedInstance"
        AdminDbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        OdsDbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        SecurityDbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-CommonConnectionInfo {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "SharedInstance"
        DbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-Sandbox {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "Sandbox"
        DbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-YearSpecific {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "YearSpecific"
        DbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
    }
    Install-EdFiOdsWebApi @p
}

function Invoke-FeatureOverride {
    $p = @{
        ToolsPath = "../../../tools"
        InstallType = "SharedInstance"
        AdminDbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        OdsDbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        SecurityDbConnectionInfo = @{
            Engine="SqlServer"
            Server="localhost"
            UseIntegratedSecurity=$true
        }
        WebApiFeatures = @{
            BearerTokenTimeoutMinutes="BearerTokenTimeoutMinutes"                                   
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
    Install-EdFiOdsWebApi @p
}

function Invoke-Uninstall {
    $p = @{
        ToolsPath = "../../../tools"
        WebApplicationPath = "c:\inetpub\Ed-Fi\WebApi"
        WebApplicationName = "WebApi"
        WebSiteName = "Ed-Fi"        
    }
    Uninstall-EdFiOdsWebApi @p
}

function Invoke-UninstallDifferentWebSite {
    $p = @{
        WebApplicationName = "SomethingElse"
        WebSiteName = "DifferentWebSite"
        WebApplicationPath = "c:\inetpub\DifferentWebSite\DifferentAppPath"
    }
    Uninstall-EdFiOdsWebApi @p
}

try {
    switch ($Scenario) {
        "DifferentPackageSource" { Invoke-DifferentPackageSource } 
        "SeparateConnectionInfo" { Invoke-SeparateConnectionInfo } 
        "CommonConnectionInfo" { Invoke-CommonConnectionInfo }
        "FeatureOverride" { Invoke-FeatureOverride }
        "YearSpecific" { Invoke-YearSpecific }
        "DifferentWebSite" { Invoke-DifferentWebSite }
        "NonDefaultApplication" { Invoke-NonDefaultApplication }
        "Uninstall" { Invoke-Uninstall }
        "UninstallDifferentWebSite" { Invoke-UninstallDifferentWebSite }
        "Sandbox" { Invoke-Sandbox }
        default { 
            Write-Host "Valid test scenarios are: "
            Write-Host "    DifferentPackageSource"
            Write-Host "    SeparateConnectionInfo"
            Write-Host "    CommonConnectionInfo"
            Write-Host "    FeatureOverride"
            Write-Host "    YearSpecific"
            Write-Host "    DifferentWebSite"
            Write-Host "    NonDefaultApplication"
            Write-Host "    Uninstall"
            Write-Host "    UninstallDifferentWebSite"
        }
    }
}
catch {
    $ErrorRecord= $_
    $ErrorRecord | Format-List * -Force
    $ErrorRecord.InvocationInfo |Format-List *
    $Exception = $ErrorRecord.Exception
    for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException))
    {
        "$i" * 80
        $Exception |Format-List * -Force
    }
}