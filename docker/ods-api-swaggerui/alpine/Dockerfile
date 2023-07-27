# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Base image with additional packages
FROM mcr.microsoft.com/dotnet/aspnet:6.0.16-alpine3.17-amd64@sha256:dabdf423e179383d848889b760a4258a5950b224730762bf39bfd51de344cfa3 AS base
RUN apk --no-cache add unzip=~6 dos2unix=~7 bash=~5 gettext=~0 icu=~72 curl=~8

# Start a new layer so that the above layer can be cached
FROM base AS build
ARG SWAGGER_VERSION=7.0.1994
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV DOCS_VIRTUAL_NAME=docs
ENV ODS_VIRTUAL_NAME=api
ENV WebApiVersionUrl="https://localhost/${ODS_VIRTUAL_NAME}/"
ENV UseReverseProxyHeaders=true
ENV PathBase="${DOCS_VIRTUAL_NAME}"

# Alpine image does not contain Globalization Cultures library so we need to
# install ICU library to get LINQ expression to work and disable the
# globaliztion invariant mode, which is set in the base image.
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR /app
COPY appsettings.template.json /app/appsettings.template.json
COPY run.sh /app/run.sh

RUN wget -q -O /app/SwaggerUI.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.SwaggerUI/versions/${SWAGGER_VERSION}/content && \
    unzip /app/SwaggerUI.zip -d /app && \
    rm -f /app/SwaggerUI.zip && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    chmod 700 /app/run.sh && \
    rm -f /app/*.exe && \
    apk del unzip dos2unix

EXPOSE 80

ENTRYPOINT ["/app/run.sh"]
