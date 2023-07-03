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

export POPULATED_BACKUP=EdFi_Ods_Populated_Template.sql

if [[ "$TPDM_ENABLED" = true ]]; then
  export POPULATED_BACKUP=EdFi_Ods_Populated_Template_TPDM_Core.sql
fi

psql --username "$POSTGRES_USER" --port $POSTGRES_PORT --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE "EdFi_Ods" TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Ods" TO $POSTGRES_USER;
EOSQL

echo "Loading Populated Template Database from backup..."
psql --no-password --username "$POSTGRES_USER" --port $POSTGRES_PORT --dbname "EdFi_Ods" --file /tmp/${POPULATED_BACKUP} 1> /dev/null
