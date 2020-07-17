// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Ods.Admin.Initialization;
using EdFi.Ods.Common.Configuration;
using Hangfire;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public class BackgroundJobsConfig
    {
        private readonly InitializationEngine _engine;
        private readonly InitializationModel _initializationModel;
        private readonly IApiConfigurationProvider _apiConfigurationProvider;

        public BackgroundJobsConfig(InitializationEngine engine, InitializationModel initializationModel, IApiConfigurationProvider apiConfigurationProvider)
        {
            _engine = engine;
            _initializationModel = initializationModel;
            _apiConfigurationProvider = apiConfigurationProvider;
        }

        /// <summary>
        /// Create background jobs to populate users and sandboxes
        /// This class separates the initialization engine from HangFire
        /// </summary>
        public void Configure()
        {
            if (!_initializationModel.Enabled)
            {
                return;
            }

            if (_apiConfigurationProvider.DatabaseEngine == DatabaseEngine.SqlServer)
            {
                // initial creation of roles, users, and sandboxes at server startup for sql server only
                var id1 = BackgroundJob.Enqueue(() => _engine.CreateRoles());
                BackgroundJob.ContinueJobWith(id1, () => _engine.CreateUsers());
            }

            // add vendors and sandboxes
            var id2 = BackgroundJob.Enqueue(() => _engine.CreateVendors());
            BackgroundJob.ContinueJobWith(id2, () => _engine.CreateSandboxes());

            // refresh existing sandboxes periodically
            if (_initializationModel.Users.Any(u => u.Sandboxes.Any(s => s.Refresh)))
            {
                // Change the recurrence to suit your needs using Cron functions or a unix CRON expressions (i.e. "* */6 * * *" = every 6 hours)
                RecurringJob.AddOrUpdate("RebuildSandboxes", () => _engine.RebuildSandboxes(), Cron.Daily(), TimeZoneInfo.Local);
            }
        }
    }
}
