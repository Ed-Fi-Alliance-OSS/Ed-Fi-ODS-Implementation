# Ed-Fi Web ODS/API

Provides docker deployment for Ed-Fi ODS/API.

> [!NOTE]
> This image is suitable for production use.

## Image Variants

The only supported image at this time is an Alpine-based implementation.

`edfialliance/ods-api-web-api:<version>`

## Supported Environment Variables

```none
API_MODE=<mode of api>
LOGS_FOLDER=<path to store the logs file>
POSTGRES_USER=<default PostgreSQL database user>
POSTGRES_PASSWORD=<password for default PostgreSQL user>
POSTGRES_PORT=<port that PostgreSQL run on> (OPTIONAL, default: 5432)
ADMIN_POSTGRES_HOST=<container-resolved name of the PostgreSQL instance containing the Admin and Security databases>
ODS_POSTGRES_HOST=<container-resolved name of the PostgreSQL instance containing the ODS database>
TPDM_ENABLED=<true/false load TPDM extension> (OPTIONAL, default: true)
ODS_WAIT_POSTGRES_HOSTS=<space-separated list of PostgreSQL hosts that should be reachable before starting the api (used by multi-server)> (OPTIONAL)
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
