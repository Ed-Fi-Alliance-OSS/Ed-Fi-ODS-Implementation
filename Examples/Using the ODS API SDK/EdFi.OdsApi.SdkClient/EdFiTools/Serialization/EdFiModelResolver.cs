using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization.Metadata;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Serialization
{
    public class EdFiModelResolver : DefaultJsonTypeInfoResolver
    {
        public override JsonTypeInfo GetTypeInfo(Type type, JsonSerializerOptions options)
        {
            var ti = base.GetTypeInfo(type, options);

            // only apply to Ed-Fi models
            if (type.Namespace != null &&
                type.Namespace.StartsWith("EdFi.OdsApi.Sdk.Models"))
            {
                // disable constructor usage
                ti.CreateObject = () =>
                    FormatterServices.GetUninitializedObject(type);
            }

            return ti;
        }
    }
}
