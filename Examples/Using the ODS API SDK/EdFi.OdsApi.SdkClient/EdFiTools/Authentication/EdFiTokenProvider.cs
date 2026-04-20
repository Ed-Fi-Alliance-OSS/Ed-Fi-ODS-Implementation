// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.OdsApi.Sdk;
using EdFi.OdsApi.Sdk.Client;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Authentication
{
    internal class EdFiTokenProvider(Func<Task<BearerTokenResponse>> tokenRetriever) : TokenProvider<OAuthToken>([])
    {
        private readonly Func<Task<BearerTokenResponse>> _tokenRetriever = tokenRetriever;
        private DateTime _expiresAt;

        protected override async ValueTask<OAuthToken> GetAsync(string header = "", CancellationToken cancellation = default)
        {
            if (_tokens.Length > 0 && DateTime.UtcNow < _expiresAt)
                return _tokens[0];

            var response = await _tokenRetriever();
            var token = new OAuthToken(response.AccessToken);

            _tokens = [token];
            _expiresAt = DateTime.UtcNow.AddSeconds(response.ExpiresIn - 30);

            return token;
        }
    }
}
