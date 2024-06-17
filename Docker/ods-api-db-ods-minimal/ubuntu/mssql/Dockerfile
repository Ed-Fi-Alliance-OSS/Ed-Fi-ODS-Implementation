# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM mcr.microsoft.com/mssql/server:2022-CU13-ubuntu-22.04@sha256:c4369c38385eba011c10906dc8892425831275bb035d5ce69656da8e29de50d8 AS base
USER root
RUN apt update && \
    apt upgrade -y && \
    apt install unzip dos2unix &&\
    # These steps are needed in order to mount the database to a host volume
    mkdir -p /var/opt/mssql/data &&\
    chown -R mssql: /var/opt/mssql/data

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG ODS_VERSION
ARG TPDM_VERSION
ARG STANDARD_VERSION
ARG EXTENSION_VERSION

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV MSSQL_PID=Express

ENV ODS_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.Standard.${STANDARD_VERSION}/versions/${ODS_VERSION}/content
ENV TPDM_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.${EXTENSION_VERSION}.Standard.${STANDARD_VERSION}/versions/${TPDM_VERSION}/content

WORKDIR /app

RUN umask 0077 && \
    mkdir backups && \
    # Download and extract Minimal Template for core Ed-Fi Data Model
    wget -q -O ./backups/OdsMinimalDatabase.zip ${ODS_URL} && \
    unzip -p ./backups/OdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.bak > ./backups/EdFi_Ods_Minimal_Template.bak && \
    # Download and extract Minimal Template for Teacher Prep Data Model (TPDM)
    wget -q -O ./backups/TPDMOdsMinimalDatabase.zip ${TPDM_URL} && \
    unzip -p ./backups/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.bak > ./backups/EdFi_Ods_Minimal_Template_TPDM_Core.bak && \
    rm -f ./backups/*.zip && \
    apt --purge autoremove unzip -y

COPY --chmod=500 *.sh .

RUN umask 0077 && \
    dos2unix *.sh && \
    chown -R mssql . && \ 
    apt --purge autoremove dos2unix -y

EXPOSE 1433
USER mssql
ENTRYPOINT ["/app/init.sh"]
