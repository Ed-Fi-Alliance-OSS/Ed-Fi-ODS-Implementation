# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#Requires -Version 5

<#
.SYNOPSIS
    Builds and tags Ed-Fi ODS/API Dockerfiles for publishing. Optionally pushes to a registry.
.DESCRIPTION
    * Does not include the Gateway image, which is only for local testing.
    * See the following links to find the latest available versions of the various packages:

    Admin:            https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Database.Admin.PostgreSQL.Standard.5.2.0/overview
    Api:              https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.WebApi.Standard.5.2.0/overview
    ODS:              https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.Minimal.Template.PostgreSQL.Standard.5.2.0/overview
    Security:         https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Database.Security.PostgreSQL.Standard.5.2.0/overview
    SwaggerUI:        https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.SwaggerUI/overview
    TPDM:             https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.1.1.0.PostgreSQL.Standard.5.2.0/overview
    SandboxAdmin:     https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.SandboxAdmin/overview/
    BulkLoad Console: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.BulkLoadClient.Console/overview/
    MsSql Admin:      https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Database.Admin.Standard.5.2.0/overview
    MsSql ODS:        https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.Minimal.Template.Standard.5.2.0/overview
    MsSql Security:   https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Database.Security.Standard.5.2.0/overview
    MsSql TPDM:       https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.1.1.0.Standard.5.2.0/overview

.EXAMPLE
    # Override to apply a custom image repository base name as an alternative to "edfialliance"
    ./Invoke-Build.ps1 -TagBase MyName

    # Result: creates images with tags like "MyName/ods-api-web-api:7.1.15"
#>
[CmdletBinding()]
param (
    # NuGet package version for the ODS minimal template database script (PostgreSQL minimal template).
    [Parameter()]
    [string]
    $MinimalVersion = $env:ODS_MINIMAL_VERSION,

    # NuGet package version for the ODS minimal template database script (MsSql minimal template).
    [Parameter()]
    [string]
    $MSSQL_MinimalVersion = $env:MSSQL_ODS_MINIMAL_VERSION,

    # NuGet package version for the ODS minimal template database script (PostgreSQL populated template).
    [Parameter()]
    [string]
    $PopulatedVersion = $env:ODS_POPULATED_VERSION,

    # NuGet package version for the ODS minimal template database script (MsSql populated template).
    [Parameter()]
    [string]
    $MSSQL_PopulatedVersion = $env:MSSQL_ODS_POPULATED_VERSION,

    # NuGet package version for the TPDM extension database script (PostgreSQL minimal template).
    [Parameter()]
    [string]
    $TpdmMinimalVersion = $env:TPDM_MINIMAL_VERSION,

    # NuGet package version for the TPDM extension database script (MsSql minimal template).
    [Parameter()]
    [string]
    $MSSQL_TpdmMinimalVersion = $env:MSSQL_TPDM_MINIMAL_VERSION,

    # NuGet package version for the TPDM extension database script (PostgreSQL populated template).
    [Parameter()]
    [string]
    $TpdmPopulatedVersion = $env:TPDM_POPULATED_VERSION,

    # NuGet package version for the TPDM extension database script (MsSql populated template).
    [Parameter()]
    [string]
    $MSSQL_TpdmPopulatedVersion = $env:MSSQL_TPDM_POPULATED_VERSION,

    # NuGet package version for the Admin database scripts (PostgreSQL).
    [Parameter()]
    [string]
    $AdminVersion = $env:ADMIN_VERSION,

    # NuGet package version for the Admin database scripts (MsSql).
    [Parameter()]
    [string]
    $MSSQL_AdminVersion = $env:MSSQL_ADMIN_VERSION,

    # NuGet package version for the Security database scripts (PostgreSQL).
    [Parameter()]
    [string]
    $SecurityVersion = $env:SECURITY_VERSION,

    # NuGet package version for the Security database scripts (MsSql).
    [Parameter()]
    [string]
    $MSSQL_SecurityVersion = $env:MSSQL_SECURITY_VERSION,

    # NuGet package version for the Web API binaries (configured for PostgreSQL).
    [Parameter()]
    [string]
    $ApiVersion = $env:API_VERSION,

    # NuGet package version for Ed-Fi's Swagger UI.
    [Parameter()]
    [string]
    $SwaggerVersion = $env:SWAGGER_VERSION,

    # NuGet package version for the Ed-Fi Sandbox Admin web application.
    [Parameter()]
    [string]
    $SandboxVersion = $env:SANDBOX_VERSION,

    # NuGet package version for the Ed-Fi BulkLoad Client Console application.
    [Parameter()]
    [string]
    $BulkLoadVersion = $env:BULKLOAD_VERSION,

    # Base of the tag, which is combined with the version when tagging.
    [Parameter()]
    [string]
    $TagBase = "edfialliance",

    # When true, pushes the image to Docker Hub. Must be logged in already.
    [Parameter()]
    [switch]
    $Push = $false,

    # When true, tags the image as "pre" for latest pre-release
    [Parameter()]
    [switch]
    $PreRelease = $false,

    # Major/minor version number
    [Parameter()]
    [string]
    $PackageVersion = "7.3",

    # Patch version number
    [Parameter()]
    [string]
    $Patch = "0",

    [Parameter()]
    [string]
    $StandardVersion = $env:STANDARD_VERSION,

    [Parameter()]
    [string]
    $ExtensionVersion = $env:EXTENSION_VERSION,

    [Parameter(Mandatory=$true)]
    [string]
    $ImageName,

    [Parameter(Mandatory=$true)]
    [string]
    $Path
)

