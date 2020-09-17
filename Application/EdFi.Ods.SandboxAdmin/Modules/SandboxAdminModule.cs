using Autofac;
using Autofac.Core;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Providers;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Sandbox.Repositories;
using EdFi.Ods.SandboxAdmin.Contexts;
using EdFi.Ods.SandboxAdmin.Security;
using EdFi.Ods.SandboxAdmin.Services;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using EdFi.Ods.SandboxAdmin.Initialization;
using EdFi.Ods.Sandbox.Admin;
using EdFi.Ods.Sandbox.Admin.Services;
using UserOptions = EdFi.Ods.SandboxAdmin.Initialization.UserOptions;
using EdFi.Admin.DataAccess.Utils;
using EdFi.Ods.Sandbox.Provisioners;
using EdFi.Ods.Common.Database;
using EdFi.Common.Database;

namespace EdFi.Ods.SandboxAdmin.Modules
{
    public class SandboxAdminModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            //builder.RegisterType<SecurityService>()
            //    .As<ISecurityService>();

            builder.RegisterType<ConfigurationRoot>()
                .As<IConfigurationRoot>();

            builder.RegisterType<ClientAppRepo>()
                .As<IClientAppRepo>();

            //builder.RegisterType<IdentityProvider>()
            //    .As<IIdentityProvider>();

            builder.RegisterType<UsersContextFactory>()
                .As<IUsersContextFactory>();

            builder.RegisterType<AdminDatabaseConnectionStringProvider>()
                .As<IAdminDatabaseConnectionStringProvider>();

            builder.Register(c => DatabaseEngine.TryParseEngine(c.Resolve<IConfiguration>().GetSection("Engine").Value));

            builder.RegisterType<DatabaseNameBuilder>()
                .As<IDatabaseNameBuilder>();

            builder.RegisterType<DbConnectionStringBuilderAdapterFactory>()
                .As<IDbConnectionStringBuilderAdapterFactory>();

            builder.RegisterType<ConfigConnectionStringsProvider>()
                .As<IConfigConnectionStringsProvider>();

            builder.RegisterType<UserOptions>();

            builder.RegisterType<ClientCreator>()
                .As<IClientCreator>();

            builder.RegisterType<SqlServerTemplateDatabaseLeaQuery>()
                .As<ITemplateDatabaseLeaQuery>();

            builder.RegisterType<DefaultApplicationCreator>()
                .As<IDefaultApplicationCreator>();

            builder.RegisterType<ClientCreator>()
                .As<IClientCreator>();

            builder.RegisterType<SqlServerSandboxProvisioner>()
                .As<ISandboxProvisioner>();

            builder.RegisterType<InitializationEngine>();

            builder.RegisterType<BackgroundJobService>()
                .As<IBackgroundJobService>();

            //builder.RegisterType<SignInManager<IdentityUser>>();

            //builder.RegisterType<IdentityContextFactory>()
            //    .As<IIdentityContextFactory>();

            //builder.RegisterType<UserManager<IdentityUser>>();

            //builder.RegisterType<UserStore<IdentityUser>>()
            //    .As<IUserStore<IdentityUser>>();
        }
    }
}
