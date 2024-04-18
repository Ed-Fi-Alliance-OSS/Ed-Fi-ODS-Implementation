# Instructions

These files are useful for starting a local PostgreSQL development environment.
The PowerShell scripts `start.ps` and `stop.ps` are for convenience, but are not
required.

You must create a `pgpass.conf` file in this directory containing the same
password that is used when starting postgresql. The default value in
[docker-compose.yml](./docker-compose.yml) results in the following contents for
the `pgpass.conf` file:

```none
localhost:5432:*:postgres:P@ssw0rd
```

You can use an alternate password by creating a `.env` file. Can override the
follwing values in that environment file:

* `POSTGRES_USER`
* `POSTGRES_PASSWORD`
* `POSTGRES_PORT`
* 