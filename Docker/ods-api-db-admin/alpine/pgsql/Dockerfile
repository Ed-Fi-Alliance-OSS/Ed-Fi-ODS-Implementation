# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM postgres:13.14-alpine3.19@sha256:ea5b664eb639d102308540f11625bc06bbd42e1f386d8b71696a580219ebc6c2 AS base
RUN apk --no-cache add unzip=~6 dos2unix=~7

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG ADMIN_VERSION
ARG SECURITY_VERSION
ARG STANDARD_VERSION
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=postgres
ENV ADMIN_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Admin.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ADMIN_VERSION}/content
ENV SECURITY_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Security.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${SECURITY_VERSION}/content

COPY init-database.sh /docker-entrypoint-initdb.d/1-init-database.sh

RUN set +e && \
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
