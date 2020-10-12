# Ed-Fi Reverse Proxy Docker Compose
Docker compose file that creates an NGINX environment for testing Reverse Proxy support

## Images

The compose file creates and runs the following images:
* NGINX latest
  * Port: 54747 (API), 56642 (SwaggerUI), 38929 (SandboxAdmin)
  * Named: nginx

## Configuration
The top level port mappings are in the docker-compose.yml, but most of the configuration is managed in the nginx.conf file.

The nginx.conf by default sets up three servers to host API, SwaggerUI, and SandboxAdmin, each running on a port one higher than the default development port.  The server entries do a simple proxy_pass to the built in host.docker.internal in order to redirect back to the host machine, as well as setting the X-Forwarded headers necessary for reverse proxy support.

Of special note is the CORS header support for the API hosting.  This allows the SwaggerUI to communicate with the API without breaking on CORS violations.  This is a very permissive configuration, allowing any headers in or out and always returning an allow origin based on the request host.

## Running Docker-Compose
To bring up the environment:

`docker-compose up -d`

This command will install the image and run it in detached mode.

To bring the environment down:

`docker-compose down`

This will stop the services and remove them.

## Running the apps
Once the reverse proxy is running, you can then run the applications from Visual Studio.  Make sure to have run initdev prior to have all the other components setup.

Launch profiles are set up for all three apps in order to configure the appropriate settings for Reverse Proxy testing.  Specifically:
EdFi.Ods.WebApi
  Set UseReverseProxyHeaders to "true"
  Change the launch url to use the reverse proxy instead of hitting the app directly
EdFi.Ods.SwaggerUI
  Set WebApiVersionUrl to use the reverse proxy instead of hitting the API directly
  Change the launch url to use the reverse proxy instead of hitting the app directly
EdFi.Ods.SandboxAdmin
  Set OAuthUrl to use the reverse proxy instead of hitting the API directly
  Change the launch url to use the reverse proxy instead of hitting the app directly

Note that currently EdFi.Ods.SandboxAdmin doesn't fully support a reverse proxy configuration.  Most of the pages will show up, but because all the client side urls are built using a server provided home url, none of the API calls work. See https://tracker.ed-fi.org/browse/ODS-4593 for progress on adding that support.

Visual Studio 2019 does not fully support setting the launch profile when running multiple projects.  To test with these profiles, the easiest way is to go to each project, right click and select Properties, then the Debug tab, then select the Reverse Proxy profile.  Then right click the project and select Debug -> Start new instance to test.  You can repeat this for every project you want to run and verify.

If you run into issues with port binding, you may need to close IIS Express from the system tray, since IIS Express will bind on the same port for usual debugging.