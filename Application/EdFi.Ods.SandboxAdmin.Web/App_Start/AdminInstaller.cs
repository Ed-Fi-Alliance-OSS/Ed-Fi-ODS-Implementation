// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Web.Http;
using System.Web.Mvc;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using EdFi.Admin.DataAccess;
using EdFi.Ods.Admin;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Utils;
using EdFi.Ods.Admin.Contexts;
using EdFi.Ods.Admin.Security;
using EdFi.Ods.Sandbox.Provisioners;
using EdFi.Ods.Sandbox.Repositories;
using EdFi.Ods.Admin.Services;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Database;

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
                    .ImplementedBy<SandboxAdminApiConfigurationProvider>(),
                Component.For<DatabaseEngine>()
                    .UsingFactoryMethod(kernel => kernel.Resolve<IApiConfigurationProvider>().DatabaseEngine)
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

            container.Register(
                Component.For<IIdentityContextFactory>()
                    .ImplementedBy<IdentityContextFactory>());

            container.Register(
                Component.For<IIdentityProvider>()
                    .ImplementedBy<IdentityProvider>());

            var apiConfigurationProvider = container.Resolve<IApiConfigurationProvider>();

            if (apiConfigurationProvider.DatabaseEngine == DatabaseEngine.SqlServer)
            {
                container.Register(
                    Component.For<ITemplateDatabaseLeaQuery>()
                        .ImplementedBy<SqlServerTemplateDatabaseLeaQuery>());

                container.Register(
                    Component.For<ISandboxProvisioner>()
                        .ImplementedBy<SqlServerSandboxProvisioner>());
            }
            else
            {
                container.Register(
                    Component.For<ITemplateDatabaseLeaQuery>()
                        .ImplementedBy<PostgresTemplateDatabaseLeaQuery>());

                container.Register(
                    Component.For<ISandboxProvisioner>()
                        .ImplementedBy<PostgresSandboxProvisioner>());
            }

            container.Register(
                Component.For<IDatabaseNameBuilder>().ImplementedBy<DatabaseNameBuilder>());

            container.Register(
                Component.For<IDbConnectionStringBuilderAdapterFactory>()
                    .ImplementedBy<DbConnectionStringBuilderAdapterFactory>());

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
