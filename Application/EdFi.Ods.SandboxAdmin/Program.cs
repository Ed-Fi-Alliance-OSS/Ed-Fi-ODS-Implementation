using System;
using System.IO;
using System.Reflection;
using System.Threading.Tasks;
using Autofac.Extensions.DependencyInjection;
using log4net;
using log4net.Config;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace EdFi.Ods.SandboxAdmin
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            ConfigureLogging();

            var _logger = LogManager.GetLogger(typeof(Program));
            _logger.Debug("Loading configuration files");

            

            var host = Host.CreateDefaultBuilder(args)
                        _logger.Debug($"Environment: {hostBuilderContext.HostingEnvironment.EnvironmentName}");
                .UseServiceProviderFactory(new AutofacServiceProviderFactory())
                .ConfigureWebHostDefaults(
                    webBuilder =>
                    {
                        webBuilder.ConfigureKestrel(serverOptions => serverOptions.AddServerHeader = false);
                        webBuilder.UseStartup<Startup>();
                    }).Build();

            await host.RunAsync();

            static void ConfigureLogging()
            {
                var assembly = typeof(Program).GetTypeInfo().Assembly;

                string configPath = Path.Combine(Path.GetDirectoryName(assembly.Location), "log4net.config");

                XmlConfigurator.Configure(LogManager.GetRepository(assembly), new FileInfo(configPath));
            }
        }
    }
}
