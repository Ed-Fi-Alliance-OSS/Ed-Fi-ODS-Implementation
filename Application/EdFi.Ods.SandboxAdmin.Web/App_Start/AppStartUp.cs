// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Castle.Facilities.TypedFactory;
using Castle.Windsor;
using Castle.Windsor.Installer;
using EdFi.Ods.Admin.Filters;
using EdFi.Ods.Admin.Infrastructure;
using EdFi.Ods.Admin.Services;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.SandboxAdmin.Web;
using Hangfire;
using Hangfire.PostgreSql;
using Hangfire.Windsor;
using log4net;
using log4net.Config;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.BuilderProperties;
using Microsoft.Owin.Security.Cookies;
using Owin;
using GlobalConfiguration = System.Web.Http.GlobalConfiguration;

[assembly: OwinStartup("Startup", typeof(AppStartUp))]
namespace EdFi.Ods.SandboxAdmin.Web
{
    public class AppStartUp : IDisposable
    {
        protected IWindsorContainer _container;
        protected ILog Logger = LogManager.GetLogger(typeof(AppStartUp));

        public void Dispose()
        {
            _container?.Dispose();
        }

        public void Configuration(IAppBuilder appBuilder)
        {
            XmlConfigurator.Configure();
            AreaRegistration.RegisterAllAreas();

            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterHttpFilters(GlobalConfiguration.Configuration.Filters);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            BootstrapContainer();

            GlobalFilters.Filters.Add(new SetCurrentUserInfoAttribute(() => _container.Resolve<ISecurityService>()));

            _databaseEngine = _container.Resolve<IApiConfigurationProvider>().DatabaseEngine;

            BootstrapHangfire();

            appBuilder.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login")
            });


            var properties = new AppProperties(appBuilder.Properties);
            var token = properties.OnAppDisposing;

            if (token != CancellationToken.None)
            {
                token.Register(() =>
                {
                    _backgroundJobServer.Dispose();
                    _container.Dispose();
                });
            }
        }

        private BackgroundJobServer _backgroundJobServer;

        private DatabaseEngine _databaseEngine;
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
    }
}
