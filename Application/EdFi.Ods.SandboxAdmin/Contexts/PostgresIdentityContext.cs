// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration.Conventions;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Utils.Extensions;
using Microsoft.EntityFrameworkCore;

namespace EdFi.Ods.SandboxAdmin.Contexts
{
    public class PostgresIdentityContext : IdentityContext
    {
        public PostgresIdentityContext(DbContextOptions<IdentityContext> options)
            : base(options) { }

        protected override void ApplyProviderSpecificMappings(ModelBuilder modelBuilder)
        {
            foreach (var entity in modelBuilder.Model.GetEntityTypes())
            {
                // Replace table names
                entity.SetTableName(entity.GetTableName().ToLowerInvariant());

                // Replace column names            
                foreach (var property in entity.GetProperties())
                {
                    property.SetColumnName(property.GetColumnName().ToLowerInvariant());
                }

                // Replace foreign key names 
                foreach (var key in entity.GetForeignKeys())
                {
                    key.SetConstraintName(key.GetConstraintName().ToLowerInvariant());
                }
            }
        }
    }
}