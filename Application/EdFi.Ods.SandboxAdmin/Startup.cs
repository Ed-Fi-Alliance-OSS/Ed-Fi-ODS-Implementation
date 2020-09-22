using Autofac;
using Autofac.Extensions.DependencyInjection;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Sandbox.Admin.Initialization;
using EdFi.Ods.Sandbox.Admin.Services;
using EdFi.Ods.SandboxAdmin.Modules;
using Hangfire;
using log4net;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Data.Entity;
using EdFi.Ods.Sandbox.Admin.Contexts;
using Hangfire.PostgreSql;
using Microsoft.AspNetCore.Mvc.Infrastructure;

namespace EdFi.Ods.SandboxAdmin
{
    public class Startup
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(Startup));

        public Startup(IConfiguration configuration)
        {
            Configuration = (IConfigurationRoot) configuration;

            ApiSettings = new ApiSettings();

            Configuration.Bind("ApiSettings", ApiSettings);

            _logger.Debug($"built configuration = {Configuration}");
        }

        public ApiSettings ApiSettings { get; }

        public IConfigurationRoot Configuration { get; }

        public ILifetimeScope Container { get; private set; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            _logger.Debug("Building services collection");

            services.AddSingleton(ApiSettings);
            services.AddSingleton(Configuration);
            services.AddSingleton<IActionContextAccessor, ActionContextAccessor>();

            services.AddHttpContextAccessor();

            // Add Hangfire services.
            services.AddHangfire(
                config =>
                {
                    config
                        .SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
                        .UseSimpleAssemblyNameTypeSerializer()
                        .UseRecommendedSerializerSettings()
                        .UseLog4NetLogProvider();

                    if (ApiSettings.GetDatabaseEngine() == DatabaseEngine.SqlServer)
                    {
                        config.UseSqlServerStorage(Configuration.GetConnectionString("EdFi_Admin"));
                    }
                    else
                    {
                        config.UsePostgreSqlStorage(Configuration.GetConnectionString("EdFi_Admin"));
                    }
                });

            // Add the processing server as IHostedService
            services.AddHangfireServer();

            services.Configure<Dictionary<string, UserOptions>>(Configuration.GetSection("User"));

            services.AddControllersWithViews().AddControllersAsServices();

            services.AddMvc().AddControllersAsServices();

            services.ConfigureApplicationCookie(options => { options.LoginPath = "/Account/Login"; });
        }

        // ConfigureContainer is where you can register things directly
        // with Autofac. This runs after ConfigureServices so the things
        // here will override registrations made in ConfigureServices.
        // Don't build the container; that gets done for you by the factory.
        public void ConfigureContainer(ContainerBuilder builder)
        {
            _logger.Debug("Building Autofac container");
            builder.RegisterModule(new SandboxAdminModule());

            if (ApiSettings.GetDatabaseEngine() == DatabaseEngine.SqlServer)
            {
                _logger.Debug($"Adding support for SqlServer");
                builder.RegisterModule(new SqlServerModule());
            }
            else
            {
                _logger.Debug($"Adding support for PostgreSQL");
                builder.RegisterModule(new PostgresModule());
            }
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddLog4Net();

            Container = app.ApplicationServices.GetAutofacRoot();

            // Set EF Context
            DbConfiguration.SetConfiguration(new DatabaseEngineDbConfiguration(Container.Resolve<DatabaseEngine>()));

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

            app.UseHangfireServer();
            var backgroundJob = Container.Resolve<IBackgroundJobService>();
            backgroundJob.Configure();

            app.UseEndpoints(
                endpoints =>
                {
                    endpoints.MapControllerRoute(
                        name: "default",
                        pattern: "{controller=Home}/{action=Index}/{id?}");
                });
        }
    }
}
