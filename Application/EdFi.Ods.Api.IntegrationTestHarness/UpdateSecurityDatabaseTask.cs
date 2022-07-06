using EdFi.Ods.Api.ExternalTasks;
using log4net;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class UpdateSecurityDatabaseTask : IExternalTask
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(UpdateSecurityDatabaseTask));
        private readonly IPostmanSecurityMetadataInitializer _postmanSecurityMetadataInitializer;

        public UpdateSecurityDatabaseTask(IPostmanSecurityMetadataInitializer postmanSecurityMetadataInitializer)
        {
            _postmanSecurityMetadataInitializer = postmanSecurityMetadataInitializer;
        }

        public void Execute()
        {
            _logger.Debug($"Loading RecordOwnershipData in Security Database.");
            _postmanSecurityMetadataInitializer.LoadRecordOwnershipData();

            _logger.Debug($"Loading Get Many Resources when Multiple Authorization Strategies Data Setup in Security Database.");
            _postmanSecurityMetadataInitializer.LoadMultipleAuthorizationStrategyData();
        }
    }
}
