using Autofac;
using Autofac.Extensions.DependencyInjection;
using EdFi.Ods.Common.Configuration;
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
using EdFi.Common.Configuration;
using EdFi.Common.Extensions;
using EdFi.Ods.Sandbox.Admin.Contexts;
using EdFi.Ods.SandboxAdmin.Filters;
using EdFi.Ods.SandboxAdmin.Services;
using Hangfire.PostgreSql;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Routing;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using UserOptions = EdFi.Ods.Sandbox.Admin.Initialization.UserOptions;

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

            services.Configure<ForwardedHeadersOptions>(
                options => { options.ForwardedHeaders = ForwardedHeaders.All; });

            services.AddScoped(
                serviceProvider =>
                {
                    var actionContext = serviceProvider.GetRequiredService<IActionContextAccessor>().ActionContext;
                    var factory = serviceProvider.GetRequiredService<IUrlHelperFactory>();
                    return factory.GetUrlHelper(actionContext);
                });

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

            var identityBuilder = services.AddIdentityCore<IdentityUser>(
                    options =>
                    {
                        options.Password.RequireNonAlphanumeric = false;
                        options.Password.RequireLowercase = false;
                        options.Password.RequireUppercase = false;
                        options.Password.RequireNonAlphanumeric = false;
                        options.Password.RequireDigit = false;
                        options.User.AllowedUserNameCharacters = options.User.AllowedUserNameCharacters + " ";
                    })
                .AddRoles<IdentityRole>()
                .AddRoleValidator<RoleValidator<IdentityRole>>()
                .AddRoleManager<RoleManager<IdentityRole>>()
                .AddSignInManager<SignInManager<IdentityUser>>()
                .AddDefaultTokenProviders();

            if (ApiSettings.GetDatabaseEngine() == DatabaseEngine.SqlServer)
            {
                identityBuilder.AddEntityFrameworkStores<SqlServerIdentityContext>();
            }
            else
            {
                identityBuilder.AddEntityFrameworkStores<PostgresIdentityContext>();
            }

            services.AddAuthentication(IdentityConstants.ApplicationScheme)
                .AddCookie(IdentityConstants.ApplicationScheme, options => { options.LoginPath = "/Account/Login"; });

            services.AddAuthorization();

            // Add the processing server as IHostedService
            services.AddHangfireServer();

            services.Configure<Dictionary<string, UserOptions>>(Configuration.GetSection("User"));

            services.AddControllersWithViews()
                .AddNewtonsoftJson(
                    options =>
                    {
                        options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                        options.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Utc;
                        options.SerializerSettings.DateParseHandling = DateParseHandling.None;
                        options.SerializerSettings.Formatting = Formatting.Indented;
                        options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                    })
                .AddControllersAsServices();

            services.AddMvc(
                    options =>
                    {
                        options.Filters.Add(
                            new SetCurrentUserInfoAttribute(
                                () => Container.Resolve<ISecurityService>(), Container.Resolve<IHttpContextAccessor>()));
                    })
                .AddNewtonsoftJson(
                    options =>
                    {
                        options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                        options.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Utc;
                        options.SerializerSettings.DateParseHandling = DateParseHandling.None;
                        options.SerializerSettings.Formatting = Formatting.Indented;
                        options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                    })
                .AddControllersAsServices();

            services.AddControllers()
                .AddNewtonsoftJson(
                    options =>
                    {
                        options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                        options.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Utc;
                        options.SerializerSettings.DateParseHandling = DateParseHandling.None;
                        options.SerializerSettings.Formatting = Formatting.Indented;
                        options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                    })
                .AddControllersAsServices();
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
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory, IConfigurationRoot configuration)
        {
            loggerFactory.AddLog4Net();

            var pathBase = configuration["PathBase"];

            if (!string.IsNullOrEmpty(pathBase))
            {
                pathBase = pathBase.Replace("/", "");
                pathBase = "/" + pathBase;
                app.UsePathBase(pathBase);
            }
            
            Container = app.ApplicationServices.GetAutofacRoot();

            // Set EF Context
            DbConfiguration.SetConfiguration(new DatabaseEngineDbConfiguration(Container.Resolve<DatabaseEngine>()));

            app.UseForwardedHeaders();

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
