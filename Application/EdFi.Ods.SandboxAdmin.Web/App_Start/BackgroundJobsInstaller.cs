// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Web.UI;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using EdFi.Ods.Admin.Contexts;
using EdFi.Ods.Admin.Initialization;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public class BackgroundJobsInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(Component.For<IInitializationSettingsFactory, InitializationSettingsFactory>());

            container.Register(
                Component.For<InitializationModel>()
                         .Instance(
                              container.Resolve<IInitializationSettingsFactory>()
                                       .GetInitializationModel()));

            container.Register(Component.For<InitializationEngine>());

            container.Register(Component.For<BackgroundJobsConfig>());
            container.Register(Component.For<AdminIdentityDbContext>().LifestyleTransient());
        }
    }
}
