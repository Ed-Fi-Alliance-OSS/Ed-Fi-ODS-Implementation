// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Api.ExternalTasks;
using EdFi.Ods.Api.Middleware;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Constants;
using EdFi.Ods.Common.Context;
using log4net;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class UpdateSecurityDatabaseTask : IExternalTask
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(UpdateSecurityDatabaseTask));
        private readonly IPostmanSecurityMetadataInitializer _postmanSecurityMetadataInitializer;
        private readonly TestHarnessConfiguration _testHarnessConfiguration;
        private readonly ApiSettings _apiSettings;
        private readonly ITenantConfigurationMapProvider _tenantConfigurationMapProvider;
        private readonly IContextProvider<TenantConfiguration> _tenantConfigurationContextProvider;

        public UpdateSecurityDatabaseTask(IPostmanSecurityMetadataInitializer postmanSecurityMetadataInitializer,
            TestHarnessConfigurationProvider testHarnessConfigurationProvider,
            ApiSettings apiSettings,
            ITenantConfigurationMapProvider tenantConfigurationMapProvider,
            IContextProvider<TenantConfiguration> tenantConfigurationContextProvider)
        {
            _postmanSecurityMetadataInitializer = postmanSecurityMetadataInitializer;
            _testHarnessConfiguration = testHarnessConfigurationProvider.GetTestHarnessConfiguration();
            _apiSettings = apiSettings;
            _tenantConfigurationMapProvider = tenantConfigurationMapProvider;
            _tenantConfigurationContextProvider = tenantConfigurationContextProvider;
        }

        public void Execute()
        {
            if (!_testHarnessConfiguration.EnableOwnershipBasedAuthorization)
            {
                return;
            }

            if (!_apiSettings.IsFeatureEnabled(ApiFeature.MultiTenancy.GetConfigKeyName()))
            {
                _logger.Debug($"Loading RecordOwnershipData in Security Database.");
                _postmanSecurityMetadataInitializer.LoadRecordOwnershipData();

                _logger.Debug($"Loading Get Many Resources when Multiple Authorization Strategies Data Setup in Security Database.");
                _postmanSecurityMetadataInitializer.LoadMultipleAuthorizationStrategyData();
                return;
            }

            foreach (var tenantConfigurationMap in _tenantConfigurationMapProvider.GetMap())
            {
                _tenantConfigurationContextProvider.Set(tenantConfigurationMap.Value);

                _logger.Debug($"Loading RecordOwnershipData in Security Database for tenant {tenantConfigurationMap.Key}.");
                _postmanSecurityMetadataInitializer.LoadRecordOwnershipData();

                _logger.Debug($"Loading Get Many Resources when Multiple Authorization Strategies Data Setup in Security Database for tenant {tenantConfigurationMap.Key}.");
                _postmanSecurityMetadataInitializer.LoadMultipleAuthorizationStrategyData();

                _tenantConfigurationContextProvider.Set(null);
            }
        }
    }
}
