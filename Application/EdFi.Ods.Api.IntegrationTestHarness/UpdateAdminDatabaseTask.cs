// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;
using EdFi.Admin.DataAccess.Models;
using EdFi.Admin.DataAccess.Repositories;
using EdFi.Admin.DataAccess.Utils;
using EdFi.Ods.Api.ExternalTasks;
using EdFi.Ods.Api.Middleware;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Constants;
using EdFi.Ods.Common.Context;
using EdFi.Ods.Common.Database;
using EdFi.Ods.Common.Models;
using log4net;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Formatting = Newtonsoft.Json.Formatting;
using TenantConfiguration = EdFi.Ods.Api.Middleware.TenantConfiguration;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class UpdateAdminDatabaseTask : IExternalTask
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(UpdateAdminDatabaseTask));
        private readonly IClientAppRepo _clientAppRepo;
        private readonly IDefaultApplicationCreator _defaultApplicationCreator;
        private readonly IConfiguration _configuration;
        private readonly ApiSettings _apiSettings;
        private readonly TestHarnessConfiguration _testHarnessConfiguration;
        private readonly ITenantConfigurationMapProvider _tenantConfigurationMapProvider;
        private readonly IContextProvider<TenantConfiguration> _tenantConfigurationContextProvider;
        private readonly IDomainModelProvider _domainModelProvider;

        public UpdateAdminDatabaseTask(IClientAppRepo clientAppRepo,
            IDefaultApplicationCreator defaultApplicationCreator,
            IConfiguration configuration,
            ApiSettings apiSettings,
            TestHarnessConfigurationProvider testHarnessConfigurationProvider,
            IDomainModelProvider domainModelProvider)
        {
            _clientAppRepo = clientAppRepo;
            _defaultApplicationCreator = defaultApplicationCreator;
            _configuration = configuration;
            _apiSettings = apiSettings;
            _testHarnessConfiguration = testHarnessConfigurationProvider.GetTestHarnessConfiguration();
            _domainModelProvider = domainModelProvider;
        }

        public UpdateAdminDatabaseTask(IClientAppRepo clientAppRepo,
            IDefaultApplicationCreator defaultApplicationCreator,
            IConfiguration configuration,
            ApiSettings apiSettings,
            TestHarnessConfigurationProvider testHarnessConfigurationProvider,
            IContextProvider<TenantConfiguration> tenantConfigurationContextProvider,
            ITenantConfigurationMapProvider tenantConfigurationMapProvider,
            IDomainModelProvider domainModelProvider)
            : this (clientAppRepo, defaultApplicationCreator, configuration, apiSettings, testHarnessConfigurationProvider, domainModelProvider)
        {
            _tenantConfigurationMapProvider = tenantConfigurationMapProvider;
            _tenantConfigurationContextProvider = tenantConfigurationContextProvider;
        }

        public void Execute()
        {
            PostmanEnvironment postmanEnvironment;

            if (!_apiSettings.IsFeatureEnabled(ApiFeature.MultiTenancy.GetConfigKeyName()))
            {
                _logger.Debug($"Loading test data in Admin Database.");
                postmanEnvironment = UpdateAdminDatabase();
            }
            else
            {
                postmanEnvironment = new PostmanEnvironment();
                foreach (var tenantConfigurationMap in _tenantConfigurationMapProvider.GetMap())
                {
                    _tenantConfigurationContextProvider.Set(tenantConfigurationMap.Value);

                    _logger.Debug($"Loading test data in Admin Database for tenant {tenantConfigurationMap.Key}.");
                    var ret = UpdateAdminDatabase(tenantConfigurationMap.Key);
                    postmanEnvironment.Values.AddRange(ret.Values);

                    _tenantConfigurationContextProvider.Set(null);
                }
            }

            CreateEnvironmentFile();

            void CreateEnvironmentFile()
            {
                // This checks if the Ed-Fi Data Standard in use has a Parent entity,
                // which was renamed to Contact in Data Standard version 5.0.0.
                
                // If there is not a Parent entity present in the data standard in use,
                // then we assume that the data standard in use is 5.0.0 or later and therefore use Contact.

                var dataStandardHasParentEntity = _domainModelProvider.GetDomainModel().Entities.Any(x =>
                    x.Schema.Equals("edfi", StringComparison.OrdinalIgnoreCase) &&
                    x.Name.Equals("Parent", StringComparison.OrdinalIgnoreCase));
                
                var parentOrContactProperName = dataStandardHasParentEntity ? "Parent" : "Contact";

                var environmentFilePath = _configuration.GetValue<string>("environmentFilePath");

                if (!string.IsNullOrEmpty(environmentFilePath) && new DirectoryInfo(environmentFilePath).Exists)
                {
                    postmanEnvironment.Values.Add(
                        new ValueItem
                        {
                            Enabled = true,
                            Value = _configuration.GetValue<string>("Urls") ?? "http://localhost:8765/",
                            Key = "ApiBaseUrl"
                        });

                    postmanEnvironment.Values.Add(
                        new ValueItem
                        {
                            Enabled = true,
                            Value =  _apiSettings.IsFeatureEnabled(ApiFeature.Composites.ToString()),
                            Key = "CompositesFeatureIsEnabled"
                        });

                    postmanEnvironment.Values.Add(
                        new ValueItem
                        {
                            Enabled = true,
                            Value = _apiSettings.IsFeatureEnabled(ApiFeature.Profiles.ToString()),
                            Key = "ProfilesFeatureIsEnabled"
                        });
                    
                    // The following variable provides the Postman collections with the correct parent/
                    // contact related entity name for the Ed-Fi data standard currently in use.
                    postmanEnvironment.Values.Add(
                        new ValueItem
                        {
                            Enabled = true, 
                            Value = parentOrContactProperName,
                            Key = "ParentOrContactProperName"
                        });

                    var jsonString = JsonConvert.SerializeObject(
                        postmanEnvironment,
                        Formatting.Indented,
                        new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() });

                    var fileName = Path.Combine(environmentFilePath, "environment.json");

                    File.WriteAllText(fileName, jsonString);
                }
            }
        }

        private PostmanEnvironment UpdateAdminDatabase(string tenantIdentifier = null)
        {
            var postmanEnvironment = new PostmanEnvironment();

            _clientAppRepo.Reset();

            // Add ODS instance
            string odsConnectionString = string.Format(_configuration.GetConnectionString("EdFi_Ods"), tenantIdentifier);

            var dbConnectionStringBuilderAdapterFactory =
                new DbConnectionStringBuilderAdapterFactory(_apiSettings.GetDatabaseEngine());

            var connectionStringBuilderAdapter = dbConnectionStringBuilderAdapterFactory.Get();
            connectionStringBuilderAdapter.ConnectionString = odsConnectionString;
            string odsDatabaseName = connectionStringBuilderAdapter.DatabaseName;

            var odsInstance = _clientAppRepo.CreateOdsInstance(
                new OdsInstance()
                {
                    Name = odsDatabaseName,
                    InstanceType = "ODS",
                    ConnectionString = odsConnectionString,
                });

            // Add Profiles
            var profileFilenames = Directory.GetFiles(Directory.GetParent(AppContext.BaseDirectory).FullName, "*Profiles.xml");

            var profileDefinitionByName = new Dictionary<string, XmlNode>(StringComparer.OrdinalIgnoreCase);

            foreach (var profileFilename in profileFilenames)
            {
                var _allDocs = new XmlDocument();
                _allDocs.Load(profileFilename);

                var profiles = new List<Profile>();
                var profileDefinitions = _allDocs.SelectNodes("/Profiles/Profile");
                foreach (XmlNode profileDefinition in profileDefinitions)
                {
                    string profileName = profileDefinition.Attributes["name"].Value;

                    profiles.Add(
                        new Profile()
                        {
                            ProfileDefinition = profileDefinition.OuterXml,
                            ProfileName = profileName
                        });
                    
                    profileDefinitionByName.Add(profileName, profileDefinition);
                }
                _clientAppRepo.CreateProfilesWithProfileDefinition(profiles);
            }

            foreach (var vendor in _testHarnessConfiguration.Vendors.Where(x =>
                string.IsNullOrEmpty(tenantIdentifier) ||
                x.TenantIdentifier.Equals(tenantIdentifier, StringComparison.InvariantCultureIgnoreCase)))
            {
                var user = _clientAppRepo.GetUser(vendor.Email) ??
                           _clientAppRepo.CreateUser(
                               new User
                               {
                                   FullName = vendor.VendorName,
                                   Email = vendor.Email,
                                   Vendor = _clientAppRepo.CreateOrGetVendor(
                                       vendor.Email, vendor.VendorName, vendor.NamespacePrefixes)
                               });

                foreach (var app in vendor.Applications)
                {
                    var application = _clientAppRepo.CreateApplicationForVendor(
                        user.Vendor.VendorId, app.ApplicationName, app.ClaimSetName);

                    var edOrgIds = app.ApiClients.SelectMany(s => s.LocalEducationOrganizations).Distinct().ToList();

                    _defaultApplicationCreator.AddEdOrgIdsToApplication(edOrgIds, application.ApplicationId);

                    foreach (var client in app.ApiClients)
                    {
                        var key = !string.IsNullOrEmpty(client.Key)
                            ? client.Key
                            : GetGuid();

                        var secret = !string.IsNullOrEmpty(client.Secret)
                            ? client.Secret
                            : GetGuid();

                        var apiClient = _clientAppRepo.CreateApiClient(user.UserId, client.ApiClientName, key, secret);

                        postmanEnvironment.Values.Add(
                            new ValueItem
                            {
                                Enabled = true,
                                Value = key,
                                Key = "ApiKey_" + client.ApiClientName
                            });

                        postmanEnvironment.Values.Add(
                            new ValueItem
                            {
                                Enabled = true,
                                Value = secret,
                                Key = "ApiSecret_" + client.ApiClientName
                            });

                        _clientAppRepo.AddEdOrgIdsToApiClient(
                            user.UserId, apiClient.ApiClientId, client.LocalEducationOrganizations,
                            application.ApplicationId);

                        _clientAppRepo.AddOdsInstanceToApiClient(apiClient.ApiClientId, odsInstance.OdsInstanceId);

                        postmanEnvironment.Values.Add(
                            new ValueItem
                            {
                                Enabled = true,
                                Value = client.LocalEducationOrganizations,
                                Key = client.ApiClientName + "LeaId"
                            });

                        if (client.OwnershipToken != null)
                        {
                            _clientAppRepo.AddOwnershipTokensToApiClient(client.OwnershipToken, apiClient.ApiClientId);
                        }

                        if (client.ApiClientOwnershipTokens != null)
                        {
                            _clientAppRepo.AddApiClientOwnershipTokens(client.ApiClientOwnershipTokens, apiClient.ApiClientId);
                        }
                    }

                    if (app.Profiles != null)
                    {
                        var _profiles = new List<Profile>();
                        foreach (var profileName in app.Profiles)
                        {
                            var profileDefinition = profileDefinitionByName[profileName].OuterXml;
                            _profiles.Add(new Profile() { ProfileDefinition = profileDefinition, ProfileName = profileName });
                        }
                        _clientAppRepo.AddProfilesToApplication(_profiles, application.ApplicationId);
                    }
                }
            }

            return postmanEnvironment;

            string GetGuid()
            {
                return Guid.NewGuid().ToString("N").Substring(0, 20);
            }
        }
    }
}
