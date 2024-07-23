# Instructions

These files are useful for starting a local PostgreSQL development environment.
The PowerShell scripts `start.ps` and `stop.ps` are for convenience, but are not
required.

You must create a `.env` file in this directory containing the username and password to be used when starting postgresql. 

You can specify the following values in the `.env` file:

* `POSTGRES_USER`
* `POSTGRES_PASSWORD`
* `POSTGRES_PORT`

The default values in [docker-compose.yml](./docker-compose.yml) result in the following contents for the `.env` file:

```none
POSTGRES_USER=postgres
POSTGRES_PASSWORD=P@ssw0rd
POSTGRES_PORT=5432
```
