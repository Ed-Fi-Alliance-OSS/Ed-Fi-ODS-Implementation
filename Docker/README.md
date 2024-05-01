# Docker for the ODS/API Platform

## Overview

This directory contains dockerfiles and related scripts, as needed, for the
official binary release images of the ODS / API platform.

As appropriate, these images are built from the same NuGet packages that are
distributed as the "binary release" of the platform. This source repository also
includes sample Docker Compose files. These are intended for end-to-end and
local testing, not for production deployments.

The [Ed-Fi-ODS-Docker](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Docker)
repository continues to hold more complex Docker Compose scripts that also
demonstrate loading tools from other repositories, and serve as a starting point
for potential production releases.

## Docker Compose Files

There are three compose files provided for local testing:

1. `docker-compose-hub.yml`: loads images that have already been published to
   Docker Hub, running in "sharedinstance" mode.
2. `docker-compose-sandbox.yml`: creates and loads local images from NuGet
   packages, running in "sandbox" mode with both the minimal (descriptors only)
   and populated (descriptors and fake sample data) templates available.
3. `docker-compose-shared.yml`: creates and loads local images from NuGet
   packages, running in "sharedinstance" (aka "single tenant, single year") mode
   with only the minimal template database containing pre-loaded descriptors.

> **Warning** these are not appropriate for production use!

These compose files expect the presence of a `.env` file. You can copy
`.env.example` and customize it for use with any of the three. The commands
below will use your `.env` file automatically; you can use an alternate file
name if you add an argument like `--env-file {filePath}` to the `docker compose
up` command.

### Credentials for Shared Instance

The two "sharedinstance" mode compose files do not have any credentials at
startup. The script [bootstrap.ps1](./bootstrap.ps1) creates a set of initial
credentials with access to all resources, using the `Ed-Fi Sandbox` claimset for
convenience. It also creates a self-signed TLS certificate.

* Key: `sampleKey`
* Secret: `sampleSecret`.

In a real production environment you would use Admin API or Admin App to create
these credentials, and of course you would want to install a real certificate.

### Targeting Standard and Extension Versions

Before running `docker compose` commands, run `get-versions.ps1`. This script takes the following optional parameters
* `StandardVersion` defaults to "5.1.0"
* `ExtensionVersion` defaults to "1.1.0"

```shell
# For example to target the 4.0.0 data standard
.\get-version.ps1 -StandardVersion "4.0.0"
```

### Example Operational Commands

Substitute the correct `docker-compose-*` filename as needed:

```shell
# (optional) Only build the images, don't start them 
docker compose -f docker-compose-minimal.yml build

# Start
docker compose -f docker-compose-minimal.yml up -d

# Stop, but do not remove containers
docker compose -f docker-compose-minimal.yml stop

# Stop and remove containers
docker compose -f docker-compose-minimal.yml down

# Stop and remove containers and volumes
docker compose -f docker-compose-minimal.yml down -v
```

### Shared Instance Network Topology

```mermaid
flowchart LR
    A(Client Application) -->|Raw API Calls| C[api]
    C --> D[(db-ods)]
    C --> E[(db-admin)]

    F(User) -->|API Testing| G[swagger]
    G --> C

    subgraph Container Network
        C
        D
        E
        G
    end
```

URL's, assuming default virtual names from `.env.example`:

* [Ed-Fi API](https://localhost/api)
* [Swagger UI](https://localhost/swagger)

### Sandbox Network Topology

```mermaid
flowchart LR
    A(Client Application) -->|Raw API Calls| C[api]
    C --> D[(db-ods-sandbox)]
    C --> E[(db-admin)]
    H --> D
    H --> E
    G --> C

    F(User) -->|API Testing| G[swagger]
    F -->|Credential Mgmt| H[sandbox]

    subgraph Container Network
        C
        D
        E
        G
        H
    end
```

URL's, assuming default virtual names from `.env.example`:

* [Ed-Fi API](https://localhost/api)
* [Swagger UI](https://localhost/swagger)
* [Sandbox Admin](https://localhost/sandbox)