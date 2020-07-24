// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using Autofac;
using Autofac.Core;
using Autofac.Extensions.DependencyInjection;
using EdFi.Ods.Api.Common.Caching;
using EdFi.Ods.Api.Common.Configuration;
using EdFi.Ods.Api.Common.Constants;
using EdFi.Ods.Api.Common.Container;
using EdFi.Ods.Api.Common.Dependencies;
using EdFi.Ods.Api.Common.ExternalTasks;
using EdFi.Ods.Api.Common.Infrastructure.Extensibility;
using EdFi.Ods.Api.NetCore.InversionOfControl;
using EdFi.Ods.Api.NetCore.MediaTypeFormatters;
using EdFi.Ods.Api.NetCore.Middleware;
using EdFi.Ods.Common.Caching;
using EdFi.Ods.Common.InversionOfControl;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Resource;
using EdFi.Ods.Common.Security.Claims;
using log4net;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Net.Http.Headers;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace EdFi.Ods.WebApi.NetCore
{
    public class Startup : EdFi.Ods.Api.NetCore.Startup.StartupBase
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(Startup));

        public Startup(IWebHostEnvironment env)
        {
            _logger.Debug("Loading configuration files");

            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();

            InitalizeStartup(builder);

            _logger.Debug($"built configuration = {Configuration}");
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            // Serves Open API Metadata json files when enabled.
            if (ApiSettings.IsFeatureEnabled(ApiFeature.OpenApiMetadata.GetConfigKeyName()))
            {
                app.UseOpenApiMetadata();
            }

            ConfigureStartup(app, env, loggerFactory);
        }
    }
}
