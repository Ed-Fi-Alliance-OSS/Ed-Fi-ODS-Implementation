﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Autofac;
using EdFi.Ods.Api.ExternalTasks;

namespace EdFi.Ods.Api.IntegrationTestHarness.Modules
{
    public class UpdateSecurityDatabaseModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<UpdateSecurityDatabaseTask>()
                .As<IExternalTask>();

            builder.RegisterType<PostmanSecurityMetadataInitializer>()
                .As<IPostmanSecurityMetadataInitializer>();
        }
    }
}
