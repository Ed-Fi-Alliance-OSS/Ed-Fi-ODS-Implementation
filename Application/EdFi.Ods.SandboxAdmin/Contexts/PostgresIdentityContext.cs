// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Admin.DataAccess.Providers;
using Microsoft.EntityFrameworkCore;

namespace EdFi.Ods.Sandbox.Admin.Contexts
{
    public class PostgresIdentityContext : IdentityContext
    {
        private readonly string _connectionString;

        public PostgresIdentityContext(IAdminDatabaseConnectionStringProvider connectionStringsProvider)
            : base()
        {
            _connectionString = connectionStringsProvider.GetConnectionString();
        }

        protected override void ApplyProviderSpecificMappings(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("dbo");
            foreach (var entity in modelBuilder.Model.GetEntityTypes())
            {
                entity.SetTableName(entity.GetTableName().ToLower());

                foreach (var property in entity.GetProperties())
                {
                    property.SetColumnName(property.GetColumnName().ToLower());
                }

                foreach (var key in entity.GetKeys())
                {
                    key.SetName(key.GetName().ToLower());
                }

                foreach (var key in entity.GetForeignKeys())
                {
                    key.SetConstraintName(key.GetConstraintName().ToLower());
                }

                foreach (var index in entity.GetIndexes())
                {
                    index.SetName(index.GetName().ToLower());
                }
            }
        }

        protected override void ApplyProviderSpecificConnection(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql(_connectionString);
        }
    }
}