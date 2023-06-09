# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Builds all of the pgsql images and tags them for local use
push-location db-admin/alpine/pgsql
docker build . -t local/db-admin:latest
pop-location

push-location db-ods/alpine/pgsql
docker build . -t local/db-ods:latest
pop-location

push-location web-ods-api/alpine/pgsql
docker build . -t local/web-ods-api:latest
pop-location

push-location web-swaggerui/alpine
docker build . -t local/web-swaggerui:latest
pop-location