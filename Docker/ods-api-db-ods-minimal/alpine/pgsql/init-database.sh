#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

set -e
set +x

export MINIMAL_BACKUP=EdFi_Ods_Minimal_Template.sql

if [[ "$TPDM_ENABLED" = true ]]; then
  export MINIMAL_BACKUP=EdFi_Ods_Minimal_Template_TPDM_Core.sql
fi

echo "Checking if POSTGRES_USER is set to 'postgres'..."
if [ "$POSTGRES_USER" != "postgres" ]; then
  echo "Creating postgres role..."
  psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL 1> /dev/null
    CREATE ROLE postgres WITH NOLOGIN INHERIT;
    GRANT $POSTGRES_USER TO postgres;
EOSQL
else
  echo "POSTGRES_USER is set to 'postgres'. Skipping role creation."
fi

psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL 1> /dev/null
    CREATE DATABASE "EdFi_Ods" TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Ods" TO $POSTGRES_USER;
EOSQL

echo "Loading Minimal Template Database from backup..."
psql --no-password --username "$POSTGRES_USER" --dbname "EdFi_Ods" --file /tmp/${MINIMAL_BACKUP}  1> /dev/null
