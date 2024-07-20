# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM postgres:13.15-alpine3.19@sha256:a89b1b26f0df1a85ef3a7e8e88b22df253d9bed12e1d3a672737584317e0c620 AS base
RUN apk --upgrade --no-cache add unzip=~6 dos2unix=~7 busybox=~1.36 openssl=~3 libxml2=~2

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG ADMIN_VERSION
ARG SECURITY_VERSION
ARG STANDARD_VERSION
ARG ADMIN_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Admin.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ADMIN_VERSION}/content
ARG SECURITY_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Security.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${SECURITY_VERSION}/content

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=postgres

COPY init-database.sh /docker-entrypoint-initdb.d/1-init-database.sh

RUN \
    wget -q -O /tmp/EdFi_Admin.zip ${ADMIN_URL} && \
    wget -q -O /tmp/EdFi_Security.zip ${SECURITY_URL} && \
    unzip -p /tmp/EdFi_Admin.zip EdFi_Admin.sql > /tmp/EdFi_Admin.sql && \
    unzip -p /tmp/EdFi_Security.zip EdFi_Security.sql > /tmp/EdFi_Security.sql && \
    rm -f /tmp/*.zip && \
    dos2unix /docker-entrypoint-initdb.d/1-init-database.sh && \
    dos2unix /tmp/EdFi_Admin.sql && \
    dos2unix /tmp/EdFi_Security.sql && \
    apk del unzip dos2unix

EXPOSE 5432
USER postgres
CMD ["docker-entrypoint.sh", "postgres"]
