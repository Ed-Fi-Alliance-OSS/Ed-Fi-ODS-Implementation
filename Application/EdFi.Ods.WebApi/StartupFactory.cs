// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.Api.Startup;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;

namespace EdFi.Ods.WebApi
{
    public static class StartupFactory
    {
       
        private const string MissingStartupClassMessage =
            "Could not find the startup class. No loaded class member could be found matching the configured startup class name '{0}'.";
        private const string DefaultStartupClassName = "Startup";
        public static OdsStartupBase GetStartup(WebHostBuilderContext webHostBuilderContext)
        {

            var config = new ConfigurationBuilder()
                               .SetBasePath(Directory.GetCurrentDirectory())
                               .AddJsonFile("appsettings.json", optional: false)
                               .AddJsonFile($"appsettings.{webHostBuilderContext.HostingEnvironment.EnvironmentName}.json", optional: true)
                               .Build();

            string startupClassName = config.GetValue<string>("StartUpClassName")?? DefaultStartupClassName;
          
            var type = FindStartupClassType(startupClassName);
            OdsStartupBase startup = (OdsStartupBase)Activator.CreateInstance(type, webHostBuilderContext.HostingEnvironment, webHostBuilderContext.Configuration);
            return startup;
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