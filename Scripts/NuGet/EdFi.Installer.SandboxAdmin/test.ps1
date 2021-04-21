# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# This script should not be included in the NuGet package. It can be used
# to run various test scenarios during manual/exploratory testing.
Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet(
        'Install',
        'InstallPostgreSQL',
        'InstallCustomPackage',
        'Uninstall',
        'InstallCustomSettings',
        'UninstallCustomSettings'
    )]
    $Scenario
)

Import-Module -Force -Global "$PSScriptRoot/Install-EdFiOdsSandboxAdmin.psm1"

function Invoke-Install { Install-EdFiOdsSandboxAdmin }

function Invoke-InstallPostgreSQL { Install-EdFiOdsSandboxAdmin -Engine PostgreSQL }

function Invoke-InstallCustomPackage {
    $params = @{ PackageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json" }
    Install-EdFiOdsSandboxAdmin @params
}

function Invoke-InstallCustomSettings {
    $params = @{
        PackageVersion     = "5.1.0"
        WebSitePath        = "c:\inetpub\SandboxAdminTest"
        WebApplicationPath = "c:\inetpub\SandboxAdminTest\5.1.0-test"
        WebApplicationName = "SandboxAdminTest"
        WebSitePort        = 8765
        Settings           = @{
            DefaultApplicationName       = "My Sandbox Administrator"
            DefaultOperationalContextUri = "uri://sample.edu"
            PreserveLoginUrl             = $false
            User                         = @{
                "Test Admin" = @{
                    Email             = "nobody@ed-fi.org"
                    Password          = "***REMOVED***"
                    Admin             = $true
                    NamespacePrefixes = @("uri://ed-fi.org", "uri://gbisd.org")
                    Sandboxes         = @{
                        "Populated Demonstration Sandbox" = @{
                            Key     = "populatedSandbox"
                            Secret  = "populatedSandboxSecret"
                            Type    = "Sample"
                            Refresh = $false
                        }
                        "Minimal Demonstration Sandbox"   = @{
                            Key     = "minimalSandbox"
                            Secret  = "minimalSandboxSecret"
                            Type    = "Minimal"
                            Refresh = $false
                        }
                    }
                }
            }
        }
    }

    Install-EdFiOdsSandboxAdmin @params
}

function Invoke-Uninstall { UnInstall-EdFiOdsSandboxAdmin }

function Invoke-UninstallCustomSettings {
    $params = @{
        WebApplicationPath = "c:\inetpub\SandboxAdminTest\5.1.0-test"
        WebApplicationName = "SandboxAdminTest"
    }

    UnInstall-EdFiOdsSandboxAdmin @params
}

try {
    & "Invoke-$Scenario"
}
catch {
    $ErrorRecord = $_
    $ErrorRecord | Format-List * -Force
    $ErrorRecord.InvocationInfo | Format-List *
    $Exception = $ErrorRecord.Exception
    for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException)) {
        "$i" * 80
        $Exception | Format-List * -Force
    }
}
