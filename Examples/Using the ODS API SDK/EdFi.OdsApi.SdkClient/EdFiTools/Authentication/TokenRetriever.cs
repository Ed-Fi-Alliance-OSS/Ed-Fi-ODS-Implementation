// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Text.Json;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Authentication
{
    internal class TokenRetriever
    {
        private readonly string _basePath;
        private readonly string _clientKey;
        private readonly string _clientSecret;
        private readonly HttpClient _httpClient;

        public TokenRetriever(string basePath, string clientKey, string clientSecret, HttpClient httpClient)
        {
            _basePath = basePath;
            _clientKey = clientKey;
            _clientSecret = clientSecret;
            _httpClient = httpClient;
        }

        public async Task<BearerTokenResponse> ObtainNewBearerToken()
        {
            var form = new FormUrlEncodedContent(new[]
            {
                new KeyValuePair<string, string>("grant_type", "client_credentials"),
                new KeyValuePair<string, string>("client_id", _clientKey),
                new KeyValuePair<string, string>("client_secret", _clientSecret)
            });

            var response = await _httpClient.PostAsync($"{_basePath}/oauth/token", form);
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
