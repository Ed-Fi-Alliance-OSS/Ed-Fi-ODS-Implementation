// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using Microsoft.AspNetCore.Http;

namespace EdFi.Ods.Sandbox.Admin.Extensions
{
    public static class RelativePathExtensions
    {
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

            int defaultPortForScheme = request.Scheme == "https"
                ? 443
                : 80;

            var absolutePathBuilder = new UriBuilder
            {
                Scheme = request.Scheme,
                Host = request.Host.Host,
                Port = request.Host.Port ?? defaultPortForScheme,
                Path = path,
                Query = query,
                Fragment = string.IsNullOrWhiteSpace(hashFragment)
                                                  ? string.Empty
                                                  : hashFragment
            };

            return absolutePathBuilder.Uri.ToString()
                                      .TrimEnd('/');
        }

        public static bool IsAjaxRequest(this HttpRequest request)
        {
            if (request == null)
            {
                throw new ArgumentNullException(nameof(request));
            }

            if (request.Headers != null)
            {
                return request.Headers["X-Requested-With"] == "XMLHttpRequest";
            }

            return false;
        }
    }
}
