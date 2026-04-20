// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Runtime.CompilerServices;
using System.Text.Json;
using System.Text.Json.Serialization.Metadata;

namespace EdFi.OdsApi.SdkClient.EdFiTools.Serialization
{
    internal class EdFiModelResolver : DefaultJsonTypeInfoResolver
    {
        public override JsonTypeInfo GetTypeInfo(Type type, JsonSerializerOptions options)
        {
            var ti = base.GetTypeInfo(type, options);

            if (type.Namespace != null && type.Namespace.StartsWith("EdFi.OdsApi.Sdk.Models"))
                ti.CreateObject = () => RuntimeHelpers.GetUninitializedObject(type);

            return ti;
        }
    }
}
