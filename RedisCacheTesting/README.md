# Ed-Fi Redis and Redis-Commander Docker Compose
Docker compose file that creates a Redis and Redis-Commander environments for testing Redis support

## Images

The compose file creates and runs the following images:
* redis (latest)
    * Port: 6379
    * Named: redis
* redis-commander (latest)
    * Port: 8081

## Configuration
The top level port mappings are in the docker-compose.yml.


## Running Docker-Compose
To bring up the environment:

`cd [repository root]\Ed-Fi-ODS-Implementation\RedisCacheTesting`

`docker-compose up -d`

This command will install the images and run them in detached mode.

To bring the environment down:

`docker-compose down`

This will stop the services and remove them.

## Running the apps
Launch your local instance of redis-commander, by default at [http://localhost:8081](http://localhost:8081/), to view the current state of redis.

Configure local dev Ed-Fi API development environment to use redis for external caching.

In appsettings.json, update the caching section similar to the following:
```
"Caching": {
    "ExternalCacheProvider": "Redis",
    "Redis":{
        "Configuration": "localhost",    
        "Password": "",
    },
    "SQLServer":{
        "ConnectionString": "",    
        "SchemaName": "",
        "TableName": "",
    },
    "Descriptors": {
        "UseExternalCache": true,
        "AbsoluteExpirationSeconds": 1800
    },
    "PersonUniqueIdToUsi": {
        "UseExternalCache": true,
        "AbsoluteExpirationSeconds": 0,
        "SlidingExpirationSeconds": 14400,
        "SuppressStudentCache": false,
        "SuppressStaffCache": false,
        "SuppressParentCache": false
    },
    "ApiClientDetails":{
        "UseExternalCache": true
    },
    "Security": {
        "AbsoluteExpirationMinutes": 10
    }
}
```