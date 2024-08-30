// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Reflection;
using EdFi.Common.Database;
using EdFi.Ods.Common.Caching;
using EdFi.Ods.Common.Database;
using log4net;

namespace EdFi.Ods.Api.IntegrationTestHarness.Migrations;

public class OdsDatabaseConnectionStringProviderMigratingDecorator : IOdsDatabaseConnectionStringProvider
{
    private readonly IDatabaseMigrationsApplicator _databaseMigrationsApplicator;

    private readonly ILog _logger = LogManager.GetLogger(typeof(OdsDatabaseConnectionStringProviderMigratingDecorator));
    private readonly HashSet<ulong> _migratedConnections = new();
    private readonly IOdsDatabaseConnectionStringProvider _odsDatabaseConnectionStringProvider;

    public OdsDatabaseConnectionStringProviderMigratingDecorator(
        IDatabaseMigrationsApplicator databaseMigrationsApplicator,
        IOdsDatabaseConnectionStringProvider odsDatabaseConnectionStringProvider)
    {
        _databaseMigrationsApplicator = databaseMigrationsApplicator;
        _odsDatabaseConnectionStringProvider = odsDatabaseConnectionStringProvider;
    }

    string IDatabaseConnectionStringProvider.GetConnectionString()
    {
        string connectionString = _odsDatabaseConnectionStringProvider.GetConnectionString();

        if (_migratedConnections.Add(XxHash3Code.Combine(connectionString)))
        {
            _logger.Info("Applying ODS migrations...");

            // Apply migrations
            _databaseMigrationsApplicator.ApplyMigrations(
                Assembly.GetExecutingAssembly(),
                connectionString,
                MigrationArtifactType.Structure,
                MigrationDatabaseType.Ods);
        }

        return connectionString;
    }

    public string GetReadReplicaConnectionString() => _odsDatabaseConnectionStringProvider.GetConnectionString();
}
