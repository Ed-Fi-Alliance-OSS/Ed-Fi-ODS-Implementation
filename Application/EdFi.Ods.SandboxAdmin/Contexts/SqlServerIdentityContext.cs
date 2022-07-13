// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Admin.DataAccess.Providers;
using Microsoft.EntityFrameworkCore;

namespace EdFi.Ods.Sandbox.Admin.Contexts
{
    public class SqlServerIdentityContext : IdentityContext
    {
        private readonly string _connectionString;
        public SqlServerIdentityContext(IAdminDatabaseConnectionStringProvider connectionStringsProvider)
            : base()
        {
            _connectionString = connectionStringsProvider.GetConnectionString();
        }
        protected override void ApplyProviderSpecificConnection(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_connectionString);
        }
    }
}
