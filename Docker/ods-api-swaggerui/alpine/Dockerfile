# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM mcr.microsoft.com/dotnet/aspnet:8.0.3-alpine3.19@sha256:646b1c5ff36375f35f6149b0ce19ca095f97b4b882b90652801e9fbe82bcfa8a AS base
RUN apk --upgrade --no-cache add unzip=~6 dos2unix=~7 bash=~5 gettext=~0 icu=~74 busybox=~1.36 && \
    addgroup -S edfi && adduser -S edfi -G edfi

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG SWAGGER_VERSION
ARG SWAGGER_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.SwaggerUI/versions/${SWAGGER_VERSION}/content

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV VERSION_URL="https://localhost/api/"

# Alpine image does not contain Globalization Cultures library so we need to
# install ICU library to get LINQ expression to work and disable the
# globaliztion invariant mode, which is set in the base image.
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR /app
COPY --chmod=600 appsettings.template.json /app/appsettings.template.json
COPY --chmod=500 run.sh /app/run.sh

RUN umask 0077 && \
    wget -q -O /app/SwaggerUI.zip ${SWAGGER_URL} && \
    unzip /app/SwaggerUI.zip -d /app && \
    rm -f /app/SwaggerUI.zip && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    rm -f /app/*.exe && \
    apk del unzip dos2unix && \
    chown -R edfi /app

ENV ASPNETCORE_HTTP_PORTS=80
EXPOSE 80
USER edfi
ENTRYPOINT ["/app/run.sh"]
