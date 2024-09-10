// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Autofac;
using EdFi.Ods.Api.IntegrationTestHarness.Migrations;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Constants;
using EdFi.Ods.Common.Container;

namespace EdFi.Ods.Api.IntegrationTestHarness.Modules;

public class MultiTenancyModule : ConditionalModule
{
    public MultiTenancyModule(ApiSettings apiSettings)
        : base(apiSettings, nameof(MultiTenancyModule)) { }

    public override bool IsSelected() => IsFeatureEnabled(ApiFeature.MultiTenancy);

    public override void ApplyConfigurationSpecificRegistrations(ContainerBuilder builder)
    {
        builder.RegisterType<MultiTenantSecurityDatabaseConnectionStringCatalog>()
            .As<ISecurityDatabaseConnectionStringCatalog>()
            .SingleInstance();
    }
}
