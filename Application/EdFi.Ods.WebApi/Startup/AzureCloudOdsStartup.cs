// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Web.Configuration;
using EdFi.Ods.Api;
using EdFi.Ods.WebApi.Startup;
using log4net;
using log4net.Repository.Hierarchy;
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.Owin;

[assembly: OwinStartup("AzureCloudOds", typeof(AzureCloudOdsStartup))]

namespace EdFi.Ods.WebApi.Startup
{
    public class AzureCloudOdsStartup : StartupBase
    {
        protected override void ConfigurationSpecificRegistration()
        {
            ReconfigureLog4Net();
            ConfigureAppInsightsLogging();

            void ReconfigureLog4Net()
            {
                var logSetting = WebConfigurationManager.AppSettings["LogLevelOverride"];

                if (logSetting == null)
                {
                    return;
                }

                foreach (var loggerRepository in LogManager.GetAllRepositories())
                {
                    var logLevel = loggerRepository.LevelMap[logSetting];

                    if (logLevel == null)
                    {
                        continue;
                    }

                    var logManagerRepoHierarchy = (Hierarchy) loggerRepository;
                    logManagerRepoHierarchy.Root.Level = logLevel;
                    logManagerRepoHierarchy.RaiseConfigurationChanged(EventArgs.Empty);
                }
            }

            void ConfigureAppInsightsLogging()
            {
                var instrumentationKey = WebConfigurationManager.AppSettings["ApplicationInsightsInstrumentationKey"];

                if (instrumentationKey != null)
                {
                    TelemetryConfiguration.Active.InstrumentationKey = instrumentationKey;
                }
            }
        }
    }
}
