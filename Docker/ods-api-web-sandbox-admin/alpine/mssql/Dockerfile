# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM mcr.microsoft.com/dotnet/aspnet:8.0.20-alpine3.22@sha256:5cf6b6cc6bb98c60e1289458184e3518e2e6bc36a3eb64418762d000c912fa8b AS base
RUN apk --no-cache add unzip=~6 dos2unix=~7 bash=~5 gettext=~0 icu=~76 && \
    addgroup -S edfi && adduser -S edfi -G edfi

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG SANDBOX_VERSION
ARG SANDBOX_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.SandboxAdmin/versions/${SANDBOX_VERSION}/content

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV PATH_BASE=admin
ENV OAUTH_URL="https://localhost/api/oauth/"
ENV ENCRYPT_CONNECTION=false

# Alpine image does not contain Globalization Cultures library so we need to
# install ICU library to get fopr LINQ expression to work Disable the
# globaliztion invariant mode (set in base image)
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR /app
COPY --chmod=600 appsettings.template.json /app/appsettings.template.json
COPY --chmod=500 run.sh /app/run.sh
COPY log4net.config /app/log4net.txt

RUN wget -q -O /app/SandboxAdmin.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.SandboxAdmin/versions/${SANDBOX_VERSION}/content && \
    unzip /app/SandboxAdmin.zip -d /app && \
    rm -f /app/SandboxAdmin.zip && \
    rm -f /app/appsettings.json && \
    cp /app/log4net.txt /app/log4net.config && \
    rm -f /app/log4net.txt && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/run.sh && \
    rm -f /app/*.exe && \
    apk del unzip dos2unix

EXPOSE 80

ENTRYPOINT ["/app/run.sh"]
