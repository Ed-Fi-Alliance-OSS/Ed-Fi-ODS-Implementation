# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Preparation stage: the runtime image has no package manager or download tools
FROM alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf AS prep
ARG ODS_VERSION
ARG TPDM_VERSION
ARG STANDARD_VERSION
ARG EXTENSION_VERSION
ARG ODS_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ODS_VERSION}/content
ARG TPDM_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.${EXTENSION_VERSION}.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${TPDM_VERSION}/content

WORKDIR /prep
COPY init-database.sh ods-db-entrypoint.sh ./

RUN mkdir pgdata sql && \
    # Download and extract Minimal Template for core Ed-Fi Data Model
    wget -q -O /tmp/OdsMinimalDatabase.zip "${ODS_URL}" && \
    unzip -p /tmp/OdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.sql > sql/EdFi_Ods_Minimal_Template.sql && \
    # Download and extract Minimal Template for Teacher Prep Data Model (TPDM) when the data standard version is less than 6.0.0
    if [ "${STANDARD_VERSION%%.*}" -lt 6 ]; then \
        wget -q -O /tmp/TPDMOdsMinimalDatabase.zip "${TPDM_URL}" && \
        unzip -p /tmp/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.sql > sql/EdFi_Ods_Minimal_Template_TPDM_Core.sql; \
    fi && \
    rm -f /tmp/*.zip && \
    # Normalize line endings in case the files were checked out on Windows
    sed -i 's/\r$//' init-database.sh ods-db-entrypoint.sh sql/*.sql

FROM dhi.io/postgres:16.16-debian13@sha256:b5dde2a748199e346e7d59456b59931dbeef5a6b7c856e3f3586e17fff9b9239 AS build

LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

# These variables can be overwritten at runtime
ENV POSTGRES_DB=postgres

# Same data directory as the previous image, so that existing volumes and compose files keep working
ENV PGDATA=/var/lib/postgresql/data

COPY --from=prep --chown=70:70 --chmod=700 /prep/pgdata /var/lib/postgresql/data
COPY --from=prep --chmod=755 /prep/ods-db-entrypoint.sh /usr/local/bin/ods-db-entrypoint.sh
COPY --from=prep --chmod=755 /prep/init-database.sh /docker-entrypoint-initdb.d/init-database.sh
COPY --from=prep --chmod=644 /prep/sql/ /tmp/

VOLUME /var/lib/postgresql/data

EXPOSE 5432
USER postgres
ENTRYPOINT ["/usr/local/bin/ods-db-entrypoint.sh"]
CMD ["postgres"]
