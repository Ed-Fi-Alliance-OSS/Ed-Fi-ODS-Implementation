# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# This script will startup a local ODS/API environment in a single tenant mode,
# using local images built from NuGet packages. This process includes
# provisioning of a self-signed development certificate and of an initial key
# and secret with the "Ed-Fi Sandbox" claimset.

param(
    [switch]
    $Hub
)

$ErrorActionPreference = "Stop"

$template = "shared"
if ($Hub) {
    $template = "hub"
}
else {
  ./get-versions.ps1 -StandardVersion 5.0.0 -ExtensionVersion 1.1.0 -PreRelease
}

docker compose -f ./docker-compose-$template.yml build `
 --build-arg ADMIN_VERSION=$env:ADMIN_VERSION `
 --build-arg SECURITY_VERSION=$env:SECURITY_VERSION `
 --build-arg ODS_VERSION=$env:ODS_MINIMAL_VERSION `
 --build-arg TPDM_VERSION=$env:TPDM_MINIMAL_VERSION `
 --build-arg API_VERSION=$env:API_VERSION `
 --build-arg SWAGGER_VERSION=$env:SWAGGER_VERSION

docker compose  -f ./docker-compose-$template.yml up -d

Start-Sleep -Seconds 10

# Create bootstrapped key and secret: minimalKey / minimalSecret
docker cp ./bootstrap.sql ed-fi-db-admin:/tmp/bootstrap.sql
docker exec -i ed-fi-db-admin sh -c "psql -U postgres -d EdFi_Admin -f /tmp/bootstrap.sql"
docker exec -i ed-fi-db-admin sh -c "rm /tmp/bootstrap.sql"
