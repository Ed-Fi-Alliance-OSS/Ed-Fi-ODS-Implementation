// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using EdFi.Admin.DataAccess.Providers;
using EdFi.Common.Database;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.SandboxAdmin.Contexts;

namespace EdFi.Ods.Sandbox.Admin.Contexts
{
    // TODO Address on spike ODS-4538
    public class IdentityContextFactory : IIdentityContextFactory
    {
    //     private readonly Dictionary<DatabaseEngine, Type> _identityContextTypeByDatabaseEngine =
    //         new Dictionary<DatabaseEngine, Type>
    //         {
    //             {DatabaseEngine.SqlServer, typeof(SqlServerIdentityContext)},
    //             {DatabaseEngine.Postgres, typeof(PostgresIdentityContext)}
    //         };
    //
    //     private readonly DatabaseEngine _databaseEngine;
    //
    //     private readonly IDatabaseConnectionStringProvider _connectionStringsProvider;
    //
    //     public IdentityContextFactory(IAdminDatabaseConnectionStringProvider connectionStringsProvider,
    //         DatabaseEngine databaseEngine)
    //     {
    //         _connectionStringsProvider = connectionStringsProvider;
    //         _databaseEngine = databaseEngine;
    //     }
    //
    //     public IdentityContext CreateContext()
    //     {
    //         if (_identityContextTypeByDatabaseEngine.TryGetValue(_databaseEngine, out Type contextType))
    //         {
    //             return Activator.CreateInstance(contextType, _connectionStringsProvider.GetConnectionString()) as IdentityContext;
    //         }
    //
    //         throw new InvalidOperationException(
    //             $"Cannot create an IUsersContext for database type {_databaseEngine.DisplayName}");
    //      }
    }
}