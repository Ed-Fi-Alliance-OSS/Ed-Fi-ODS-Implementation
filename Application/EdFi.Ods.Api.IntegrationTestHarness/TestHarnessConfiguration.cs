// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class TestHarnessConfiguration
    {
        public List<Vendor> Vendors { get; set; }
    }

    public class Vendor
    {
        public string Email { get; set; }

        public string VendorName { get; set; }

        public List<Application> Applications { get; set; }

        public List<string> NamespacePrefixes { get; set; }
    }

    public class Application
    {
        public string ApplicationName { get; set; }

        public string ClaimSetName { get; set; }

        public List<ApiClient> ApiClients { get; set; }

        public List<string> Profiles { get; set; }
    }

    public class ApiClient
    {
        public string ApiClientName { get; set; }

        public string Key { get; set; }

        public string Secret { get; set; }

        public List<int> LocalEducationOrganizations { get; set; }
    }
}
