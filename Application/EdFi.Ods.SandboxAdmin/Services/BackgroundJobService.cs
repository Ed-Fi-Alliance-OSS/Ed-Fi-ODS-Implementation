using Hangfire;
using Microsoft.Extensions.Options;
using System;
using System.Linq;
using EdFi.Ods.Sandbox.Admin.Initialization;
using System.Collections.Generic;

namespace EdFi.Ods.Sandbox.Admin.Services
{
    public class BackgroundJobService : IBackgroundJobService
    {
        private readonly IInitializationEngine _engine;
        private readonly Dictionary<string, UserOptions> _users;

        public BackgroundJobService(IInitializationEngine engine, IOptions<Dictionary<string, UserOptions>> users)
        {
            _engine = engine;
            _users = users.Value;
        }

        /// <summary>
        /// Create background jobs to populate users and sandboxes
        /// This class separates the initialization engine from HangFire
        /// </summary>
        public void Configure()
        {
            // initial creation of roles, users, and sandboxes at server startup 
            var id1 = BackgroundJob.Enqueue(() => _engine.CreateIdentityRoles());
            BackgroundJob.ContinueJobWith(id1, () => _engine.CreateIdentityUsers());

            // add vendors and sandboxes
            var id2 = BackgroundJob.Enqueue(() => _engine.CreateVendors());
            var id3 = BackgroundJob.ContinueJobWith(id2, () => _engine.CreateSandboxes());
            BackgroundJob.ContinueJobWith(id3, () => _engine.UpdateClientWithLEAIdsFromPopulatedSandbox());

            foreach (var user in _users)
            {
                // refresh existing sandboxes periodically
                if (user.Value.Sandboxes.Any(s => s.Value.Refresh))
                {
                    // Change the recurrence to suit your needs using Cron functions or a unix CRON expressions (i.e. "* */6 * * *" = every 6 hours)
                    RecurringJob.AddOrUpdate("RebuildSandboxes", () => _engine.RebuildSandboxes(), Cron.Daily(), new RecurringJobOptions { TimeZone = TimeZoneInfo.Local });
                }
            }
        }
    }
}
