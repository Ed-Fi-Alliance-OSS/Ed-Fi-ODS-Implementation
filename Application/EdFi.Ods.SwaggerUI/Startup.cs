// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Text.Json;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace EdFi.Ods.SwaggerUI
{
    public class Startup
    {
        private readonly bool _useReverseProxyHeaders;
        private readonly string _pathBase;

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            _useReverseProxyHeaders = Configuration.GetValue<bool>("UseReverseProxyHeaders");

            string pathBase = Configuration.GetValue<string>("PathBase");

            if (!string.IsNullOrEmpty(pathBase))
            {
                _pathBase = "/" + pathBase.Trim('/');
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
            string routePrefix = Configuration.GetValue("SwaggerUIOptions:RoutePrefix", "swagger");
            string webApiUrl = Configuration.GetValue("WebApiVersionUrl", string.Empty);
            string swaggerStyleSheetPath = _pathBase + "/swagger.css";

            logger.LogInformation($"RoutePrefix = '{routePrefix}'");
            logger.LogInformation($"WebApiUrl = '{webApiUrl}'");
            logger.LogInformation($"UseReverseProxyHeaders = '{_useReverseProxyHeaders}'");
            logger.LogInformation($"PathBase = '{_pathBase}'");
            logger.LogInformation($"SwaggerStyleSheetPath = '{swaggerStyleSheetPath}'");

            void AppSettingsDelegate(IApplicationBuilder app)
            {
                app.Run(
                    async context =>
                    {
                        context.Response.ContentType = "application/json";

                        await context.Response.WriteAsync(
                            JsonSerializer.Serialize(
                                new
                                {
                                    WebApiVersionUrl = webApiUrl,
                                    RoutePrefix = routePrefix
                                }));
                    });
            }

            if (!string.IsNullOrEmpty(_pathBase))
            {
                app.UsePathBase(_pathBase);
            }

            app.UseForwardedHeaders();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }

            app.Map("/appSettings.json", AppSettingsDelegate);

            app.UseSwaggerUI(
                options =>
                {
                    Configuration.Bind("SwaggerUIOptions", options);

                    options.InjectStylesheet(swaggerStyleSheetPath);

                    options.IndexStream = ()
                        => GetType().Assembly.GetManifestResourceStream("EdFi.Ods.SwaggerUI.Resources.Swashbuckle_index.html");

                    options.RoutePrefix = routePrefix;
                    options.ConfigObject.AdditionalItems["WebApiVersionUrl"] = webApiUrl;
                });

            app.UseDefaultFiles();
            app.UseStaticFiles();
        }
    }
}
