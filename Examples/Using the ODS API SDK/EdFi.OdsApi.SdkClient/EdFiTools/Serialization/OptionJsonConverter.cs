// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.OdsApi.Sdk.Client;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Serialization
{
    public class OptionJsonConverter<T> : JsonConverter<Option<T>>
    {
        public override Option<T> Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            if (reader.TokenType == JsonTokenType.Null)
                return new Option<T>(default!);

            var value = JsonSerializer.Deserialize<T>(ref reader, options);
            return new Option<T>(value!);
        }

        public override void Write(Utf8JsonWriter writer, Option<T> value, JsonSerializerOptions options)
        {
            JsonSerializer.Serialize(writer, value.Value, options);
        }
    }
}
