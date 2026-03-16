// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.OdsApi.Sdk;
using EdFi.OdsApi.Sdk.Client;
using System.Net;
using System.Runtime.Serialization;
using System.Security.Authentication;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Authentication
{
    internal class TokenRetriever
    {
        private readonly string _basePath;
        private readonly string _clientKey;
        private readonly string _clientSecret;

        public TokenRetriever(string basePath, string clientKey, string clientSecret)
        {
            _basePath = basePath;
            _clientKey = clientKey;
            _clientSecret = clientSecret;
        }

        public async Task<BearerTokenResponse> ObtainNewBearerToken()
        {
            using var httpClient = new HttpClient();
            var form = new FormUrlEncodedContent(new[]
            {
                new KeyValuePair<string, string>("grant_type", "client_credentials"),
                new KeyValuePair<string, string>("client_id", _clientKey),
                new KeyValuePair<string, string>("client_secret", _clientSecret)
            });

            var response = await httpClient.PostAsync($"{_basePath}/oauth/token", form);
            response.EnsureSuccessStatusCode();

            var json = await response.Content.ReadAsStringAsync();

            var tokenResponse = JsonSerializer.Deserialize<BearerTokenResponse>(
                json,
                new JsonSerializerOptions(JsonSerializerDefaults.Web)
            );

            if (tokenResponse == null || string.IsNullOrEmpty(tokenResponse.AccessToken))
                throw new InvalidOperationException("Failed to retrieve access token.");

            return tokenResponse;
        }
    }

  

    
}