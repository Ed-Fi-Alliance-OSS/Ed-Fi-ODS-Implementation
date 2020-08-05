// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Configuration;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public class SandboxAdminApiConfigurationProvider : IApiConfigurationProvider
    {
        private readonly IDatabaseEngineProvider _databaseEngineProvider;

        public SandboxAdminApiConfigurationProvider(IDatabaseEngineProvider databaseEngineProvider)
        {
            _databaseEngineProvider = Preconditions.ThrowIfNull(databaseEngineProvider, nameof(databaseEngineProvider));
        }

        public ApiMode Mode
        {
            get => ApiMode.Sandbox;
        }

        public DatabaseEngine DatabaseEngine
        {
            get => _databaseEngineProvider.DatabaseEngine;
        }

        public bool IsYearSpecific() => false;
    }
}
