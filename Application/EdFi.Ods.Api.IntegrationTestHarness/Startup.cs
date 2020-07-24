// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using EdFi.Ods.Api.IntegrationTestHarness;
using EdFi.Ods.Api.Startup;
using EdFi.Ods.ChangeQueries;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Composites.Test;
using EdFi.Ods.Extensions.Sample;
using EdFi.Ods.Extensions.TPDM;
using EdFi.Ods.Profiles.Test;
using Microsoft.Owin;

[assembly: OwinStartup("Startup", typeof(Startup))]

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    internal class Startup : StartupBase
    {
        protected override void EnsureAssembliesLoaded()
        {
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Composites_Test>();
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Profiles_Test>();
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_ChangeQueries>();
            
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Extensions_Sample>();
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Extensions_TPDM>();
        }
    }
}
