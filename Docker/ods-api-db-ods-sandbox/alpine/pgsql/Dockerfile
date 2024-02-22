# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM postgres:13.14-alpine3.19@sha256:ea5b664eb639d102308540f11625bc06bbd42e1f386d8b71696a580219ebc6c2 AS base
RUN apk --no-cache add unzip=~6 dos2unix=~7

# Start a new layer so that the above layer can be cached
FROM base AS build5
ARG ODS_MINIMAL_VERSION
ARG ODS_POPULATED_VERSION
ARG TPDM_MINIMAL_VERSION
ARG TPDM_POPULATED_VERSION
ARG STANDARD_VERSION
ARG EXTENSION_VERSION

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

COPY init-database.sh /docker-entrypoint-initdb.d/init-database.sh

RUN \
    # Download and extract Minimal and Populated Templates for core Ed-Fi Data Model
    wget -q -O /tmp/OdsPopulatedDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Populated.Template.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ODS_POPULATED_VERSION}/content && \
    unzip -p /tmp/OdsPopulatedDatabase.zip EdFi.Ods.Populated.Template.sql > /tmp/EdFi_Ods_Populated_Template.sql && \
    wget -q -O /tmp/OdsMinimalDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ODS_MINIMAL_VERSION}/content && \
    unzip -p /tmp/OdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.sql > /tmp/EdFi_Ods_Minimal_Template.sql && \
    # Download and extract Minimal and Populated Templates for Teacher Prep Data Model (TPDM)
    wget -q -O /tmp/TPDMOdsPopulatedDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Populated.Template.TPDM.Core.${EXTENSION_VERSION}.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${TPDM_POPULATED_VERSION}/content && \
    unzip -p /tmp/TPDMOdsPopulatedDatabase.zip EdFi.Ods.Populated.Template.TPDM.Core.sql > /tmp/EdFi_Ods_Populated_Template_TPDM_Core.sql && \
    wget -q -O /tmp/TPDMOdsMinimalDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.${EXTENSION_VERSION}.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${TPDM_MINIMAL_VERSION}/content && \
    unzip -p /tmp/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.sql > /tmp/EdFi_Ods_Minimal_Template_TPDM_Core.sql && \
    rm -f /tmp/*.zip && \
    dos2unix /docker-entrypoint-initdb.d/init-database.sh && \
    dos2unix /tmp/*.sql && \
    apk del unzip dos2unix

EXPOSE 5432
USER postgres
CMD ["docker-entrypoint.sh", "postgres"]

