# This script will inject the ODS connection strings and the populatedSandbox 
# keys and secrets into the Admin database for two Tenants

Import-Module -Force -Scope Global './configure-tenant.psm1'

Invoke-ConfigureOctopusTenant -TenantIdentifier "Tenant 1" -TenantPopulatedSandboxKey $OctopusParameters["PrepopulatedKeyTenant1"] -TenantPopulatedSandboxSecret $OctopusParameters["PrepopulatedSecretTenant1"] -TenantsJson $OctopusParameters["Tenants"] -ConnectionString $OctopusParameters["ConnectionStrings:EdFi_Ods"] -TenantVendorName "tenant1.org"
Invoke-ConfigureOctopusTenant -TenantIdentifier "Tenant 2" -TenantPopulatedSandboxKey $OctopusParameters["PrepopulatedKeyTenant2"] -TenantPopulatedSandboxSecret $OctopusParameters["PrepopulatedSecretTenant2"] -TenantsJson $OctopusParameters["Tenants"] -ConnectionString $OctopusParameters["ConnectionStrings:EdFi_Ods"] -TenantVendorName "tenant2.org"
