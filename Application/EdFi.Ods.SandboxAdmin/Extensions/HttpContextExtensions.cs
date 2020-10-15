// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Configuration;
using System;
using Microsoft.AspNetCore.Http;

namespace EdFi.Ods.SandboxAdmin.Extensions
{
    public static class HttpContextExtensions
    {
        public static string UseReverseProxyHeadersConfigKey = "UseReverseProxyHeaders";
        private static readonly Lazy<bool> _useProxyHeaders = new Lazy<bool>(SetProxyHeaderConfigValue);

        private const string XForwardedProto = "X-Forwarded-Proto";
        private const string XForwardedHost = "X-Forwarded-Host";
        private const string XForwardedPort = "X-Forwarded-Port";

        public static string ToAbsolutePath(this string relativePath, HttpRequest request, string hashFragment = null)
        {
            string path;
            string query;

            if (relativePath == "~")
            {
                path = request.PathBase.Value.Trim('/');
                query = string.Empty;
            }
            else
            {
                var pathAndQuery = relativePath.Split(
                    new[]
                    {
                        '?'
                    },
                    2);

                path = pathAndQuery[0];
                query = pathAndQuery[1];
            }

            var absolutePathBuilder = new UriBuilder
            {
                Scheme = request.Scheme(_useProxyHeaders.Value),
                Host = request.Host.Host,
                Port = request.Port(_useProxyHeaders.Value),
                Path = path,
                Query = query,
                Fragment = string.IsNullOrWhiteSpace(hashFragment)
                                                  ? string.Empty
                                                  : hashFragment
            };

            return absolutePathBuilder.Uri.ToString()
                                      .TrimEnd('/');
        }

        public static string Scheme(this HttpRequest request, bool useProxyHeaders = false)
        {
            string scheme = request.Scheme;

            if (!useProxyHeaders)
            {
                return scheme;
            }

            string proxyHeaderValue = GetHeaderValue(request, XForwardedProto);

            // Pass through for any value provided, null means header wasn't found so default to request
            if (proxyHeaderValue != null)
            {
                scheme = proxyHeaderValue;
            }

            return scheme;
        }

        public static int Port(this HttpRequest request, bool useProxyHeaders = false)
        {
            var defaultPortForScheme = Scheme(request, useProxyHeaders) == "https"
                ? 443
                : 80;

            if (!useProxyHeaders)
            {
                return request.Host.Port ?? defaultPortForScheme;
            }

            if (!int.TryParse(GetHeaderValue(request, XForwardedPort), out int port))
            {
                port = request.Host.Port ?? defaultPortForScheme;
            }

            return port;
        }

        private static string GetHeaderValue(HttpRequest request, string headerName)
        {
            var values = request.Headers[headerName];

            return values;
        }

        public static string Host(this HttpRequest request, bool useProxyHeaders = false)
        {
            string host = request.Host.Value;

            if (!useProxyHeaders)
            {
                return host;
            }

            string proxyHeaderValue = GetHeaderValue(request, XForwardedHost);

            if (proxyHeaderValue != null)
            {
                host = proxyHeaderValue;
            }

            return host;
        }

        private static bool SetProxyHeaderConfigValue()
        {
            bool tempConfigValue;
            bool.TryParse(ConfigurationManager.AppSettings[UseReverseProxyHeadersConfigKey], out tempConfigValue);
            return tempConfigValue;
        }

        public static bool IsAjaxRequest(this HttpRequest request)
        {
            if (request == null)
                throw new ArgumentNullException("request");
            if (request.Headers != null)
                return request.Headers["X-Requested-With"] == "XMLHttpRequest";
            return false;
        }
    }
}
