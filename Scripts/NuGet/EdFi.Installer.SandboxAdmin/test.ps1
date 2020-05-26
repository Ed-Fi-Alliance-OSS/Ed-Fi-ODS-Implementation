# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# This script should not be included in the NuGet package. It can be used
# to run various test scenarios during manual/exploratory testing.
Param(
    $Scenario
)

& "../../../../Ed-Fi-ODS-Implementation/logistics/scripts/modules/load-path-resolver.ps1"
import-module -Force "$PSScriptRoot\Install-EdFiOdsSandboxAdmin.psm1"

function Invoke-Install {
    $p = @{
        OAuthUrl = "https://localhost/EdFiOdsWebApi"
    }

    Install-EdFiOdsSandboxAdmin @p
}

function Invoke-CustomPackage {
    $p = @{
        OAuthUrl = "https://localhost/EdFiOdsWebApi"
        PackageVersion = "3.4.0-b10596"
    }

    Install-EdFiOdsSandboxAdmin @p
}

function Invoke-InstallCustomSettings {
    $p = @{
        OAuthUrl = "https://localhost/EdFiOdsWebApi"
        PackageVersion = "3.4.0"
        WebSitePath = "c:\inetpub\Ed-Fi-Sandbox"
        WebSitePort = 8765
        WebApplicationPath = "c:\inetpub\Ed-Fi-Sandbox\3.4.0-release"
        WebApplicationName = "SandboxAdmin"
        AppSettingsOverride = @{
            DefaultApplicationName = "My Sandbox Administrator"
            DefaultOperationalContextUri = "uri://sample.edu"
            PreserveLoginUrl = $false
        }
        AccountEmail = "nobody@ed-fi.org"
        AccountSecret = "AccountPassword$"
        PopulatedSecret = "PopulatedSecret$"
        MinimalSecret = "MinimalSecret$"
    }

    Install-EdFiOdsSandboxAdmin @p
}

function Invoke-Uninstall {
    UnInstall-EdFiOdsSandboxAdmin
}

function Invoke-UninstallCustomSettings {
    $p = @{
        WebApplicationPath = "c:\inetpub\Ed-Fi-Sandbox\3.4.0-release"
        WebApplicationName = "SandboxAdmin"
    }

    UnInstall-EdFiOdsSandboxAdmin @p
}

try {
    switch ($Scenario) {
        "Install" { Invoke-Install }
        "CustomPackage" { Invoke-CustomPackage }
        "Uninstall" { Invoke-Uninstall }
        "InstallCustomSettings" { Invoke-InstallCustomSettings }
        "UninstallCustomSettings" { Invoke-UninstallCustomSettings }
        default {
            Write-Host "Valid test scenarios are: "
            Write-Host "    Install"
            Write-Host "    Uninstall"
            Write-Host "    InstallCustomSettings"
            Write-Host "    UninstallCustomSettings"
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
