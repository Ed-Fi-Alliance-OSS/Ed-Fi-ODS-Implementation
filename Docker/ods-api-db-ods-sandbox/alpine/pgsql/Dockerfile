# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM postgres:16.4-alpine3.20@sha256:ad47523c5154f587f0be492539c76c6c3394e8a7b02f2d86f7b8b32297a862a6 AS base
RUN apk --upgrade --no-cache add unzip=~6 dos2unix=~7 busybox=~1.36 openssl~=3.3.3-r0 libxml2=~2

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG ODS_MINIMAL_VERSION
ARG ODS_POPULATED_VERSION
ARG TPDM_MINIMAL_VERSION
ARG TPDM_POPULATED_VERSION
ARG STANDARD_VERSION
ARG EXTENSION_VERSION
ARG ODS_MINIMAL_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ODS_MINIMAL_VERSION}/content
ARG ODS_POPULATED_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Populated.Template.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ODS_POPULATED_VERSION}/content
ARG TPDM_MINIMAL_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.${EXTENSION_VERSION}.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${TPDM_MINIMAL_VERSION}/content
ARG TPDM_POPULATED_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Populated.Template.TPDM.Core.${EXTENSION_VERSION}.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${TPDM_POPULATED_VERSION}/content

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV TPDM_ENABLED=true

COPY init-database.sh /docker-entrypoint-initdb.d/init-database.sh

RUN \
    # Download and extract Minimal and Populated Templates for core Ed-Fi Data Model
    wget -q -O /tmp/OdsMinimalDatabase.zip ${ODS_MINIMAL_URL} && \
    unzip -p /tmp/OdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.sql > /tmp/EdFi_Ods_Minimal_Template.sql && \
    wget -q -O /tmp/OdsPopulatedDatabase.zip ${ODS_POPULATED_URL} && \
    unzip -p /tmp/OdsPopulatedDatabase.zip EdFi.Ods.Populated.Template.sql > /tmp/EdFi_Ods_Populated_Template.sql && \
    # Download and extract Minimal and Populated Templates for Teacher Prep Data Model (TPDM)
    wget -q -O /tmp/TPDMOdsMinimalDatabase.zip ${TPDM_MINIMAL_URL} && \
    unzip -p /tmp/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.sql > /tmp/EdFi_Ods_Minimal_Template_TPDM_Core.sql && \
    wget -q -O /tmp/TPDMOdsPopulatedDatabase.zip ${TPDM_POPULATED_URL} && \
    unzip -p /tmp/TPDMOdsPopulatedDatabase.zip EdFi.Ods.Populated.Template.TPDM.Core.sql > /tmp/EdFi_Ods_Populated_Template_TPDM_Core.sql && \
    rm -f /tmp/*.zip && \
    dos2unix /docker-entrypoint-initdb.d/init-database.sh && \
    dos2unix /tmp/*.sql && \
    apk del unzip dos2unix

EXPOSE 5432
USER postgres
CMD ["docker-entrypoint.sh", "postgres"]

