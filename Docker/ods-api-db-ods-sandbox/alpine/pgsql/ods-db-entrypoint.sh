#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# The base image entrypoint initializes the cluster but does not process
# /docker-entrypoint-initdb.d. This wrapper adds that step, in the same way as
# the official PostgreSQL image: on first start only, against a temporary
# server that listens on the unix socket only, in sorted order, running *.sh
# and *.sql files.

set -Eeo pipefail

BASE_ENTRYPOINT="/usr/local/bin/docker-entrypoint.sh"
INITDB_DIR="/docker-entrypoint-initdb.d"

# Accept the command forms used with the previous image:
# "docker-entrypoint.sh postgres [options]", "postgres [options]" and "[options]".
if [ "${1:-}" = "docker-entrypoint.sh" ]; then
  shift
fi
if [ "${1:-}" = "postgres" ]; then
  shift
fi

# Anything else that is not a postgres option is a command to run as is.
if [ "$#" -gt 0 ] && [ "${1:0:1}" != "-" ]; then
  exec "$@"
fi

if [ -s "$PGDATA/PG_VERSION" ]; then
  exec "$BASE_ENTRYPOINT" "$@"
fi

# Sets the variable from its *_FILE counterpart when only the file is given,
# so that the init scripts see the same values as the base entrypoint.
file_env() {
  local var="$1"
  local file_var="${var}_FILE"
  local default="${2:-}"
  local value="$default"

  if [ -n "${!var:-}" ]; then
    value="${!var}"
  elif [ -n "${!file_var:-}" ]; then
    value="$(< "${!file_var}")"
  fi

  export "$var"="$value"
  unset "$file_var"
}

process_init_files() {
  local f

  file_env 'POSTGRES_USER' 'postgres'
  file_env 'POSTGRES_PASSWORD'
  file_env 'POSTGRES_DB' "$POSTGRES_USER"

  for f in "$INITDB_DIR"/*; do
    case "$f" in
      *.sh)
        if [ -x "$f" ]; then
          echo "ENTRYPOINT: running $f"
          "$f"
        else
          echo "ENTRYPOINT: sourcing $f"
          # shellcheck disable=SC1090
          . "$f"
        fi
        ;;
      *.sql)
        echo "ENTRYPOINT: running $f"
        psql -v ON_ERROR_STOP=1 --no-psqlrc --no-password --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" --file "$f"
        ;;
      *)
        if [ -e "$f" ]; then
          echo "ENTRYPOINT: ignoring $f"
        fi
        ;;
    esac
  done
}

stop_temporary_server() {
  if kill -0 "$postgres_pid" 2> /dev/null; then
    pg_ctl -D "$PGDATA" -m fast -w stop > /dev/null 2>&1 || kill -INT "$postgres_pid" 2> /dev/null || true
  fi
  wait "$postgres_pid" 2> /dev/null || true
}

# The base entrypoint creates the cluster and then replaces itself with the
# server, so $postgres_pid becomes the server process id.
"$BASE_ENTRYPOINT" "$@" -c listen_addresses='' &
postgres_pid=$!

trap 'stop_temporary_server; exit 130' INT
trap 'stop_temporary_server; exit 143' TERM

# The base entrypoint can start and stop a server of its own to create
# POSTGRES_DB, so wait for the one that runs as $postgres_pid.
ready_user="$(file_env 'POSTGRES_USER' 'postgres'; echo "$POSTGRES_USER")"
server_pid=""
until [ "$server_pid" = "$postgres_pid" ] && pg_isready --quiet --username "$ready_user" --dbname postgres; do
  if ! kill -0 "$postgres_pid" 2> /dev/null; then
    wait "$postgres_pid"
    exit $?
  fi
  sleep 1
  server_pid=""
  if [ -s "$PGDATA/postmaster.pid" ]; then
    read -r server_pid < "$PGDATA/postmaster.pid" || true
  fi
done

# Not combined with "||": that would switch off "set -e" inside the subshell.
set +e
( set -e; process_init_files )
init_status=$?
set -e

stop_temporary_server
trap - INT TERM

if [ "$init_status" -ne 0 ]; then
  echo "ENTRYPOINT: database initialization failed" >&2
  exit "$init_status"
fi

echo "ENTRYPOINT: database initialization complete"
exec "$BASE_ENTRYPOINT" "$@"
