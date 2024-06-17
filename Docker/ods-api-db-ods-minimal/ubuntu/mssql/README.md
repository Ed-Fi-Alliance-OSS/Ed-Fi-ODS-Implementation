# Ed-Fi ODS Database

Provides a Docker image of the Ed-Fi ODS database's "populated template",
containing a small set of sample (fake) school and student data, running on
PostgreSQL 13.

> **Note** 
> This image is recommended for production environments.

## Image Variants

The only supported image at this time is an Alpine-based implementation using
[PostgreSQL 13](https://hub.docker.com/_/postgres).

`edfialliance/ods-api-db-ods-minimal:<version>`

## Supported Environment Variables

```none
POSTGRES_USER=<default PostgreSQL database user>
POSTGRES_PASSWORD=<password for default PostgreSQL user>
ODS_DB=<name for the edfi database>
TPDM_ENABLED=<true/false include TPDM tables> (OPTIONAL, default: true)
```

## Legal Information

Copyright (c) 2023 Ed-Fi Alliance, LLC and contributors.

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