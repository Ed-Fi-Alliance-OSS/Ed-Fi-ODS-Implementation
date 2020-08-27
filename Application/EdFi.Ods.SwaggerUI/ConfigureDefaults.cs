// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace EdFi.Ods.SwaggerUI
{
    public class ConfigureDefaults : IConfigureOptions<SwaggerUIOptions>
    {
        public void Configure(SwaggerUIOptions options)
        {
            AddDefaults(options);
        }

        private void AddDefaults(SwaggerUIOptions options)
        {
            options.RoutePrefix = "swagger";
            options.DocumentTitle = "Ed-Fi ODS API Documentation";

            options.OAuthScopeSeparator(" ");
            options.OAuthAppName(Assembly.GetExecutingAssembly().GetName().Name);

            options.DocExpansion(DocExpansion.None);
            options.DisplayRequestDuration();
            options.ShowExtensions();
            options.EnableValidator();

            options.InjectStylesheet(
                string.IsNullOrWhiteSpace(options.RoutePrefix)
                    ? "./swagger.css"
                    : "../swagger.css");
        }
    }
}
