// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.OdsApi.Sdk.Client;
using System.Text.Json;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Serialization
{
    internal class EdFiJsonOptions
    {
        public static JsonSerializerOptions Create()
        {
            return new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
                TypeInfoResolver = new EdFiModelResolver(),
                Converters =
                {
                    new DateOnlyJsonConverter(),
                    new DateOnlyNullableJsonConverter(),
                    new DateTimeJsonConverter(),
                    new DateTimeNullableJsonConverter(),
                    new OptionJsonConverterFactory()
                }
            };
        }
    }
}
