// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading.Tasks;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Amazon.Extensions.Configuration.SystemsManager;
using Amazon.Extensions.NETCore.Setup;
using EdFi.Ods.Api.Configuration;
using EdFi.Ods.Common.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Primitives;

namespace EdFi.Ods.WebApi
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            CacheSettings cacheSettings = GetCacheSettings();

            var hostBuilder = Host.CreateDefaultBuilder(args)
                .ConfigureLogging(ConfigureLogging)
                .UseServiceProviderFactory(new AutofacServiceProviderFactory())
                .ConfigureAppConfiguration(c => c.AddSystemsManager("/appsettings/tenantsSection", TimeSpan.FromSeconds(cacheSettings.Tenants.AbsoluteExpirationSeconds)))
                .ConfigureWebHostDefaults(
                    webBuilder =>
                    {
                        webBuilder.ConfigureKestrel(
                            serverOptions => { serverOptions.AddServerHeader = false; });

                        webBuilder.UseStartup<Startup>();
                    });

            var host = hostBuilder.Build();

            AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

            await host.RunAsync();

            static void ConfigureLogging(HostBuilderContext hostBuilderContext, ILoggingBuilder loggingBuilder)
            {
                var loggingOptions = hostBuilderContext.Configuration.GetSection("Log4NetCore")
                    .Get<Log4NetProviderOptions>()
                    ?? new Log4NetProviderOptions
                    {
                        Log4NetConfigFileName = hostBuilderContext.HostingEnvironment.IsDevelopment()
                            ? "log4net.development.config"
                            : "log4net.config"
                    };

                loggingBuilder.AddLog4Net(loggingOptions);
            }

            CacheSettings GetCacheSettings()
            {
                var hostBuilderForConfig = Host.CreateDefaultBuilder(args);
                var preliminaryHost = hostBuilderForConfig.Build();
                var configuration = preliminaryHost.Services.GetService<IConfiguration>();

                var cacheSettings = new CacheSettings();
                configuration.Bind("ApiSettings:Caching", cacheSettings);

                return cacheSettings;
            }
        }
    }
}
