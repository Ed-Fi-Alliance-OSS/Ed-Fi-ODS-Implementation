// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using DbUp;
using DbUp.Builder;
using EdFi.Common.Configuration;
using EdFi.Ods.Common.Configuration;
using log4net;
using Microsoft.Extensions.Configuration;

namespace EdFi.Ods.Api.IntegrationTestHarness.Migrations;

public class DatabaseMigrationsApplicator : IDatabaseMigrationsApplicator
{
    private readonly DatabaseEngine _databaseEngine;

    private readonly ILog _logger = LogManager.GetLogger(typeof(DatabaseMigrationsApplicator));
    private readonly string _standardVersion;

    public DatabaseMigrationsApplicator(
        DatabaseEngine databaseEngine,
        IConfiguration configuration)
    {
        _databaseEngine = databaseEngine;
        _standardVersion = configuration.GetSection("ApiSettings").GetValue<string>("StandardVersion")
            ?? Environment.GetEnvironmentVariable("StandardVersion");
    }

    public void ApplyMigrations(
        Assembly assembly,
        string connectionString,
        MigrationArtifactType migrationArtifactType,
        MigrationDatabaseType migrationDatabaseType)
    {
        string dbFolderName = _databaseEngine.ScriptsFolderName;

        string scriptPattern =
            @$"^{assembly.GetName().Name}\.Artifacts\.{dbFolderName}\.{migrationArtifactType}\.{migrationDatabaseType}\.[\d\s\w\-]+\.sql$";

        string standardVersionScriptPattern =
            @$"^{assembly.GetName().Name}\.Standard\.{_standardVersion}\.{dbFolderName}\.{migrationArtifactType}\.{migrationDatabaseType}\.[\d\s\w\-]+\.sql$";

        if (!string.IsNullOrEmpty(_standardVersion))
        {
            var standardVersionExecutableScripts = GetMigrationScripts(assembly, standardVersionScriptPattern);
            ApplyMigrations(assembly, standardVersionExecutableScripts, GetUpgradeEngineBuilder(_databaseEngine, connectionString));
        }

        var executableScripts = GetMigrationScripts(assembly, scriptPattern);
        ApplyMigrations(assembly, executableScripts, GetUpgradeEngineBuilder(_databaseEngine, connectionString));
    }

    private UpgradeEngineBuilder GetUpgradeEngineBuilder(DatabaseEngine databaseEngine, string connectionString)
    {
        if (databaseEngine == DatabaseEngine.SqlServer)
        {
            return DeployChanges.To.SqlDatabase(connectionString).JournalToSqlTable("dbo", "DeployJournal");
        }

        if (databaseEngine == DatabaseEngine.Postgres)
        {
            return DeployChanges.To.PostgresqlDatabase(connectionString).JournalToPostgresqlTable("public", "DeployJournal");
        }

        throw new NotSupportedException($"Unsupported database engine: {databaseEngine}.");
    }

    private string[] GetMigrationScripts(Assembly assembly, string searchPattern)
    {
        // Get all embedded resources that match the pattern
        var scripts = assembly.GetManifestResourceNames()
            .Where(rn => Regex.IsMatch(rn, searchPattern))
            .OrderBy(r => r)
            .ToArray();

        return scripts;
    }

    private void ApplyMigrations(Assembly assembly, string[] executableScripts, UpgradeEngineBuilder upgradeEngineBuilder)
    {
        var upgrader = upgradeEngineBuilder.WithScriptsEmbeddedInAssembly(assembly, executableScripts.Contains)
            .LogToConsole()
            .LogToTrace()
            .Build();

        var result = upgrader.PerformUpgrade();

        if (!result.Successful)
        {
            throw new Exception($"Migration script '{result.ErrorScript}' failed.", result.Error);
        }
    }
}
