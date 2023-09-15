# This script will inject the ODS connection strings and the populatedSandbox 
# keys and secrets into the Admin database for two Tenants

<#
.DESCRIPTION
    Injects the ODS connection string and the populatedSandbox key and secret into the Admin database for a Tenant
#>
function Invoke-ConfigureOctopusTenant {
    param(
        [Parameter(Mandatory = $true)]
        [string] $TenantPopulatedSandboxKey,

        [Parameter(Mandatory = $true)]
        [string] $TenantPopulatedSandboxSecret,

        [Parameter(Mandatory = $true)]
        [string] $TenantIdentifier,

        [Parameter(Mandatory = $true)]
        [string] $TenantVendorName,

        [Parameter(Mandatory = $true)]
        [string] $TenantsJson,

        [Parameter(Mandatory = $true)]
        [string] $ConnectionString
    )

    # Replace "{0}" with the value of the tenantIdentifier variable
    $tenantODSDatabaseCS = $connectionString -f $tenantIdentifier

    Write-Host "Installing tenant configuration"
    Write-Host "TenantIdentifier: $tenantIdentifier"

    Write-Host "PrepopulatedKeyTenant: $tenantPopulatedSandboxKey"
    Write-Host "PrepopulatedSecretTenant: $tenantPopulatedSandboxSecret"

    # Convert the JSON data to a PowerShell object
    $tenants = ConvertFrom-Json $tenantsJson

    # Now you can access the individual properties of the tenants

    $tenantAdminDatabaseCS = $tenants.tenant2.ConnectionStrings.EdFi_Admin

    # Print the connection strings (just for demonstration purposes)
    Write-Host "Tenant ODS Connection String: $tenantODSDatabaseCS"
    Write-Host "Tenant Admin Connection String: $tenantAdminDatabaseCS"

    $sql = @"
    -- EdFi_Admin

    DELETE from dbo.ApiClientOdsInstances
    DELETE from dbo.OdsInstances 
    DELETE from dbo.ApplicationEducationOrganizations
    DELETE from dbo.ApiClients
    DELETE from dbo.Applications
    DELETE from dbo.VendorNamespacePrefixes 
    DELETE from dbo.Vendors 

    DECLARE @VendorId NVARCHAR(225);
    DECLARE @ApplicationId NVARCHAR(225);

    INSERT INTO dbo.Vendors (
        VendorName
    )
    VALUES 
        ('$tenantVendorName');

    SELECT @VendorId=VendorId  from dbo.Vendors where VendorName ='$tenantVendorName';

    INSERT INTO dbo.VendorNamespacePrefixes (
        NamespacePrefix,
        Vendor_VendorId
    )
    VALUES 
        ('uri://ed-fi.org', @VendorId);

    INSERT INTO dbo.Applications (
        ApplicationName,
        OperationalContextUri,
        Vendor_VendorId,
        ClaimSetName
    )
    VALUES 
        ('SwaggerUI', 'uri://ed-fi.org', @VendorId, 'Ed-Fi Sandbox');

    SELECT @ApplicationId=ApplicationId  from dbo.Applications where Vendor_VendorId =@VendorId and ApplicationName = 'SwaggerUI';

    INSERT INTO dbo.ApplicationEducationOrganizations (
        EducationOrganizationId,
        Application_ApplicationId
    )
    VALUES 
    ('255901001', @ApplicationId);
        
    INSERT INTO dbo.ApiClients (
        [Key],
        [Secret],
        [Name],
        IsApproved,
        UseSandbox,
        SandboxType,
        SecretIsHashed,
        Application_ApplicationId
    )
    VALUES 
        ('$tenantPopulatedSandboxKey', '$tenantPopulatedSandboxSecret', '$tenantIdentifier', 1, 0, 0, 0, @ApplicationId);

    INSERT INTO dbo.ApiClientApplicationEducationOrganizations (
        ApiClient_ApiClientId,
        ApplicationEducationOrganization_ApplicationEducationOrganizationId
    )

    SELECT 
        ApiClients.ApiClientId,
        ApplicationEducationOrganizations.ApplicationEducationOrganizationId
    FROM
        dbo.ApiClients
    CROSS JOIN
        dbo.Applications
    INNER JOIN
        dbo.ApplicationEducationOrganizations ON
        Applications.ApplicationId = ApplicationEducationOrganizations.Application_ApplicationId
    WHERE
        ApiClients.Name = '$tenantIdentifier'
        AND
        Applications.ApplicationName = 'SwaggerUI'
        AND 
        Applications.Vendor_VendorId = @VendorId
        AND
        ApiClients.Application_ApplicationId = @ApplicationId;

    INSERT INTO dbo.OdsInstances (
        [Name],
        InstanceType,
        ConnectionString
    )
    VALUES 
        ('$tenantIdentifier Populated Sandbox', 'Sandbox', '$tenantODSDatabaseCS');


    INSERT INTO dbo.ApiClientOdsInstances (
        ApiClient_ApiClientId,
        OdsInstance_OdsInstanceId
    )
    SELECT 
        ApiClients.ApiClientId,
        OdsInstances.OdsInstanceId
    FROM 
        dbo.OdsInstances
    CROSS JOIN 
        dbo.ApiClients
    WHERE 
        OdsInstances.[Name] = 'tenantIdentifier Populated Sandbox'
        AND
        ApiClients.[Name] = '$tenantIdentifier'
        AND  
        ApiClients.Application_ApplicationId = @ApplicationId;
"@

    Invoke-SqlCmd -ConnectionString $tenantAdminDatabaseCS -Query $sql 
}

Invoke-ConfigureOctopusTenant -TenantIdentifier "Tenant1" -TenantPopulatedSandboxKey $OctopusParameters["PrepopulatedKeyTenant1"] -TenantPopulatedSandboxSecret $OctopusParameters["PrepopulatedSecretTenant1"] -TenantsJson $OctopusParameters["Tenants"] -ConnectionString $OctopusParameters["ConnectionStrings:EdFi_Ods"] -TenantVendorName "tenant1.org"

Invoke-ConfigureOctopusTenant -TenantIdentifier "Tenant2" -TenantPopulatedSandboxKey $OctopusParameters["PrepopulatedKeyTenant2"] -TenantPopulatedSandboxSecret $OctopusParameters["PrepopulatedSecretTenant2"] -TenantsJson $OctopusParameters["Tenants"] -ConnectionString $OctopusParameters["ConnectionStrings:EdFi_Ods"] -TenantVendorName "tenant2.org"
