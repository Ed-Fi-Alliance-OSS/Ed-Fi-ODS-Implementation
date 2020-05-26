// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Linq;
using EdFi.Ods.Admin.Initialization;
using Hangfire;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public static class BackgroundJobsConfig
    {
        /// <summary>
        /// Create background jobs to populate users and sandboxes
        /// This class separates the initialization engine from HangFire
        /// </summary>
        public static void Configure(InitializationEngine engine, InitializationModel initializationModel)
        {
            if (!initializationModel.Enabled)
            {
                return;
            }

            // initial creation of roles, users, and sandboxes at server startup
            var id1 = BackgroundJob.Enqueue(() => engine.CreateRoles());
            var id2 = BackgroundJob.ContinueJobWith(id1, () => engine.CreateUsers());
            var id3 = BackgroundJob.ContinueJobWith(id2, () => engine.EnsureMinimalTemplateEducationOrganizationsExist());
            BackgroundJob.ContinueJobWith(id3, () => engine.CreateSandboxes());

            // refresh existing sandboxes periodically
            if (initializationModel.Users.Any(u => u.Sandboxes.Any(s => s.Refresh)))
            {
                // Change the recurrence to suit your needs using Cron functions or a unix CRON expressions (i.e. "* */6 * * *" = every 6 hours)
                RecurringJob.AddOrUpdate("RebuildSandboxes", () => engine.RebuildSandboxes(), Cron.Daily(), TimeZoneInfo.Local);
            }
        }
    }
}
