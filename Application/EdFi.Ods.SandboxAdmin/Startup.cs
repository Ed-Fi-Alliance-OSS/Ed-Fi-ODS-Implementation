using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Autofac;
using Autofac.Core;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Providers;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Container;
using EdFi.Ods.Common.InversionOfControl;
using EdFi.Ods.Sandbox.Repositories;
using EdFi.Ods.SandboxAdmin.Contexts;
using EdFi.Ods.SandboxAdmin.Filters;
using EdFi.Ods.SandboxAdmin.Helpers;
using EdFi.Ods.SandboxAdmin.Initialization;
using EdFi.Ods.SandboxAdmin.Security;
using EdFi.Ods.SandboxAdmin.Services;
using log4net;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EdFi.Ods.SandboxAdmin
{
    public class Startup
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(Startup));

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            ApiSettings = new ApiSettings();

            Configuration.Bind("ApiSettings", ApiSettings);

            _logger.Debug($"built configuration = {Configuration}");
        }

        public ApiSettings ApiSettings { get; }

        public IConfiguration Configuration { get; }

        public ILifetimeScope Container { get; private set; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            _logger.Debug("Building services collection");

            services.AddSingleton(ApiSettings);
            services.AddSingleton(Configuration);
            //services.AddSingleton<IActionContextAccessor, ActionContextAccessor>();
            //services.AddSingleton<ISecurityService, SecurityService>();
            //services.AddScoped<IClientAppRepo, ClientAppRepo>();
            //services.AddScoped<IIdentityProvider, IdentityProvider>();
            //services.AddScoped<IUsersContextFactory, UsersContextFactory>();
            //services.AddSingleton<IAdminDatabaseConnectionStringProvider, AdminDatabaseConnectionStringProvider>();
            //services.AddSingleton<DatabaseEngine>(_ => new DatabaseEngine(ApiConfigurationConstants.SqlServer, "SQL Server", "MsSql"));
            //services.AddSingleton<IConfigConnectionStringsProvider, ConfigConnectionStringsProvider>();
            //services.AddScoped<IUserStore<IdentityUser>, UserStore<IdentityUser>>();

            services.Configure<InitializationOptions>(Configuration.GetSection("initialization"));

            services.AddIdentity<IdentityUser, IdentityRole>();
            //.AddEntityFrameworkStores<IdentityContext>();

            //services.AddControllersWithViews();

            services.AddControllersWithViews(options =>
            {
                options.Filters.Add(typeof(SetCurrentUserInfoAttribute));
            }).AddControllersAsServices();

            services.AddHttpContextAccessor();

            //services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();
            services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = "/Account/Login";
            });
        }

        // ConfigureContainer is where you can register things directly
        // with Autofac. This runs after ConfigureServices so the things
        // here will override registrations made in ConfigureServices.
        // Don't build the container; that gets done for you by the factory.
        public void ConfigureContainer(ContainerBuilder builder)
        {
            _logger.Debug("Building Autofac container");

            // For pipelines we need a service locator. Note this is an anti-pattern
            //builder.Register(c => new AutofacServiceLocator(new Lazy<ILifetimeScope>(() => Container)))
            //    .As<IServiceLocator>()
            //    .SingleInstance();

            RegisterModulesDynamically();

            _logger.Debug("Container loaded.");

            void RegisterModulesDynamically()
            {
                var assemblies = AppDomain.CurrentDomain.GetAssemblies()
                    .ToList();

                _logger.Debug("Installing modules:");

                foreach (var type in TypeHelper.GetTypesWithModules())
                {
                    _logger.Debug($"Module {type.Name}");

                    if (type.IsSubclassOf(typeof(ConditionalModule)))
                    {
                        builder.RegisterModule((IModule)Activator.CreateInstance(type, ApiSettings));
                    }
                    else
                    {
                        builder.RegisterModule((IModule)Activator.CreateInstance(type));
                    }
                }
            }
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
