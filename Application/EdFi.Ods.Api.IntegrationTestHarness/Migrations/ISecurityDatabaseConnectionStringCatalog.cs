// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.Api.IntegrationTestHarness.Migrations;

/// <summary>
/// Defines a method for obtaining connection strings for all the security metadata in the EdFi_Admin databases available in
/// the deployment environment. 
/// </summary>
public interface ISecurityDatabaseConnectionStringCatalog
{
    /// <summary>
    /// Gets the connection strings for all the security metadata EdFi_Admin databases available in the deployment environment.
    /// </summary>
    /// <returns>The connection strings for EdFi_Admin databases.</returns>
    string[] GetConnectionStrings();
}
