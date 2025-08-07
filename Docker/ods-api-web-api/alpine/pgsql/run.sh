#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

set -e
set +x

is_semver_gte() {
  local version1="$1"
  local version2="$2"

  # Returns success if version1 is greater than or equal to version2 using version sort.
  # Compares two semantic version strings and determines if the first is greater than or equal to the second.
  [ "$(printf '%s\n%s\n' "$version1" "$version2" | sort -V | head -n1)" = "$version2" ]
}

if [[ "$TPDM_ENABLED" != "true" ]] || $(is_semver_gte "$STANDARD_VERSION" "6.0.0"); then
    export Plugin__Folder="./Plugin_Disabled"
fi

envsubst < /app/appsettings.template.json > /app/appsettings.json

if [[ -z "$ODS_WAIT_POSTGRES_HOSTS" ]]; then
  # if there are no hosts to wait then fallback to $ODS_POSTGRES_HOST
  export ODS_WAIT_POSTGRES_HOSTS=$ODS_POSTGRES_HOST
fi

export ODS_WAIT_POSTGRES_HOSTS_ARR=($ODS_WAIT_POSTGRES_HOSTS)
for HOST in ${ODS_WAIT_POSTGRES_HOSTS_ARR[@]}
do
  until PGPASSWORD=$POSTGRES_PASSWORD \
      PGHOST=$HOST \
      PGPORT=$POSTGRES_PORT \
      PGUSER=$POSTGRES_USER \
      pg_isready -d "$POSTGRES_DB" > /dev/null
  do
    >&2 echo "Postgres '$HOST' is unavailable - sleeping"
    sleep 10
  done
  >&2 echo "Postgres '$HOST' is up"
done

>&2 echo "All Postgres hosts are up - executing command"
exec $cmd

dotnet EdFi.Ods.WebApi.dll
