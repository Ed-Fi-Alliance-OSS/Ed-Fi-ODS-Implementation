using EdFi.OdsApi.Sdk.Client;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Serialization
{
    public class EdFiJsonOptions
    {
        public static JsonSerializerOptions Create()
        {
            var jsonOptions = new JsonSerializerOptions()
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


            return jsonOptions;
        }
    }
}
