// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Castle.Facilities.TypedFactory;
using Castle.Windsor;
using Castle.Windsor.Installer;
using EdFi.Ods.Admin.Filters;
using EdFi.Ods.Admin.Infrastructure;
using EdFi.Ods.Admin.Initialization;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Ods.Admin.Services;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Http.InversionOfControl;
using EdFi.Ods.Common.InversionOfControl;
using Hangfire;
using Hangfire.PostgreSql;
using Hangfire.Windsor;
using log4net.Config;
using WebMatrix.WebData;
using GlobalConfiguration = System.Web.Http.GlobalConfiguration;

namespace EdFi.Ods.SandboxAdmin.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode,
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : HttpApplication
    {
        private IWindsorContainer _container;

        protected void Application_Start()
        {
            XmlConfigurator.Configure();
            AreaRegistration.RegisterAllAreas();

            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterHttpFilters(GlobalConfiguration.Configuration.Filters);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            AuthConfig.RegisterAuth();

            BootstrapContainer();

            GlobalFilters.Filters.Add(new SetCurrentUserInfoAttribute(() => _container.Resolve<ISecurityService>()));

            _databaseEngine = _container.Resolve<IApiConfigurationProvider>().DatabaseEngine;

            if (_databaseEngine == DatabaseEngine.SqlServer)
            {
                InitializeWebSecurity();
            }

            BootstrapHangfire();
        }

        private BackgroundJobServer _backgroundJobServer;

        private DatabaseEngine _databaseEngine;

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("server");
            Response.Headers.Remove("x-aspnetmvc-version");
            Response.Headers.Remove("x-aspnet-version");
        }

        protected void Application_End(object sender, SiteMapResolveEventArgs e)
        {
            _backgroundJobServer.Dispose();
            _container.Dispose();
        }

        private void BootstrapContainer()
        {
            _container = new WindsorContainer();
            _container.AddFacility<TypedFactoryFacility>();
            _container.Install(FromAssembly.This());

            // MVC Dependency Resolution
            var controllerFactory = new CastleControllerFactory(_container.Kernel);
            ControllerBuilder.Current.SetControllerFactory(controllerFactory);

            // WebApi Dependency Resolution
            var dependencyResolver = new WindsorDependencyResolver(_container);
            GlobalConfiguration.Configuration.DependencyResolver = dependencyResolver;
        }

        private void BootstrapHangfire()
        {
            // Hangfire background processing Resolution
            Hangfire.GlobalConfiguration.Configuration
                .UseActivator(new WindsorJobActivator(_container.Kernel))
                .UseLog4NetLogProvider()
                .UseRecommendedSerializerSettings()
                .SetDataCompatibilityLevel(CompatibilityLevel.Version_170);

            // postgres provider does not find the connection string correctly using the name
            var connectionString = _container.Resolve<IConfigConnectionStringsProvider>().GetConnectionString("EdFi_Admin");

            if (_databaseEngine == DatabaseEngine.SqlServer)
            {
                Hangfire.GlobalConfiguration.Configuration.UseSqlServerStorage(connectionString);
            }
            else
            {
                Hangfire.GlobalConfiguration.Configuration.UsePostgreSqlStorage(connectionString);
            }

            _backgroundJobServer = new BackgroundJobServer();

            _container.Resolve<BackgroundJobsConfig>().Configure();
        }

        private static void InitializeWebSecurity()
        {
            WebSecurity.InitializeDatabaseConnection(
                "EdFi_Admin",
                UsersContext.UserTableName,
                UsersContext.UserIdColumn,
                UsersContext.UserNameColumn,
                autoCreateTables: true);
        }

        public class PostgresSimpleRoleProvider : SimpleRoleProvider
        {

        }
    }
}
