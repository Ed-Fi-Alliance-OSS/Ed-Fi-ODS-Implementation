using EdFi.Ods.Api.ExternalTasks;
using log4net;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class UpdateSecurityDatabaseTask : IExternalTask
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(UpdateSecurityDatabaseTask));
        private readonly IPostmanSecurityMetadataInitializer _postmanSecurityMetadataInitializer;
        private readonly TestHarnessConfiguration _testHarnessConfiguration;

        public UpdateSecurityDatabaseTask(IPostmanSecurityMetadataInitializer postmanSecurityMetadataInitializer,
            TestHarnessConfigurationProvider testHarnessConfigurationProvider)
        {
            _postmanSecurityMetadataInitializer = postmanSecurityMetadataInitializer;
            _testHarnessConfiguration = testHarnessConfigurationProvider.GetTestHarnessConfiguration();
        }

        public void Execute()
        {
            if (!_testHarnessConfiguration.EnableOwnershipBasedAuthorization)
            {
                return;
            }

            _logger.Debug($"Loading RecordOwnershipData in Security Database.");
            _postmanSecurityMetadataInitializer.LoadRecordOwnershipData();

            _logger.Debug($"Loading Get Many Resources when Multiple Authorization Strategies Data Setup in Security Database.");
            _postmanSecurityMetadataInitializer.LoadMultipleAuthorizationStrategyData();
        }
    }
}