$ErrorActionPreference = "Stop"


$semVer = "$PackageVersion.$Patch"
$major = $($PackageVersion -split "\.")[0]

$BuildArgs = ""

if ($ImageName -eq "ods-api-db-admin") {
  if ($Path.EndsWith("mssql")) {
    $BuildArgs = "--build-arg ADMIN_VERSION=$MSSQL_AdminVersion --build-arg SECURITY_VERSION=$MSSQL_SecurityVersion --build-arg STANDARD_VERSION=$StandardVersion"
  }
  else {
    $BuildArgs = "--build-arg ADMIN_VERSION=$AdminVersion --build-arg SECURITY_VERSION=$SecurityVersion --build-arg STANDARD_VERSION=$StandardVersion"
  }
}
elseif ($ImageName -eq "ods-api-db-ods-minimal") {
  if ($Path.EndsWith("mssql")) {
    $BuildArgs = "--build-arg ODS_VERSION=$MSSQL_MinimalVersion --build-arg TPDM_VERSION=$MSSQL_TpdmMinimalVersion --build-arg STANDARD_VERSION=$StandardVersion --build-arg EXTENSION_VERSION=$ExtensionVersion"  
  }
  else {
    $BuildArgs = "--build-arg ODS_VERSION=$MinimalVersion --build-arg TPDM_VERSION=$TpdmMinimalVersion --build-arg STANDARD_VERSION=$StandardVersion --build-arg EXTENSION_VERSION=$ExtensionVersion"
  }
}
elseif ($ImageName -eq "ods-api-db-ods-sandbox") {
  if ($Path.EndsWith("mssql")) {
    $BuildArgs = "--build-arg ODS_MINIMAL_VERSION=$MSSQL_MinimalVersion --build-arg ODS_POPULATED_VERSION=$MSSQL_PopulatedVersion --build-arg TPDM_MINIMAL_VERSION=$MSSQL_TpdmMinimalVersion --build-arg TPDM_POPULATED_VERSION=$MSSQL_TpdmPopulatedVersion --build-arg STANDARD_VERSION=$StandardVersion --build-arg EXTENSION_VERSION=$ExtensionVersion"  
  }
  else {
    $BuildArgs = "--build-arg ODS_MINIMAL_VERSION=$MinimalVersion --build-arg ODS_POPULATED_VERSION=$PopulatedVersion --build-arg TPDM_MINIMAL_VERSION=$TpdmMinimalVersion --build-arg TPDM_POPULATED_VERSION=$TpdmPopulatedVersion --build-arg STANDARD_VERSION=$StandardVersion --build-arg EXTENSION_VERSION=$ExtensionVersion"
  }
}
elseif ($ImageName -eq "ods-api-web-api") {
  $BuildArgs = "--build-arg API_VERSION=$ApiVersion --build-arg STANDARD_VERSION=$StandardVersion"
}
elseif ($ImageName -eq "ods-api-swaggerui") {
  $BuildArgs = "--build-arg SWAGGER_VERSION=$SwaggerVersion"
}
elseif ($ImageName -eq "ods-api-web-sandbox-admin") {
  $BuildArgs = "--build-arg SANDBOX_VERSION=$SandboxVersion"
}
elseif ($ImageName -eq "ods-api-bulk-load-console") {
  $BuildArgs = "--build-arg BULKLOAD_VERSION=$BulkLoadVersion"
}

function Write-Message {
    param(
        [Parameter(Mandatory=$true)]
        $Message
    )

    $default = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = "Yellow"
    Write-Output "$Message ---->"
    $host.UI.RawUI.ForegroundColor = $default
}

function Invoke-Build {
    $mssql = ""
    if ($Path.EndsWith("mssql")) {
        $mssql = "-mssql"
    }

    $stdVer = "-$StandardVersion"
    if ($env:CURRENT_STANDARD_VERSION -eq $StandardVersion) {
        $stdVer = ""
    }

    # Building the images from a branch different than `main` (like `b-v7.3-patch1`), will add the package version suffix to the pre tag
    $preTag = "pre"
    if ($env:BASE_BRANCH -ne 'main') {
      $preTag = $preTag+"-"+$PackageVersion.Replace(".", "")
    }

    Write-Message "Building $ImageName with $BuildArgs"
    Push-Location $ImageName/$Path
    # Full semantic version
    Invoke-Expression "docker build -t edfialliance/$($ImageName):$semVer-$StandardVersion$mssql $BuildArgs ."
    if ($LASTEXITCODE -gt 0) {
        Write-Error "Failed to build image $ImageName"
    }
    # Major / minor version
    &docker tag edfialliance/$($ImageName):$semVer-$StandardVersion$mssql edfialliance/$($ImageName):$PackageVersion$stdVer$mssql
    # Major version
    &docker tag edfialliance/$($ImageName):$semVer-$StandardVersion$mssql edfialliance/$($ImageName):$major$stdVer$mssql
    # Pre-release
    &docker tag edfialliance/$($ImageName):$semVer-$StandardVersion$mssql edfialliance/$($ImageName):$preTag$stdVer$mssql

    if ($Push) {
        Write-Message "Pushing $ImageName"
        if ($PreRelease) { 
            &docker push edfialliance/$($ImageName):$preTag$stdVer$mssql
        }
        else {
            &docker push edfialliance/$($ImageName):$semVer-$StandardVersion$mssql
            &docker push edfialliance/$($ImageName):$PackageVersion$stdVer$mssql
            &docker push edfialliance/$($ImageName):$major$stdVer$mssql
        }
    }
    Pop-Location
}

Invoke-Build
