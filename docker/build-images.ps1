# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

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
    # NuGet package version for the Admin database scripts (PostgreSQL).
    [Parameter()]
    [string]
    $AdminVersion = "7.0.98",

    # NuGet package version for the Web API binaries (configured for PostgreSQL).
    [Parameter()]
    [string]
    $ApiVersion = "7.0.1596",

    # NuGet package version for the ODS minimal template database script (PostgreSQL).
    [Parameter()]
    [string]
    $OdsVersion = "7.0.656",

    # NuGet package version for the Security database scripts (PostgreSQL).
    [Parameter()]
    [string]
    $SecurityVersion = "7.0.78",

    # NuGet package version for Ed-Fi's Swagger UI.
    [Parameter()]
    [string]
    $SwaggerVersion = "7.0.1994",

    # NuGet package version for the TPDM extension database script (PostgreSQL).
    [Parameter()]
    [string]
    $TpdmVersion = "7.0.573",

    # Base of the tag, which is combined with the version when tagging.
    [Parameter()]
    [string]
    $TagBase = "edfialliance",

    # When used, will attempt to push the image to the currently configured registry.
    [Parameter()]
    [Switch]
    $Push
)

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

Write-Message "Building ods-api-db-admin"
Push-Location ods-api-db-admin/alpine/pgsql
&docker build -t edfialliance/ods-api-db-admin:$AdminVersion --build-arg ADMIN_VERSION=$AdminVersion .
Pop-Location

Write-Message "Building ods-api-db-ods"
Push-Location ods-api-db-ods/alpine/pgsql
&docker build -t edfialliance/ods-api-db-ods:$AdminVersion --build-arg ODS_VERSION=$OdsVersion `
    --build-arg TPDM_VERSION=$TpdmVersion .
Pop-Location

Write-Message "Building ods-api-web-api"
Push-Location ods-api-web-api/alpine/pgsql
&docker build -t edfialliance/ods-api-db-web-api:$ApiVersion --build-arg API_VERSION=$ApiVersion .
Pop-Location

Write-Message "Building ods-api-swaggerui"
Push-Location ods-api-swaggerui/alpine
&docker build -t edfialliance/ods-api-swaggerui:$SwaggerVersion --build-arg SWAGGER_VERSION=$SwaggerVersion .
Pop-Location