// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System.Web.Http;
using System.Web.Mvc;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using EdFi.Ods.Admin;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Ods.Sandbox.Provisioners;
using EdFi.Ods.Sandbox.Repositories;
using EdFi.Ods.Admin.Services;
using EdFi.Ods.Common.Configuration;
using EdFi.Security.DataAccess.Contexts;
using EdFi.Security.DataAccess.Repositories;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public class AdminInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(
                Component
                    .For<IConfigConnectionStringsProvider>()
                    .ImplementedBy<AppConfigConnectionStringsProvider>()
            );

            container.Register(
                Component
                    .For<IConfigValueProvider>()
                    .ImplementedBy<AppConfigValueProvider>()
            );

            container.Register(
                Component
                    .For<IDatabaseEngineProvider>()
                    .ImplementedBy<DatabaseEngineProvider>()
            );

            container.Register(
                Component
                    .For<IApiConfigurationProvider>()
                    .ImplementedBy<SandboxAdminApiConfigurationProvider>()
            );

            container.Register(
                Component
                    .For<IUsersContextFactory>()
                    .ImplementedBy<UsersContextFactory>()
            );

            container.Register(
                Component.For<IClientAppRepo>()
                    .ImplementedBy<ClientAppRepo>());

            container.Register(
                Component.For<IClientCreator>()
                    .ImplementedBy<ClientCreator>());

            container.Register(
                Component.For<IDefaultApplicationCreator>()
                    .ImplementedBy<DefaultApplicationCreator>());

            container.Register(
                Component.For<IDatabaseTemplateLeaQuery>()
                    .ImplementedBy<DatabaseTemplateLeaQuery>());

            container.Register(
                Component.For<IEducationOrganizationsInitializer>()
                    .ImplementedBy<EducationOrganizationsInitializer>());
            
            container.Register(
                Component.For<IRouteService>()
                    .ImplementedBy<RouteService>());

            container.Register(
                Component.For<IEmailService>()
                    .ImplementedBy<EmailService>());

            container.Register(
                Component.For<IPasswordService>()
                    .ImplementedBy<PasswordService>());

            container.Register(
                Component.For<IUserAccountManager>()
                    .ImplementedBy<UserAccountManager>());

            container.Register(
                Component.For<ISecurityService>()
                    .ImplementedBy<SecurityService>());

            container.Register(Component.For<ISandboxProvisioner, SqlSandboxProvisioner>());

            // register controllers in this assembly
            // These are mvc controllers so they need to be transient to fit the mvc model of create dispose
            container.Register(
                Classes.FromAssemblyContaining<Marker_EdFi_Ods_Admin>()
                    .BasedOn<IController>()
                    .LifestyleTransient());

            // register ApiControllers in this assembly
            // These are api controllers so they need to be scoped to fit the windsor integration for resolving dependencies
            container.Register(
                Classes.FromAssemblyContaining<Marker_EdFi_Ods_Admin>()
                    .BasedOn<ApiController>()
                    .LifestyleScoped());
        }
    }
}
