# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM mcr.microsoft.com/dotnet/aspnet:8.0.10-alpine3.20@sha256:09bd97b2f28a084168e6d4e2f1c32385753cd7166c8d87af71a0dba2919d7aa2 AS base
RUN apk --upgrade --no-cache add unzip=~6 dos2unix=~7 bash=~5 gettext=~0 icu=~74 curl=~8 busybox=~1.36 && \
    addgroup -S edfi && adduser -S edfi -G edfi

# Start a new layer so that the above layer can be cached
FROM base AS build
RUN apk --upgrade --no-cache add postgresql16-client=~16.9
ARG SANDBOX_VERSION
ARG SANDBOX_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.SandboxAdmin/versions/${SANDBOX_VERSION}/content

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=postgres
ENV POSTGRES_PORT=5432
ENV ODS_VIRTUAL_NAME=api
ENV PATH_BASE=sandbox
ENV OAUTH_URL="https://localhost/${ODS_VIRTUAL_NAME}/oauth/"
ENV NPG_POOLING_ENABLED=false

# Alpine image does not contain Globalization Cultures library so we need to
# install ICU library to get fopr LINQ expression to work Disable the
# globaliztion invariant mode (set in base image)
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR /app
COPY --chmod=600 appsettings.template.json /app/appsettings.template.json
COPY --chmod=500 run.sh /app/run.sh
COPY log4net.config /app/log4net.txt

RUN umask 0077 && \
    wget -q -O /app/SandboxAdmin.zip ${SANDBOX_URL} && \
    unzip /app/SandboxAdmin.zip -d /app && \
    rm -f /app/SandboxAdmin.zip && \
    cp /app/log4net.txt /app/log4net.config && \
    rm -f /app/log4net.txt && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    rm -f /app/*.exe && \
    apk del unzip dos2unix curl && \
    chown -R edfi /app

ENV ASPNETCORE_HTTP_PORTS=80
EXPOSE 80
USER edfi
ENTRYPOINT ["/app/run.sh"]
