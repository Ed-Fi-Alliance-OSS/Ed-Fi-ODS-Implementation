# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# This script will startup a local ODS/API environment in a single tenant mode,
# using local images built from NuGet packages. This process includes
# provisioning of a self-signed development certificate and of an initial key
# and secret with the "Ed-Fi Sandbox" claimset.

param(
    [string]
    [ValidateSet("minimal", "populated")]
    $Template = "minimal"
)

if (-not (Test-Path ./gateway/ssl/server.crt)) {
    Push-Location gateway
    ./generate-cert.ps1
    Pop-Location
}

$odsVersion = "7.0.847"
$tpdmVersion = "7.0.701"
if ($Template -eq "populated") {
    $odsVersion = "7.0.827"
    $tpdmVersion = "7.0.665"
}

docker compose -f .\docker-compose-$Template.yml build `
 --build-arg ADMIN_VERSION=7.0.252 `
 --build-arg SECURITY_VERSION=7.0.233 `
 --build-arg ODS_VERSION=$odsVersion `
 --build-arg TPDM_VERSION=$tpdmVersion `
 --build-arg API_VERSION=7.0.1994 `
 --build-arg SWAGGER_VERSION=7.0.1994

docker compose  -f .\docker-compose-$Template.yml up -d

Start-Sleep -Seconds 10

# Create bootstrapped key and secret: minimalKey / minimalSecret
docker cp ./bootstrap.sql ed-fi-db-admin:/tmp/bootstrap.sql
docker exec -i ed-fi-db-admin sh -c "psql -U postgres -d EdFi_Admin -f /tmp/bootstrap.sql"
docker exec -i ed-fi-db-admin sh -c "rm /tmp/bootstrap.sql"
