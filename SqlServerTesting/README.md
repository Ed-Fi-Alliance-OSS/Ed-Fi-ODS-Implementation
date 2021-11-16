# Ed-Fi SQL Server Express Docker File
Docker file to replace the beta [Microsoft SQL Server Express Docker
file](https://github.com/microsoft/mssql-docker/tree/dc48d74b8c6e146a97ce6af41639d0d0d3499121/windows/mssql-server-windows-express)
that was
[suspended](https://techcommunity.microsoft.com/t5/sql-server/update-beta-program-for-sql-server-on-windows-container-is/ba-p/2516639)
and removed from Docker Hub.

The file downloads and installs SQL Server Express with the default setup
parameters.

### Contents

[Before you begin](#before-you-begin)<br/>
[Run this sample](#run-this-sample)<br/>
[Sample details](#sample-details)<br/>
[License Information](#license-info)<br/>

<a name=before-you-begin></a>

## Before you begin

To run this, you need the following prerequisites.

**Software prerequisites:**

You can run the container with the following command. (Note the you'll need
Windows Server 2016 or Windows 10)

````
docker run -d -p 1433:1433 -v C:/temp/:C:/temp/ -e sa_password=<YOUR SA PASSWORD> -e ACCEPT_EULA=Y -e attach_dbs="<DB-JSON-CONFIG>" edfialliance/mssql-server-windows-express
````

- **-p HostPort:containerPort** is for port-mapping a container network port to
  a host port.
- **-v HostPath:containerPath** is for mounting a folder from the host inside
  the container.

  This can be used for saving database outside of the container.

- **-it** can be used to show the verbose output of the SQL startup script.

  Use this to debug the container in case of issues.

<a name=run-this-sample></a>

## Run this sample

The image provides two environment variables to optionally set: </br>
- **accept_eula**: Confirms acceptance of the end user licensing agreement found
  [here](http://go.microsoft.com/fwlink/?LinkId=746388)
- **sa_password**: Sets the sa password and enables the sa login
- **attach_dbs**: The configuration for attaching custom DBs (.mdf, .ldf files).

  This should be a JSON string, in the following format (note the use of SINGLE
  quotes!)
  ```
  [
  {
    'dbName': 'Test1Db',
    'dbFiles': ['C:\\temp\\test1.mdf',
    'C:\\temp\\test1_log.ldf']
  },
  {
    'dbName': 'Test2Db',
    'dbFiles': ['C:\\temp\\test2.mdf',
    'C:\\temp\\test2_log.ldf']
  }
  ]
  ```

  This is an array of databases, which can have zero to N databases.

  Each consisting of:
  - **dbName**: The name of the database
  - **dbFiles**: An array of one or many absolute paths to the .MDF and .LDF
    files.

  **Note:** The path has double backslashes for escaping! The path refers to
  files **within the container**. So make sure to include them in the image or
  mount them via **-v**!


This example shows all parameters in action:
```
docker run -d -p 1433:1433 -v C:/temp/:C:/temp/ -e sa_password=<YOUR SA PASSWORD> -e ACCEPT_EULA=Y -e attach_dbs="[{'dbName':'SampleDB','dbFiles':['C:\\temp\\sampledb.mdf','C:\\temp\\sampledb_log.
ldf']}]" edfialliance/mssql-server-windows-express
```

<a name=sample-details></a>

## Sample details

The Dockerfile downloads and installs SQL Server 2016 Express with the following
default setup parameters that could be changed (if needed) after the image is
installed.
- Collation: SQL_Latin1_General_CP1_CI_AS
- SQL Instance Name: SQLEXPRESS
- Root Directory: C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL
- Language: English (United Stated)

<a name=license-info></a>

## License Information
View [license information](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Implementation/blob/main/LICENSE.txt) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc. from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.