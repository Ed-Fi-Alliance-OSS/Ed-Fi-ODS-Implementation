// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
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
using EdFi.Ods.Common.InversionOfControl;
using Hangfire;
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
        private static IWindsorContainer container;
        private BackgroundJobServer _backgroundJobServer;

        private static void BootstrapContainer()
        {
            container = new WindsorContainerEx();
            container.AddFacility<TypedFactoryFacility>();
            container.Install(FromAssembly.This());

            // MVC Dependency Resolution 
            var controllerFactory = new CastleControllerFactory(container.Kernel);
            ControllerBuilder.Current.SetControllerFactory(controllerFactory);

            // WebApi Dependency Resolution
            var dependencyResolver = new WindsorDependencyResolver(container);
            GlobalConfiguration.Configuration.DependencyResolver = dependencyResolver;

            // Hangfire background processing Resolution
            Hangfire.GlobalConfiguration.Configuration.UseActivator(new WindsorJobActivator(container.Kernel));
        }

        protected void Application_Start()
        {
            Hangfire.GlobalConfiguration.Configuration.UseSqlServerStorage("EdFi_Admin");
            Hangfire.GlobalConfiguration.Configuration.UseLog4NetLogProvider();

            XmlConfigurator.Configure();
            AreaRegistration.RegisterAllAreas();

            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterHttpFilters(GlobalConfiguration.Configuration.Filters);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            AuthConfig.RegisterAuth();

            GlobalFilters.Filters.Add(new SetCurrentUserInfoAttribute(() => container.Resolve<ISecurityService>()));
            InitializeWebSecurity();

            //Do this last to make sure we aren't trying to use the container during Application_Start.  We can't use the container during Application_Start
            //because we are registering some dependencies with a PerWebRequest lifecycle.  Castle cannot resolve those dependencies outside of the request
            //lifecycle.
            BootstrapContainer();

            _backgroundJobServer = new BackgroundJobServer();
            BackgroundJobsConfig.Configure(container.Resolve<InitializationEngine>(), container.Resolve<InitializationModel>());
        }

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("server");
            Response.Headers.Remove("x-aspnetmvc-version");
            Response.Headers.Remove("x-aspnet-version");
        }

        protected void Application_End(object sender, SiteMapResolveEventArgs e)
        {
            _backgroundJobServer.Dispose();
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
    }
}
