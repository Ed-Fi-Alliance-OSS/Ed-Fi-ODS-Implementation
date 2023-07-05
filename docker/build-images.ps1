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

# Note: "gateway" is for local testing only and therefore should not be included in this script.

$semVer = "$PackageVersion.$Patch"

Write-Message "Building ods-api-db-admin"
Push-Location ods-api-db-admin/alpine/pgsql
&docker build -t edfialliance/ods-api-db-admin:$AdminVersion --build-arg ADMIN_VERSION=$AdminVersion .
&docker push edfialliance/ods-api-db-admin:$AdminVersion
&docker push edfialliance/ods-api-db-admin:$semVer
if ($PreRelease) { &docker push edfialliance/ods-api-db-admin:pre }
Pop-Location

# Write-Message "Building ods-api-db-ods-minimal"
# Push-Location ods-api-db-ods-minimal/alpine/pgsql
# &docker build -t edfialliance/ods-api-db-ods-minimal:$MinimalVersion --build-arg ODS_VERSION=$MinimalVersion `
#     --build-arg TPDM_VERSION=$TpdmMinimalVersion .
# &docker push edfialliance/ods-api-db-ods-minimal:$MinimalVersion
# &docker push edfialliance/ods-api-db-ods-minimal:$semVer
# if ($PreRelease) { &docker push edfialliance/ods-api-db-ods-minimal:pre }
# Pop-Location

# Write-Message "Building ods-api-db-ods-populated"
# Push-Location ods-api-db-ods-populated/alpine/pgsql
# &docker build -t edfialliance/ods-api-db-ods-populated:$PopulatedVersion --build-arg ODS_VERSION=$PopulatedVersion `
#     --build-arg TPDM_VERSION=$TpdmPopulatedVersion .
# &docker push edfialliance/ods-api-db-ods-populated:$PopulatedVersion
# &docker push edfialliance/ods-api-db-ods-populated:$semVer
# if ($PreRelease) { &docker push edfialliance/ods-api-db-ods-populated:pre }
# Pop-Location

# Write-Message "Building ods-api-web-api"
# Push-Location ods-api-web-api/alpine/pgsql
# &docker build -t edfialliance/ods-api-db-web-api:$ApiVersion --build-arg API_VERSION=$ApiVersion .
# &docker push edfialliance/ods-api-db-web-api:$AdminVApiVersion
# &docker push edfialliance/ods-api-db-web-api:$seVer
# if ($PreRelease) { &docker push edfialliance/ods-api-db-web-api:pre }
# Pop-Location

# Write-Message "Building ods-api-swaggerui"
# Push-Location ods-api-swaggerui/alpine
# &docker build -t edfialliance/ods-api-swaggerui:$SwaggerVersion --build-arg SWAGGER_VERSION=$SwaggerVersion .
# &docker push edfialliance/ods-api-swaggerui:$SwaggerVersion
# &docker push edfialliance/ods-api-swaggerui:$semVer
# if ($PreRelease) { &docker push edfialliance/ods-api-swaggerui:pre }
# Pop-Location