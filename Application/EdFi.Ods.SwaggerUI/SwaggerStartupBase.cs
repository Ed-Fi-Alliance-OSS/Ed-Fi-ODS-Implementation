// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
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
        private readonly string _oneRosterMetadataUrl;

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
            _oneRosterMetadataUrl = Configuration.GetValue("OneRosterMetadataUrl", string.Empty);
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

            if (_enableOneRoster)
            {
                if (string.IsNullOrWhiteSpace(_oneRosterMetadataUrl))
                {
                    throw new InvalidOperationException(
                        "One Roster is enabled, but OneRosterMetadataUrl is not configured.");
                }
                // Allow requests originating from One Roster
                services.AddCors(options =>
                {
                    options.AddPolicy("AllowOneRoster", builder =>
                    {
                        builder.WithOrigins(_oneRosterMetadataUrl)
                               .AllowAnyHeader()
                               .AllowAnyMethod()
                               .AllowCredentials();
                    });
                });
            }
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
                                        OneRosterMetadataUrl = _oneRosterMetadataUrl
                                    }));
                        });
                });
            if (_enableOneRoster)
            {
                ConfigureOneRoster(app);
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
                    options.ConfigObject.AdditionalItems["OneRosterMetadataUrl"] = _oneRosterMetadataUrl;
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

        private void ConfigureOneRoster(IApplicationBuilder app)
        {
            // Same-origin proxy for OneRoster spec to avoid CORS issues when the spec is hosted on another origin.
            app.Map(
                "/specs/oneroster.json", builder =>
                {
                    builder.Run(
                        async context =>
                        {
                            try
                            {
                                using var http = new HttpClient();
                                string oneRosterUrl = _oneRosterMetadataUrl + "/swagger.json";

                                if (string.IsNullOrWhiteSpace(oneRosterUrl))
                                {
                                    context.Response.StatusCode = 500;
                                    await context.Response.WriteAsync("OneRosterMetadataUrl is not configured.");
                                    return;
                                }

                                var specResponse = await http.GetAsync(oneRosterUrl);
                                var specBody = await specResponse.Content.ReadAsStringAsync();

                                if (!specResponse.IsSuccessStatusCode)
                                {
                                    context.Response.StatusCode = (int)specResponse.StatusCode;
                                    await context.Response.WriteAsync(specBody);
                                    return;
                                }

                                // Rewrite servers to point to our same-origin proxy so Try-It-Out uses the proxy
                                try
                                {
                                    JsonObject root = JsonNode.Parse(specBody) as JsonObject;
                                    if (root is null)
                                    {
                                        context.Response.StatusCode = 500;
                                        await context.Response.WriteAsync(specBody);
                                        return;
                                    }

                                    var proxyBase =
                                        $"{context.Request.Scheme}://{context.Request.Host}/proxy/oneroster".TrimEnd('/');

                                    // OpenAPI 3.x
                                    if (root["openapi"] is not null)
                                    {
                                        root["servers"] = new JsonArray(
                                            new JsonObject { ["url"] = proxyBase });
                                    }
                                    // Swagger 2.0
                                    else if ((root["swagger"]?.GetValue<string>() ?? "").StartsWith("2"))
                                    {
                                        root["host"] = context.Request.Host.ToString();
                                        root["schemes"] = new JsonArray(context.Request.Scheme);
                                        root["basePath"] = "/proxy/oneroster";
                                    }
                                    var rewritten = root.ToJsonString(new JsonSerializerOptions { WriteIndented = false });

                                    context.Response.StatusCode = (int)specResponse.StatusCode;
                                    context.Response.ContentType = "application/json";
                                    await context.Response.WriteAsync(rewritten);
                                }
                                catch
                                {
                                    // Fallback: return original spec if rewrite fails
                                    context.Response.StatusCode = (int)specResponse.StatusCode;
                                    context.Response.ContentType = "application/json";
                                    await context.Response.WriteAsync(specBody);
                                }
                            }
                            catch (Exception ex)
                            {
                                context.Response.StatusCode = 500;
                                await context.Response.WriteAsync($"Proxy error: {ex.Message}");
                            }
                        });
                });
            static bool IsHopByHop(string name)
            {
                return name.Equals("Connection", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("Transfer-Encoding", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("Keep-Alive", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("Proxy-Authenticate", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("Proxy-Authorization", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("TE", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("Trailer", StringComparison.OrdinalIgnoreCase)
                       || name.Equals("Upgrade", StringComparison.OrdinalIgnoreCase);
            }

            // Generic pass-through proxy to forward OneRoster API calls to the external origin
            app.Map(
                "/proxy/oneroster", builder =>
                {
                    builder.Run(
                        async context =>
                        {
                            var http = new HttpClient(new SocketsHttpHandler
                            {
                                PooledConnectionLifetime = TimeSpan.FromMinutes(5)
                            });

                            // Resolve the OneRoster spec URL from configuration
                            string oneRosterSpecUrl = _oneRosterMetadataUrl;

                            if (string.IsNullOrWhiteSpace(oneRosterSpecUrl))
                            {
                                context.Response.StatusCode = 500;
                                await context.Response.WriteAsync("OneRosterMetadataUrl is not configured.");
                                return;
                            }

                            // Fetch the OneRoster spec and determine the API server base (OAS3 preferred)
                            try
                            {
                                // Build target URL
                                var baseUri = new Uri(oneRosterSpecUrl.TrimEnd('/') + "/");
                                var relPath = (context.Request.Path.Value ?? string.Empty).TrimStart('/');
                                var target = new Uri(new Uri(baseUri.ToString()), relPath + (context.Request.QueryString.HasValue ? context.Request.QueryString.Value : ""));

                                // Debug headers (optional)
                                context.Response.Headers["X-Proxy-Base"] = baseUri.ToString().TrimEnd('/');
                                context.Response.Headers["X-Proxy-Target"] = target.ToString();

                                using var req = new HttpRequestMessage(new HttpMethod(context.Request.Method), target);

                                // Body (only when present)
                                if (context.Request.ContentLength > 0)
                                {
                                    req.Content = new StreamContent(context.Request.Body);
                                    if (!string.IsNullOrWhiteSpace(context.Request.ContentType))
                                        req.Content.Headers.ContentType = MediaTypeHeaderValue.Parse(context.Request.ContentType);
                                }

                                // Copy headers (skip Host + hop-by-hop)
                                foreach (var h in context.Request.Headers)
                                {
                                    if (h.Key.Equals("Host", StringComparison.OrdinalIgnoreCase) || IsHopByHop(h.Key)) continue;

                                    if (!req.Headers.TryAddWithoutValidation(h.Key, [.. h.Value]))
                                        req.Content?.Headers.TryAddWithoutValidation(h.Key, [.. h.Value]);
                                }

                                // Send + stream response back
                                using var resp = await http.SendAsync(req, HttpCompletionOption.ResponseHeadersRead, context.RequestAborted);
                                context.Response.StatusCode = (int)resp.StatusCode;

                                foreach (var h in resp.Headers)
                                    if (!IsHopByHop(h.Key)) context.Response.Headers[h.Key] = h.Value.ToArray();

                                foreach (var h in resp.Content.Headers)
                                    if (!IsHopByHop(h.Key)) context.Response.Headers[h.Key] = h.Value.ToArray();

                                // Kestrel will handle chunking; avoid duplicating transfer-encoding
                                context.Response.Headers.Remove("transfer-encoding");
                                using var _ = resp.Content.CopyToAsync(context.Response.Body, context.RequestAborted);
                            }
                            catch (Exception ex)
                            {
                                context.Response.StatusCode = 500;
                                await context.Response.WriteAsync($"Proxy error: {ex.Message}");
                            }
                        });
                });
            app.UseCors("AllowOneRoster");
        }
    }
}
