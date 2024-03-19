// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Autofac.Extensions.DependencyInjection;
using EdFi.Common.Extensions;
using log4net;
using log4net.Config;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace EdFi.Ods.WebApi
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            ConfigureLogging(args.Any(x => x.EqualsIgnoreCase("development")));

            var logger = LogManager.GetLogger(typeof(Program));
            logger.Debug("Loading configuration files");

            var host = Host.CreateDefaultBuilder(args)
                .UseServiceProviderFactory(new AutofacServiceProviderFactory())
                .ConfigureWebHostDefaults(
                    webBuilder =>
                    {
                        webBuilder.ConfigureKestrel(
                            serverOptions => { serverOptions.AddServerHeader = false; });

                        webBuilder.UseStartup<Startup>();
                    }).Build();

            await host.RunAsync();

            static void ConfigureLogging(bool isDevelopment)
            {
                var assembly = typeof(Program).GetTypeInfo().Assembly;

                string configPath = Path.Combine(
                    Path.GetDirectoryName(assembly.Location), isDevelopment
                        ? "log4net.development.config"
                        : "log4net.config");

                XmlConfigurator.Configure(LogManager.GetRepository(assembly), new FileInfo(configPath));
            }
        }
    }
}
