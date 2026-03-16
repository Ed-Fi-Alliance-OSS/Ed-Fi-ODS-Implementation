using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Authentication
{
    internal class BearerTokenResponse
    {
        [JsonPropertyName("access_token")]
        public string AccessToken { get; set; } = "";

        [JsonPropertyName("expires_in")]
        public int ExpiresIn { get; set; }

        [JsonPropertyName("token_type")]
        public string TokenType { get; set; } = "";

        [JsonPropertyName("error")]
        public string? Error { get; set; }
    }
}
