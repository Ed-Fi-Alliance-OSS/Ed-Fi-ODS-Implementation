// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using CommandLine;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class Options
    {
        [Option(
            shortName: 'c', longName: "configurationFilePath", Required = false,
            HelpText = "Configuration file to setup ApiClient key/secret pair.")]
        public string ConfigurationFilePath { get; set; }

        [Option(
            shortName: 'e', longName: "environmentFilePath", Required = false,
            HelpText = "If path is passed in, the Test Harness will generate an environment file.  Environment file is needed to run Postman Integration tests.")]
        public string EnvironmentFilePath { get; set; }

    }
}
