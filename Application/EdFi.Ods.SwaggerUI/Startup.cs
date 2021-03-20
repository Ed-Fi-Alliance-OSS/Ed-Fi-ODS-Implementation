// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Reflection;
using System.Text.Json;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace EdFi.Ods.SwaggerUI
{
    public class Startup
    {
        private readonly bool _useReverseProxyHeaders;
        private readonly string _pathBase;
        private readonly string _routePrefix;

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            _useReverseProxyHeaders = Configuration.GetValue<bool>("UseReverseProxyHeaders");

            _routePrefix = Configuration.GetValue<string>("RoutePrefix");

            if (!string.IsNullOrEmpty(_routePrefix))
            {
                _pathBase = "/" + _routePrefix.Trim('/');
            }
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            if (_useReverseProxyHeaders)
            {
                services.Configure<ForwardedHeadersOptions>(
                    options =>
                    {
                        options.ForwardedHeaders = ForwardedHeaders.XForwardedFor
                                                   & ForwardedHeaders.XForwardedHost
                                                   & ForwardedHeaders.XForwardedProto;
                    });
            }
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILogger<Startup> logger)
        {
            string webApiUrl = Configuration.GetValue("WebApiVersionUrl", string.Empty);
            string swaggerStyleSheetPath = "/swagger.css";

            if (!string.IsNullOrEmpty(_pathBase))
            {
                app.UsePathBase(_pathBase);

                // specific for staging
                swaggerStyleSheetPath = "../swagger.css";
            }

            if (_useReverseProxyHeaders)
            {
                app.UseForwardedHeaders();
                swaggerStyleSheetPath = _pathBase + "/swagger.css";
            }

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }

            app.Map(
                "/appSettings.json", builder =>
                {
                    builder.Run(
                        async context =>
                        {
                            context.Response.ContentType = "application/json";

                            await context.Response.WriteAsync(
                                JsonSerializer.Serialize(
                                    new
                                    {
                                        WebApiVersionUrl = webApiUrl,
                                        RoutePrefix = _routePrefix ?? "swagger"
                                    }));
                        });
                });

            logger.LogInformation($"RoutePrefix = '{_routePrefix}'");
            logger.LogInformation($"WebApiUrl = '{webApiUrl}'");
            logger.LogInformation($"UseReverseProxyHeaders = '{_useReverseProxyHeaders}'");
            logger.LogInformation($"PathBase = '{_pathBase}'");
            logger.LogInformation($"SwaggerStyleSheetPath = '{swaggerStyleSheetPath}'");

            app.UseSwaggerUI(
                options =>
                {
                    Configuration.Bind("SwaggerUIOptions", options);

                    options.DocumentTitle = "Ed-Fi ODS API Documentation";

                    options.OAuthScopeSeparator(" ");
                    options.OAuthAppName(Assembly.GetExecutingAssembly().GetName().Name);
                    options.DocExpansion(DocExpansion.None);
                    options.DisplayRequestDuration();
                    options.ShowExtensions();
                    options.EnableValidator();
                    options.InjectStylesheet(swaggerStyleSheetPath);

                    options.IndexStream = ()
                        => GetType().Assembly.GetManifestResourceStream("EdFi.Ods.SwaggerUI.Resources.Swashbuckle_index.html");

                    options.ConfigObject.AdditionalItems["WebApiVersionUrl"] = webApiUrl;

                    // default behavior requires "swagger"
                    options.RoutePrefix = _routePrefix ?? "swagger";
                });

            app.UseDefaultFiles();
            app.UseStaticFiles();
        }
    }
}
