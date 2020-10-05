// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
using EdFi.Ods.Api.Startup;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Composites.Test;
using EdFi.Ods.Profiles.Test;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class Startup : OdsStartupBase
    {
        public Startup(IWebHostEnvironment env, IConfiguration configuration)
            : base(env, configuration)
        {
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Composites_Test>();
            AssemblyLoader.EnsureLoaded<Marker_EdFi_Ods_Profiles_Test>();
        }
    }
}
