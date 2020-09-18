using EdFi.Ods.SandboxAdmin.Initialization;
using Hangfire;
using Microsoft.Extensions.Options;
using System;
using System.Linq;

namespace EdFi.Ods.Sandbox.Admin.Services
{
    public class BackgroundJobService : IBackgroundJobService
    {
        private readonly InitializationEngine _engine;
        private readonly UserOptions _userOptions;

        public BackgroundJobService(InitializationEngine engine, IOptions<UserOptions> userOptions)
        {
            _engine = engine;
            _userOptions = userOptions.Value;
        }

        /// <summary>
        /// Create background jobs to populate users and sandboxes
        /// This class separates the initialization engine from HangFire
        /// </summary>
        public void Configure()
        {
            // add vendors and sandboxes
            var id2 = BackgroundJob.Enqueue(() => _engine.CreateVendors());
            var id3 = BackgroundJob.ContinueJobWith(id2, () => _engine.CreateSandboxes());
            BackgroundJob.ContinueJobWith(id3, () => _engine.UpdateClientWithLEAIdsFromPopulatedSandbox());

            // refresh existing sandboxes periodically
            if (_userOptions.Sandboxes.Any(s => s.Value.Refresh))
            {
                // Change the recurrence to suit your needs using Cron functions or a unix CRON expressions (i.e. "* */6 * * *" = every 6 hours)
                RecurringJob.AddOrUpdate("RebuildSandboxes", () => _engine.RebuildSandboxes(), Cron.Daily(), TimeZoneInfo.Local);
            }
        }
    }
}
