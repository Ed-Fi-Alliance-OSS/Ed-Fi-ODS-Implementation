# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM postgres:13.22-alpine3.22@sha256:61fffbe6ea476854da052e66f3cb09bdedbd9e86943b4c28bd8d80220b976d80 AS base
RUN apk --no-cache add unzip=~6 dos2unix=~7

# Workaround to fix false positive CVEs using gosu
FROM golang:1.24 AS gosubuilder
ENV GOSU_VERSION=1.19
WORKDIR /go/src/github.com/tianon
RUN git clone https://github.com/tianon/gosu.git --branch $GOSU_VERSION
WORKDIR /go/src/github.com/tianon/gosu
RUN go mod download; go build

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG ODS_VERSION
ARG TPDM_VERSION
ARG STANDARD_VERSION
ARG EXTENSION_VERSION

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=postgres

# Override provided gosu with the one built from source with updated go version
COPY --from=gosubuilder /go/src/github.com/tianon/gosu/gosu /usr/local/bin/gosu

COPY init-database.sh /docker-entrypoint-initdb.d/init-database.sh

RUN \
    # Download and extract Minimal Template for core Ed-Fi Data Model
    wget -q -O /tmp/OdsMinimalDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ODS_VERSION}/content && \
    unzip -p /tmp/OdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.sql > /tmp/EdFi_Ods_Minimal_Template.sql && \
    # Download and extract Minimal Template for Teacher Prep Data Model (TPDM)
    wget -q -O /tmp/TPDMOdsMinimalDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.${EXTENSION_VERSION}.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${TPDM_VERSION}/content && \
    unzip -p /tmp/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.sql > /tmp/EdFi_Ods_Minimal_Template_TPDM_Core.sql && \
    rm -f /tmp/*.zip && \
    dos2unix /docker-entrypoint-initdb.d/init-database.sh && \
    dos2unix /tmp/*.sql && \
    apk del unzip dos2unix

EXPOSE 5432

CMD ["docker-entrypoint.sh", "postgres"]
