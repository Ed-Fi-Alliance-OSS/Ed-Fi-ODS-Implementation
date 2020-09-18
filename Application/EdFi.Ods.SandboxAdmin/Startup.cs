using Autofac;
using Autofac.Extensions.DependencyInjection;
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
using UserOptions = EdFi.Ods.SandboxAdmin.Initialization.UserOptions;

namespace EdFi.Ods.SandboxAdmin
{
    public class Startup
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(Startup));

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            _logger.Debug($"built configuration = {Configuration}");
        }

        public IConfiguration Configuration { get; }

        public ILifetimeScope Container { get; private set; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            _logger.Debug("Building services collection");

            services.AddSingleton(Configuration);

            // Add Hangfire services.
            services.AddHangfire(configuration => configuration
                .SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
                .UseSimpleAssemblyNameTypeSerializer()
                .UseRecommendedSerializerSettings()
                .UseSqlServerStorage(Configuration.GetConnectionString("EdFi_Admin")));

            // Add the processing server as IHostedService
            services.AddHangfireServer();

            services.Configure<UserOptions>(Configuration.GetSection("User"));

            services.AddControllersWithViews().AddControllersAsServices();

            services.AddMvc().AddControllersAsServices();

            services.AddHttpContextAccessor();

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
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory, IBackgroundJobClient backgroundJobs)
        {
            loggerFactory.AddLog4Net();

            Container = app.ApplicationServices.GetAutofacRoot();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();

            app.UseHangfireDashboard();
            app.UseHangfireServer();

            ILifetimeScope autofacRoot = app.ApplicationServices.GetAutofacRoot();
            var backgroundJob = autofacRoot.Resolve<IBackgroundJobService>();

            backgroundJob.Configure();

            app.UseRouting();

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
