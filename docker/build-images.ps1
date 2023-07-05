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
    * Pre-configured for PostgreSQL using the "minimal template".
    * See the following links to find the latest available versions of the various packages:

    Admin: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Database.Admin.PostgreSQL/overview
    Api: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.WebApi/overview
    ODS: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.Minimal.Template.PostgreSQL/overview
    Security: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Database.Security.PostgreSQL/overview
    SwaggerUI: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.SwaggerUI/overview
    TPDM: https://dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_artifacts/feed/EdFi/NuGet/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.PostgreSQL/overview
.EXAMPLE
    # Override to apply a custom image repository base name as an alternative to "edfialliance"
    ./build-images.ps1 -TagBase MyName

    # Result: creates images with tags like "MyName/ods-api-web-api:7.0.1596"
#>
[CmdletBinding()]
param (
    # NuGet package version for the ODS minimal template database script (PostgreSQL minimal template).
    [Parameter()]
    [string]
    $MinimalVersion = $env:ODS_MINIMAL_VERSION,

    # NuGet package version for the ODS minimal template database script (PostgreSQL populated template).
    [Parameter()]
    [string]
    $PopulatedVersion = $env:ODS_POPULATED_VERSION,

    # NuGet package version for the TPDM extension database script (PostgreSQL minimal template).
    [Parameter()]
    [string]
    $TpdmMinimalVersion = $env:TPDM_MINIMAL_VERSION,

    # NuGet package version for the TPDM extension database script (PostgreSQL populated template).
    [Parameter()]
    [string]
    $TpdmPopulatedVersion = $env:TPDM_POPULATED_VERSION,

    # NuGet package version for the Admin database scripts (PostgreSQL).
    [Parameter()]
    [string]
    $AdminVersion = $env:ADMIN_VERSION,

    # NuGet package version for the Security database scripts (PostgreSQL).
    [Parameter()]
    [string]
    $SecurityVersion = $env:SECURITY_VERSION,

    # NuGet package version for the Web API binaries (configured for PostgreSQL).
    [Parameter()]
    [string]
    $ApiVersion = $env:API_VERSION,

    # NuGet package version for Ed-Fi's Swagger UI.
    [Parameter()]
    [string]
    $SwaggerVersion = $env:SWAGGER_VERSION,

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
    $PackageVersion = "7.0",

    # Patch version number
    [Parameter()]
    [string]
    $Patch = "0"
)

$ErrorActionPreference = "Stop"

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
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $ImageName,

        [Parameter(Mandatory=$true)]
        [string]
        $Path,

        [Parameter(Mandatory=$true)]
        [string]
        $LocalVersion,

        [string]
        $BuildArgs
    )

    Write-Message "Building ods-api-db-admin"
    Push-Location $ImageName/$Path
    Invoke-Expression "docker build -t edfialliance/$($ImageName):$LocalVersion $BuildArgs ."

    if ($Push) {
        &docker push edfialliance/$($ImageName):$LocalVersion

        &docker tag edfialliance/$($ImageName):$LocalVersion edfialliance/$($ImageName):$semVer
        &docker push edfialliance/$($ImageName):$semVer

        if ($PreRelease) { 
            &docker tag edfialliance/$($ImageName):$LocalVersion edfialliance/$($ImageName):pre
            &docker push edfialliance/$($ImageName):pre 
        }
    }
    Pop-Location
}

# Note: "gateway" is for local testing only and therefore should not be included in this script.

$semVer = "$PackageVersion.$Patch"

Invoke-Build -ImageName ods-api-db-admin -Path alpine/pgsql -LocalVersion $AdminVersion `
    -BuildArgs "--build-arg ADMIN_VERSION=$AdminVersion"

# Invoke-Build -ImageName ods-api-db-ods-minimal -Path alpine/pgsql -LocalVersion $MinimalVersion `
#     -BuildArgs "--build-arg ODS_VERSION=$MinimalVersion --build-arg TPDM_VERSION=$TpdmMinimalVersion"

# Invoke-Build -ImageName ods-api-db-ods-populated -Path alpine/pgsql -LocalVersion $PopulatedVersion `
#     -BuildArgs "--build-arg ODS_VERSION=$PopulatedVersion --build-arg TPDM_VERSION=$TpdmPopulatedVersion"

# Invoke-Build -ImageName ods-api-web-api -Path alpine/pgsql -LocalVersion $ApiVersion `
#     -BuildArgs "--build-arg API_VERSION=$ApiVersion"

# Invoke-Build -ImageName ods-api-web-api -Path alpine/mssql -LocalVersion $ApiVersion `
#     -BuildArgs "--build-arg API_VERSION=$ApiVersion"

# Invoke-Build -ImageName ods-api-swaggerui -Path alpine -LocalVersion $SwaggerVersion `
#     -BuildArgs "--build-arg SWAGGER_VERSION=$SwaggerVersion"
