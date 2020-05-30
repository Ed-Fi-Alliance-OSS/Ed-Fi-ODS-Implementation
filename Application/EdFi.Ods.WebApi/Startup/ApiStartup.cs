// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using EdFi.Ods.Api;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Composites.Enrollment;
using EdFi.Ods.Extensions.Homograph;
using EdFi.Ods.Extensions.Sample;
using EdFi.Ods.WebApi.Startup;
using Microsoft.Owin;

[assembly: OwinStartup("Startup", typeof(ApiStartup))]

namespace EdFi.Ods.WebApi.Startup
{
    public class ApiStartup : StartupBase
    {
        protected override void EnsureAssembliesLoaded()
        {
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Composites_Enrollment>();
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Extensions_Sample>();
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Extensions_Homograph>();
        }
    }
}
