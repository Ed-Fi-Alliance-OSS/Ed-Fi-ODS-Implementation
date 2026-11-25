# ods-api-db-ods-populated

Provides a Docker image of the Ed-Fi ODS database's "populated template",
containing a small set of sample (fake) school and student data, running on
PostgreSQL 16.

> [!WARNING]
> This image is not recommended for a production environment.

## Image Variants

The only supported image at this time is a Debian-based implementation using
the [Docker Hardened Image for PostgreSQL 16](https://hub.docker.com/hardened-images/catalog/dhi/postgres).
The folder keeps the name `alpine` from the previous base image.

`edfialliance/ods-api-db-ods-populated:<version>`

## Notes on the Base Image

- The image runs as the `postgres` user (uid 70) and stores its data in
  `/var/lib/postgresql/data`, the same as the earlier Alpine-based versions.
- Files named `*.sh` and `*.sql` in `/docker-entrypoint-initdb.d` run in name
  order the first time the image starts with an empty data directory.
- The image has no package manager and only a small set of shell tools. Images
  derived from this one cannot use `apk` or `apt`, and tools such as `wget`,
  `curl`, `ps`, `grep`, `sed` and `gosu` are not available. Prepare files in a
  separate build stage and copy them into the image.

### Upgrading a volume created with an Alpine-based version

Text values sort differently in this image than in the Alpine-based versions,
which leaves the indexes on text columns in an existing data volume out of
date. `reindexdb --all` rebuilds them in the sandbox databases but skips the two
template databases, because they do not accept connections. The simplest
option for this non-production image is to remove the volume and let the image
create it again, which also removes the existing sandbox databases.

## Supported Environment Variables

```none
POSTGRES_DB=<default PostgreSQL database> (OPTIONAL, default: postgres)
POSTGRES_USER=<default PostgreSQL database user>
POSTGRES_PASSWORD=<password for default PostgreSQL user>
TPDM_ENABLED=<true/false include TPDM tables> (OPTIONAL, default: true)
```

## Legal Information

Copyright (c) 2024 Ed-Fi Alliance, LLC and contributors.

Licensed under the [Apache License, Version
2.0]([LICENSE](https://www.apache.org/licenses/LICENSE-2.0.txt)) (the
"License").

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

### Notice about Docker base images

As with all Docker images, these likely also contain other software which may be
under other licenses (such as Bash, etc. from the base distribution, along with
any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to
ensure that any use of this image complies with any relevant licenses for all
software contained within.