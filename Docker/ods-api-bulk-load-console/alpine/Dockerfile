# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# SDK image used to install dotnet tool. Runtime image do not have 'dotnet tools' installed
FROM mcr.microsoft.com/dotnet/sdk:10.0.203-alpine3.23@sha256:0191ff386e93923edf795d363ea0ae0669ce467ada4010b370644b670fa495c1 AS builder

ARG BULKLOAD_VERSION

RUN dotnet tool install -g \
    --add-source https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json \
    EdFi.Suite3.BulkLoadClient.Console --version $BULKLOAD_VERSION && \
    rm -f /root/.dotnet/tools/.store/edfi.suite3.bulkloadclient.console/$BULKLOAD_VERSION/edfi.suite3.bulkloadclient.console/$BULKLOAD_VERSION/tools/net10.0/any/log4net.config

# Smaller image
FROM mcr.microsoft.com/dotnet/runtime:10.0.7-alpine3.23@sha256:405a4e86f50ab5fd78c65bab461499913088d1702da4faf6236426653cc052c4
RUN apk --upgrade --no-cache add gettext=~0 bash=~5 && \
    addgroup -S edfi && adduser -S edfi -G edfi

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ARG BULKLOAD_VERSION
ENV ENV_BULKLOAD_VERSION=$BULKLOAD_VERSION
ENV ENV_CONSOLE_LOG_LEVEL="INFO"
ENV ENV_FILE_LOG_LEVEL="DEBUG"

# Copy global tools from the build layer 
COPY --from=builder --chown=edfi /root/.dotnet/tools/ /opt/bin

COPY log4net.template.config /tmp/log4net.template.config
COPY --chmod=500 --chown=edfi run.sh /usr/local/bin/run.sh

# Add the tool copied from the build layer to the $PATH env variable.
# This is done to call the BulkLoadClient without specifying the full path.
ENV PATH="/opt/bin:${PATH}"

RUN mkdir -p /var/bulkload/working /var/bulkload/log && \
    chown -R edfi /var/bulkload

USER edfi

ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["--help"]