// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using CommandLine;
using EdFi.OdsApi.Sdk.Client;
using System.Runtime.Serialization;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.Json.Serialization.Metadata;

namespace EdFi.OdsApi.SdkClient
{
    internal class Options
    {
        [Option('u', "url", Required = true, HelpText = "The base URL of the ODS API.")]
        public required string OdsApiUrl { get; set; }

        [Option('k', "key", Required = true, HelpText = "The client key.")]
        public required string ClientKey { get; set; }

        [Option('s', "secret", Required = true, HelpText = "The client secret.")]
        public required string ClientSecret { get; set; }
    }

    



    public class EdFiModelResolver : DefaultJsonTypeInfoResolver
    {
        public override JsonTypeInfo GetTypeInfo(Type type, JsonSerializerOptions options)
        {
            var ti = base.GetTypeInfo(type, options);

            // Only apply to Ed-Fi models
            if (type.Namespace != null &&
                type.Namespace.StartsWith("EdFi.OdsApi.Sdk.Models"))
            {
                // Disable constructor usage
                ti.CreateObject = () =>
                    FormatterServices.GetUninitializedObject(type);
            }

            return ti;
        }
    }
}
