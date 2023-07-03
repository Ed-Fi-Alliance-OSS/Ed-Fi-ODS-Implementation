# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Removes all local images and volumes for testing with a clean slate

&docker compose -f ./docker-compose-minimal.yml down -v
&docker compose -f ./docker-compose-populated.yml down -v

@("gateway", "ods-api-db-admin", "ods-api-db-ods-minimal", "ods-api-db-ods-populated", "ods-api-swaggerui", "ods-api-web-api") | `
    ForEach-Object { 
        &docker image rm $_
    }

