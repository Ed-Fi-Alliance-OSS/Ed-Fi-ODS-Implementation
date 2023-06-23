# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# This script will startup a local ODS/API environment using local images built
# from NuGet packages. This process includes provisioning of a self-signed
# development certificate and of an initial key and secret with the "Ed-Fi
# Sandbox" claimset.

if (-not (Test-Path ./gateway/ssl/server.crt)) {
    Push-Location gateway
    ./generate-cert.ps1
    Pop-Location
}

docker compose -f .\docker-compose-sharedinstance.yml build `
 --build-arg ADMIN_VERSION=7.0.98 `
 --build-arg SECURITY_VERSION=7.0.78 `
 --build-arg ODS_VERSION=7.0.656 `
 --build-arg TPDM_VERSION=7.0.573 `
 --build-arg API_VERSION=7.0.1596 `
 --build-arg SWAGGER_VERSION=7.0.1994

docker compose  -f .\docker-compose-sharedinstance.yml up -d

Start-Sleep -Seconds 10

# Create bootstrapped key and secret: populatedSandbox, populatedSandboxSecret
docker cp ./bootstrap-client.sql ed-fi-db-admin:/tmp/bootstrap-client.sql
docker exec -i ed-fi-db-admin sh -c "psql -U postgres -d EdFi_Admin -f /tmp/bootstrap-client.sql"
docker exec -i ed-fi-db-admin sh -c "rm /tmp/bootstrap-client.sql"
