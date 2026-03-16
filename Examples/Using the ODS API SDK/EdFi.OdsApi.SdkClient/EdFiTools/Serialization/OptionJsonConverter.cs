using EdFi.OdsApi.Sdk.Client;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Serialization
{
    public class OptionJsonConverter<T> : JsonConverter<Option<T>>
    {
        public override Option<T> Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            // If JSON is null, treat as default value but still mark IsSet = true
            if (reader.TokenType == JsonTokenType.Null)
                return new Option<T>(default!);

            // Deserialize the underlying type T
            var value = JsonSerializer.Deserialize<T>(ref reader, options);
            return new Option<T>(value!); // marks IsSet = true
        }

        public override void Write(Utf8JsonWriter writer, Option<T> value, JsonSerializerOptions options)
        {
            JsonSerializer.Serialize(writer, value.Value, options);
        }
    }
}
