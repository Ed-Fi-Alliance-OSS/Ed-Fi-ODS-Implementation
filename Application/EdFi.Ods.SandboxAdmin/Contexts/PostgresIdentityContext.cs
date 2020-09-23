﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Data.Entity.Core.Metadata.Edm;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration.Conventions;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Utils.Extensions;
using Microsoft.EntityFrameworkCore;

namespace EdFi.Ods.Sandbox.Admin.Contexts
{
    public class PostgresIdentityContext : IdentityContext
    {
        private readonly string _connectionString;

        public PostgresIdentityContext(string connectionString)
            : base()
        {
            _connectionString = connectionString;
        }

        protected override void ApplyProviderSpecificMappings(ModelBuilder modelBuilder)
        {
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
            //modelBuilder.Conventions.Add<ForeignKeyLowerCaseNamingConvention>();
            //modelBuilder.Conventions.Add<TableLowerCaseNamingConvention>();
            //modelBuilder.Properties().Configure(c => c.HasColumnName(c.ClrPropertyInfo.Name.ToLowerInvariant()));
        }

        protected override void ApplyProviderSpecificConnection(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_connectionString);
        }

        private class TableLowerCaseNamingConvention : IStoreModelConvention<EntitySet>
        {
            public void Apply(EntitySet entitySet, DbModel model)
            {
                Preconditions.ThrowIfNull(entitySet, nameof(entitySet));
                Preconditions.ThrowIfNull(model, nameof(model));

                entitySet.Table = entitySet.Table.ToLowerInvariant();
            }
        }

        private class ForeignKeyLowerCaseNamingConvention : IStoreModelConvention<AssociationType>
        {
            public void Apply(AssociationType association, DbModel model)
            {
                Preconditions.ThrowIfNull(association, nameof(association));
                Preconditions.ThrowIfNull(model, nameof(model));

                if (!association.IsForeignKey)
                {
                    return;
                }

                association.Constraint.FromProperties.ForEach(PropertyNamesToLowerInvariant);
                association.Constraint.ToProperties.ForEach(PropertyNamesToLowerInvariant);

                void PropertyNamesToLowerInvariant(EdmProperty property) => property.Name = property.Name.ToLowerInvariant();
            }
        }
    }
}