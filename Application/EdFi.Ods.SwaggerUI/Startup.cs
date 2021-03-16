// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Text.Json;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace EdFi.Ods.SwaggerUI
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            bool useReverseProxyHeaders = Configuration.GetValue("UseReverseProxyHeaders", false);

            services.AddScoped<IConfigureOptions<SwaggerUIOptions>, ConfigureDefaults>();
            services.Configure<SwaggerUIOptions>(
                options =>
                {
                    Configuration.Bind("SwaggerUIOptions", options);
                    options.ConfigObject.AdditionalItems.Add("WebApiVersionUrl", Configuration.GetValue("WebApiVersionUrl", string.Empty));
                });

            services.AddScoped<EdFiSwaggerMiddleware>();

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

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
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
                                    WebApiVersionUrl = Configuration.GetValue("WebApiVersionUrl", string.Empty),
                                    RoutePrefix = Configuration.GetValue("SwaggerUIOptions:RoutePrefix", "swagger"),
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

            app.UseEdFiSwaggerUI();

            app.UseFileServer();
        }
    }
}
