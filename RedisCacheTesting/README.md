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
Launch redis-commander for viewing the state of redis

[Redis-Commander](http://localhost:8081/)

Configure local dev Ed-Fi API development environment to use external caching

[How to use an External Cache Provider for the Ed-Fi Api](https://techdocs.ed-fi.org/pages/viewpage.action?spaceKey=ODSAPIS3V60&title=How+To%3A+Use+an+External+Cache+Provider+for+the+Ed-Fi+API)
