#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

set -e
set +x

if [[ -z "$POSTGRES_PORT" ]]; then
  export POSTGRES_PORT=5432
fi

echo "Creating base Admin and Security databases..."
psql --username "$POSTGRES_USER" --port $POSTGRES_PORT --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE "EdFi_Admin" TEMPLATE template0;
    CREATE DATABASE "EdFi_Security" TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Admin" TO $POSTGRES_USER;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Security" TO $POSTGRES_USER;
EOSQL

echo "Loading Security Database from backup..."
psql --no-password --username "$POSTGRES_USER" --port $POSTGRES_PORT --dbname "EdFi_Security" --file /tmp/EdFi_Security.sql 1> /dev/null

echo "Loading Admin database from backup..."
psql --no-password --username "$POSTGRES_USER" --port $POSTGRES_PORT --dbname "EdFi_Admin" --file /tmp/EdFi_Admin.sql 1> /dev/null
