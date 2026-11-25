# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Preparation stage: the runtime image has no package manager or download tools
FROM alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf AS prep
ARG ADMIN_VERSION
ARG SECURITY_VERSION
ARG STANDARD_VERSION
ARG ADMIN_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Admin.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${ADMIN_VERSION}/content
ARG SECURITY_URL=https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Security.PostgreSQL.Standard.${STANDARD_VERSION}/versions/${SECURITY_VERSION}/content

WORKDIR /prep
COPY init-database.sh ods-db-entrypoint.sh ./

RUN mkdir pgdata sql && \
    wget -q -O /tmp/EdFi_Admin.zip "${ADMIN_URL}" && \
    wget -q -O /tmp/EdFi_Security.zip "${SECURITY_URL}" && \
    unzip -p /tmp/EdFi_Admin.zip EdFi_Admin.sql > sql/EdFi_Admin.sql && \
    unzip -p /tmp/EdFi_Security.zip EdFi_Security.sql > sql/EdFi_Security.sql && \
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
COPY --from=prep --chmod=755 /prep/init-database.sh /docker-entrypoint-initdb.d/1-init-database.sh
COPY --from=prep --chmod=644 /prep/sql/ /tmp/

VOLUME /var/lib/postgresql/data

EXPOSE 5432
USER postgres
ENTRYPOINT ["/usr/local/bin/ods-db-entrypoint.sh"]
CMD ["postgres"]
