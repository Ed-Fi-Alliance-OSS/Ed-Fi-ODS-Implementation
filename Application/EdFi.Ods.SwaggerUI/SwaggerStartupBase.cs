// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Reflection;
using System.Text.Json;
using System.Text.Json.Nodes;
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
    public abstract class SwaggerStartupBase
    {
        private readonly bool _useReverseProxyHeaders;
        private readonly string _pathBase;
        private readonly string _routePrefix;
        private const string DefaultRoutePrefix = "swagger";
        private readonly bool _enableOneRoster;
        private readonly string _OneRosterVersionUrl;

        protected SwaggerStartupBase(IConfiguration configuration)
        {
            Configuration = configuration;
            _useReverseProxyHeaders = Configuration.GetValue<bool>("UseReverseProxyHeaders");

            var pathBase = Configuration.GetValue<string>("PathBase");
            _routePrefix = Configuration.GetValue("SwaggerUIOptions:RoutePrefix", DefaultRoutePrefix);

            if (!string.IsNullOrEmpty(pathBase))
            {
                _pathBase = "/" + pathBase.Trim('/');
            }

            _enableOneRoster = Configuration.GetValue("EnableOneRoster", false);
            _OneRosterVersionUrl = Configuration.GetValue("OneRosterVersionUrl", string.Empty);
        }

        private IConfiguration Configuration { get; }

        public virtual void ConfigureServices(IServiceCollection services)
        {
            if (_useReverseProxyHeaders)
            {
                services.Configure<ForwardedHeadersOptions>(
                    options =>
                    {
                        options.ForwardedHeaders = ForwardedHeaders.XForwardedFor
                                                   | ForwardedHeaders.XForwardedHost
                                                   | ForwardedHeaders.XForwardedProto;

                        // Accept forwarded headers from any network and proxy
                        options.KnownNetworks.Clear();
                        options.KnownProxies.Clear();
                    });
            }

            services.AddHealthChecks();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILogger<Startup> logger)
        {
            string webApiUrl = Configuration.GetValue("WebApiVersionUrl", string.Empty);
            string sandboxDisclaimer = Configuration.GetValue("SandboxDisclaimer", string.Empty);
            bool showDomains = Configuration.GetValue("SwaggerUIOptions:ShowDomains", true);
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
                                        Tenants = tenants,
                                        SandboxDisclaimer = sandboxDisclaimer,
                                        ShowDomains = showDomains,
                                        EnableOneRoster = _enableOneRoster,
                                        OneRosterVersionUrl = _OneRosterVersionUrl
                                    }));
                        });
                });
            if (_enableOneRoster)
            {
                ConfigureOneRoster(app, logger);
            }
            logger.LogInformation($"SandboxDisclaimer = '{sandboxDisclaimer}'");
            logger.LogInformation($"WebApiUrl = '{webApiUrl}'");
            logger.LogInformation($"ShowDomains = '{showDomains}'");
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
                    options.ConfigObject.AdditionalItems["ShowDomains"] = showDomains;
                    options.ConfigObject.AdditionalItems["EnableOneRoster"] = _enableOneRoster;
                    options.ConfigObject.AdditionalItems["OneRosterVersionUrl"] = _OneRosterVersionUrl;
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

        // Configures OneRoster spec
        private void ConfigureOneRoster(IApplicationBuilder app, ILogger logger)
        {
            // Serve the OneRoster spec as-is, using the servers from the spec document
            app.Map(
                "/specs/oneroster.json", builder =>
                {
                    builder.Run(
                        async context =>
                        {
                            try
                            {
                                using var http = new HttpClient();
                                if (string.IsNullOrWhiteSpace(_OneRosterVersionUrl))
                                {
                                    context.Response.StatusCode = 500;
                                    await context.Response.WriteAsync("OneRosterVersionUrl is not configured.");
                                    return;
                                }
                                // Load the metadata document (expected shape contains { urls: { openApiMetadata: "..." } })
                                string specUrl = null;
                                try
                                {
                                    var metaResponse = await http.GetAsync(_OneRosterVersionUrl);
                                    var metaBody = await metaResponse.Content.ReadAsStringAsync();
                                    if (metaResponse.IsSuccessStatusCode)
                                    {
                                        var metaRoot = JsonNode.Parse(metaBody) as JsonObject;
                                        specUrl = metaRoot?["urls"]?["openApiMetadata"]?.GetValue<string>();
                                    }
                                }
                                catch(Exception ex)
                                {
                                    logger.LogWarning($"Failed to fetch or parse OneRoster metadata; falling back to conventional spec URL. Error: {ex.Message}");
                                }

                                if (string.IsNullOrWhiteSpace(specUrl))
                                {
                                    specUrl = _OneRosterVersionUrl.TrimEnd('/') + "/swagger.json";
                                }

                                var specResponse = await http.GetAsync(specUrl);
                                var specBody = await specResponse.Content.ReadAsStringAsync();

                                context.Response.StatusCode = (int)specResponse.StatusCode;
                                context.Response.ContentType = "application/json";
                                await context.Response.WriteAsync(specBody);
                            }
                            catch (Exception ex)
                            {
                                context.Response.StatusCode = 500;
                                await context.Response.WriteAsync($"Error: {ex.Message}");
                            }
                        });
                });
        }
    }
}
