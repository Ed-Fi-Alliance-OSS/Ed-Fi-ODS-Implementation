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

namespace EdFi.Ods.SandboxAdmin.Modules
{
    public class SandboxAdminModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<SecurityService>()
                .As<ISecurityService>();

            builder.RegisterType<ClientAppRepo>()
                .As<IClientAppRepo>();

            builder.RegisterType<IdentityProvider>()
                .As<IIdentityProvider>();

            builder.RegisterType<UsersContextFactory>()
                .As<IUsersContextFactory>();

            builder.RegisterType<AdminDatabaseConnectionStringProvider>()
                .As<IAdminDatabaseConnectionStringProvider>();

            List<Parameter> lstParams = new List<Parameter>();
            lstParams.Add(new NamedParameter("value", ApiConfigurationConstants.SqlServer));
            lstParams.Add(new NamedParameter("displayName", "SQL Server"));
            lstParams.Add(new NamedParameter("scriptsFolderName", "MsSql"));
            builder.RegisterType<DatabaseEngine>().WithParameters(lstParams);

            builder.RegisterType<ConfigConnectionStringsProvider>()
                .As<IConfigConnectionStringsProvider>();

            builder.RegisterType<IdentityContextFactory>()
                .As<IIdentityContextFactory>();

            builder.RegisterType<UserManager<IdentityUser>>();

            //builder.RegisterType<UserStore<IdentityUser>>()
            //    .As<IUserStore<IdentityUser>>();
        }
    }
}
