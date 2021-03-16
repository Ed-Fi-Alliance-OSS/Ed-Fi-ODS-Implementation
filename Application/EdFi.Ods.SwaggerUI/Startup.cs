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
using Swashbuckle.AspNetCore.SwaggerUI;

namespace EdFi.Ods.SwaggerUI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            bool useReverseProxyHeaders = Configuration.GetValue<bool>("UseReverseProxyHeaders");

            if (useReverseProxyHeaders)
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

            string pathBase = Configuration.GetValue<string>("PathBase");

            logger.LogInformation($"RoutePrefix = '{routePrefix}'");
            logger.LogInformation($"WebApiUrl = '{webApiUrl}'");
            logger.LogInformation($"UseReverseProxyHeaders = '{Configuration.GetValue<bool>("UseReverseProxyHeaders")}'");
            logger.LogInformation($"PathBase = '{pathBase}'");

            if (!string.IsNullOrEmpty(pathBase))
            {
                var path = pathBase.Trim('/');
                path = "/" + path;
                app.UsePathBase(path);
            }

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

                    options.InjectStylesheet("/swagger.css");

                    options.IndexStream = ()
                        => GetType().Assembly.GetManifestResourceStream("EdFi.Ods.SwaggerUI.Resources.Swashbuckle_index.html");

                    options.RoutePrefix = routePrefix;
                    options.ConfigObject.AdditionalItems["WebApiVersionUrl"] = webApiUrl;
                });

            app.UseStaticFiles();
        }
    }
}
