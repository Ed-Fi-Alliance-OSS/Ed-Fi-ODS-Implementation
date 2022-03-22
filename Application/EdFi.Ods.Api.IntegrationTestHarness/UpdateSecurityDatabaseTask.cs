using EdFi.Ods.Api.ExternalTasks;
using log4net;
using EdFi.Security.DataAccess.Repositories;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class UpdateSecurityDatabaseTask : IExternalTask
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(UpdateSecurityDatabaseTask));
        private readonly ISecurityRepository _securityRepository;

        public UpdateSecurityDatabaseTask(ISecurityRepository securityRepository)
        {
            _securityRepository = securityRepository;
        }

        public void Execute()
        {
            _logger.Debug($"Loading RecordOwnershipData in Security Database.");
            _securityRepository.LoadRecordOwnershipData();

            _logger.Debug($"Loading Get Many Resources when Multiple Authorization Strategies Data Setup in Security Database.");
            _securityRepository.LoadGetManyResourcesMultipleAuthorizationData();
        }
    }
}
