#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

if [[ -n "$SQLSERVER_USER" && -n "$SQLSERVER_PASSWORD" ]]; then
  echo "Overriding SQLSERVER_ADMIN_USER..."
  export SQLSERVER_ADMIN_USER=$SQLSERVER_USER

  echo "Overriding SQLSERVER_ADMIN_PASSWORD..."
  export SQLSERVER_ADMIN_PASSWORD=$SQLSERVER_PASSWORD

  echo "Overriding SQLSERVER_ODS_USER..."
  export SQLSERVER_ODS_USER=$SQLSERVER_USER

  echo "Overriding SQLSERVER_ODS_PASSWORD..."
  export SQLSERVER_ODS_PASSWORD=$SQLSERVER_PASSWORD
fi

# Validate Admin Database User and Password
if [[ -z "$SQLSERVER_ADMIN_USER" || -z "$SQLSERVER_ADMIN_PASSWORD" ]]; then
  echo "Admin database User and Password are required."
  exit 1
fi

# Validate ODS Database User and Password
if [[ -z "$SQLSERVER_ODS_USER" && -z "$SQLSERVER_ODS_PASSWORD" ]]; then
  echo "ODS database User and Password are required."
  exit 1
fi

if [[ "$ENCRYPT_CONNECTION" == true ]]; then
    export ENCRYPT_CONNECTION=""
elif [[ "$ENCRYPT_CONNECTION" != true ]]; then
    export ENCRYPT_CONNECTION="Encrypt=false;"
fi

envsubst < /app/appsettings.template.json > /app/appsettings.json

STATUS_ODS=1
STATUS_ADMIN=1 
until [[ $STATUS_ODS -eq 0 && $STATUS_ADMIN -eq 0 ]]; do
  >&2 echo "ODS SQL Server is unavailable - sleeping"
  /opt/mssql-tools18/bin/sqlcmd -W -h -1 -l 1 -U ${SQLSERVER_USER} -P "${SQLSERVER_PASSWORD}" -S $SQLSERVER_ODS_DATASOURCE -C > /dev/null 2>&1
  STATUS_ODS=$?

  >&2 echo "ADMIN SQL Server is unavailable - sleeping"
  /opt/mssql-tools18/bin/sqlcmd -W -h -1 -l 1 -U ${SQLSERVER_USER} -P "${SQLSERVER_PASSWORD}" -S $SQLSERVER_ADMIN_DATASOURCE -C > /dev/null 2>&1
  STATUS_ADMIN=$?
  sleep 8
done

dotnet EdFi.Ods.Sandbox.Admin.dll
