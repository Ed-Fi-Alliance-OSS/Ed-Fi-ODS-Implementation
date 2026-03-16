using EdFi.OdsApi.Sdk;
using EdFi.OdsApi.Sdk.Client;
using System;
using System.Collections.Generic;
using System.Text;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Authentication
{
    internal class EdFiTokenProvider(Func<BearerTokenResponse> tokenRetriever) : TokenProvider<OAuthToken>([])
    {
        private readonly Func<BearerTokenResponse> _tokenRetriever = tokenRetriever;
        private DateTime _expiresAt;

        protected override ValueTask<OAuthToken> GetAsync(string header = "", CancellationToken cancellation = default)
        {
            // reuse token if not expired
            if (_tokens.Length > 0 && DateTime.UtcNow < _expiresAt)
            {
                return ValueTask.FromResult(_tokens[0]);
            }

            var response = _tokenRetriever();
            var token = new OAuthToken(response.AccessToken);

            // store token in base class array
            _tokens = [token];

            // track expiration
            _expiresAt = DateTime.UtcNow.AddSeconds(response.ExpiresIn - 30);

            return ValueTask.FromResult(token);
        }
    }
}
