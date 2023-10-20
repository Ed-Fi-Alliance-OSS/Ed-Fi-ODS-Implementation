// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
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
        private string _routePrefix;
        private const string DefaultRoutePrefix = "swagger";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            _useReverseProxyHeaders = Configuration.GetValue<bool>("UseReverseProxyHeaders");

            var pathBase = Configuration.GetValue<string>("PathBase");
            _routePrefix = Configuration.GetValue("SwaggerUIOptions:RoutePrefix", DefaultRoutePrefix);

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

            services.AddHealthChecks();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILogger<Startup> logger)
        {
            string webApiUrl = Configuration.GetValue("WebApiVersionUrl", string.Empty);
            var tenants = Configuration.GetSection("Tenants").Get<List<Tenants>>() ?? new List<Tenants>();
            string swaggerStyleSheetPath = "../swagger.css";

            if (!string.IsNullOrEmpty(_pathBase))
            {
                app.UsePathBase(_pathBase);
            }

            if (_useReverseProxyHeaders)
            {
                app.UseForwardedHeaders();
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
                                        RoutePrefix = _routePrefix,
                                        Tenants = tenants
                                    }));
                        });
                });

            logger.LogInformation($"WebApiUrl = '{webApiUrl}'");
            logger.LogInformation($"UseReverseProxyHeaders = '{_useReverseProxyHeaders}'");
            logger.LogInformation($"PathBase = '{_pathBase}'");
            logger.LogInformation($"SwaggerStyleSheetPath = '{swaggerStyleSheetPath}'");

            // routes for swagger: http://server/PATHBASE/ROUTEPREFIX/index.html
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
                    options.RoutePrefix = _routePrefix;
                });

            app.UseDefaultFiles();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHealthChecks("/health");
            });
        }
    }
}
