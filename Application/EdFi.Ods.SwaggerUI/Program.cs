// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EdFi.Ods.SwaggerUI
{
    public class Program
    {
        private const string MissingStartupClassMessage =
            "Could not find the startup class. No loaded class member could be found matching the configured startup class name '{0}'.";
        private const string DefaultStartupClassName = "Startup";

        public static async Task Main(string[] args)
        {
            await CreateHostBuilder(args).Build().RunAsync();
        }

        private static IHostBuilder CreateHostBuilder(string[] args)
        {
            var startupClassName = GetStartupClassName(args);
            var startupType = FindStartupClassType(startupClassName);

            return Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(
                    webBuilder =>
                    {
                        webBuilder.ConfigureKestrel(
                            serverOptions =>
                            {
                                serverOptions.AddServerHeader = false;
                            });
                        webBuilder.UseStartup(startupType);
                    });
        }

        private static string GetStartupClassName(string[] args)
        {
            using var hostBuilder = Host.CreateDefaultBuilder(args).Build();
            var config = hostBuilder.Services.GetService<IConfiguration>();
            return config?.GetSection("SwaggerUIOptions").GetValue<string>("StartupClassName") ?? DefaultStartupClassName;
        }

        private static Type FindStartupClassType(string startupClassName)
        {
            var startupType = AppDomain.CurrentDomain.GetAssemblies()
                .SelectMany(assembly => assembly.GetTypes())
                .FirstOrDefault(t => t.Name == startupClassName);

            if (startupType == null)
            {
                throw new MissingMemberException(string.Format(MissingStartupClassMessage, startupClassName));
            }

            return startupType;
        }
    }
}
