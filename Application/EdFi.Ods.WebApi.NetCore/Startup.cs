// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.AspNetCore.Hosting;

namespace EdFi.Ods.WebApi.NetCore
{
    public class Startup : EdFi.Ods.Api.NetCore.Startup.OdsStartupBase
    {
        public Startup(IWebHostEnvironment env) : base(env)
        {

        }
    }
}
