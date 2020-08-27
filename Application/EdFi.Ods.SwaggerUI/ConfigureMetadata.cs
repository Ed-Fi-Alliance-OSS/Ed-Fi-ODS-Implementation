// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace EdFi.Ods.SwaggerUI
{
    public class ConfigureMetadata : IConfigureOptions<SwaggerUIOptions>
    {
        private readonly ILogger _logger;

        public ConfigureMetadata(ILogger<ConfigureMetadata> logger)
        {
            _logger = logger;
        }

        public void Configure(SwaggerUIOptions options)
        {
            AddMetadataEndpoints(options);
        }

        private void AddMetadataEndpoints(SwaggerUIOptions options)
        {
            if (!options.ConfigObject.AdditionalItems.TryGetValue("WebApiVersionUrl", out object webApiVersionUrl))
            {
                _logger.LogError($"'WebApiVersionUrl' property in appsettings.json was not found, skipping metadata retrieval.");
                return;
            }

            try
            {
                using var httpClient = new HttpClient();

                var versionResponse = httpClient
                    .GetStreamAsync(webApiVersionUrl.ToString())
                    .GetAwaiter()
                    .GetResult();

                using JsonDocument versionJson = JsonDocument
                    .ParseAsync(versionResponse)
                    .GetAwaiter()
                    .GetResult();

                var metadataUrl = versionJson
                    .RootElement
                    .GetProperty("urls")
                    .GetProperty("openApiMetadata")
                    .GetString();

                var metadataResponse = httpClient
                    .GetStreamAsync(metadataUrl)
                    .GetAwaiter()
                    .GetResult();

                using JsonDocument metadataJson = JsonDocument
                    .ParseAsync(metadataResponse)
                    .GetAwaiter()
                    .GetResult();

                metadataJson
                    .RootElement
                    .EnumerateArray()
                    .ToList()
                    .ForEach(
                        x =>
                        {
                            options.SwaggerEndpoint(
                                x.GetProperty("EndpointUri").GetString(),
                                x.GetProperty("Name").GetString());
                        });
            }
            catch (Exception ex)
            {
                _logger.LogError(
                    $"Failed to retrieve version from: {webApiVersionUrl}{Environment.NewLine}" +
                    $"Please ensure that the 'WebApiVersionUrl' property in appsettings.json is configured properly.{Environment.NewLine}{Environment.NewLine}" +
                    $"{ex}");
            }
        }
    }
}
