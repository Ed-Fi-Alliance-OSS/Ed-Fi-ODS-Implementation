using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.Sandbox.Repositories;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using EdFi.Admin.DataAccess.Utils;
using EdFi.Ods.Api.ExternalTasks;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Constants;
using log4net;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class UpdateAdminDatabaseTask : IExternalTask
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(UpdateAdminDatabaseTask));
        private readonly IClientAppRepo _clientAppRepo;
        private readonly IDefaultApplicationCreator _defaultApplicationCreator;
        private readonly IConfiguration _configuration;
        private readonly ApiSettings _apiSettings;
        private readonly IConfigurationRoot _configurationRoot;

        private TestHarnessConfiguration _testHarnessConfiguration = new TestHarnessConfiguration();

        public UpdateAdminDatabaseTask(IClientAppRepo clientAppRepo,
            IDefaultApplicationCreator defaultApplicationCreator,
            IConfiguration configuration,
            ApiSettings apiSettings,
            IConfigurationRoot configurationRoot)
        {
            _clientAppRepo = clientAppRepo;
            _defaultApplicationCreator = defaultApplicationCreator;
            _configuration = configuration;
            _apiSettings = apiSettings;
            _configurationRoot = configurationRoot;
        }

        public void Execute()
        {
            // we are pulling command line arguments therefore we are going directly to the configuration object
            var _configurationFilePath = _configurationRoot.GetValue<string>("configurationFilePath");
            var _environmentFilePath = _configurationRoot.GetValue<string>("environmentFilePath");

            var postmanEnvironment = new PostmanEnvironment();

            _clientAppRepo.Reset();

            if (!string.IsNullOrEmpty(_configurationFilePath))
            {
                _logger.Debug($"configurationPath = {_configurationFilePath}");

                if (!File.Exists(_configurationFilePath))
                {
                    throw new Exception($"Configuration file {_configurationFilePath} does not exists.");
                }

                _testHarnessConfiguration =
                    JsonConvert.DeserializeObject<TestHarnessConfiguration>(File.ReadAllText(_configurationFilePath));
            }
            else
            {
                _testHarnessConfiguration.Vendors = CreateDefaultVendor();
            }

            foreach (var vendor in _testHarnessConfiguration.Vendors)
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

                    var leaIds = app.ApiClients.SelectMany(s => s.LocalEducationOrganizations).Distinct().ToList();

                    _defaultApplicationCreator.AddLeaIdsToApplication(leaIds, application.ApplicationId);

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

                        _clientAppRepo.AddLeaIdsToApiClient(
                            user.UserId, apiClient.ApiClientId, client.LocalEducationOrganizations,
                            application.ApplicationId);

                        postmanEnvironment.Values.Add(
                            new ValueItem
                            {
                                Enabled = true,
                                Value = client.LocalEducationOrganizations,
                                Key = client.ApiClientName + "LeaId"
                            });
                    }

                    if (app.Profiles != null)
                    {
                        _clientAppRepo.AddProfilesToApplication(app.Profiles, application.ApplicationId);
                    }
                }
            }

            CreateEnvironmentFile();

            void CreateEnvironmentFile()
            {
                if (!string.IsNullOrEmpty(_environmentFilePath) && new DirectoryInfo(_environmentFilePath).Exists)
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
                            Value = _apiSettings.IsFeatureEnabled(ApiFeature.Composites.ToString()),
                            Key = "CompositesFeatureIsEnabled"
                        });

                    postmanEnvironment.Values.Add(
                        new ValueItem
                        {
                            Enabled = true,
                            Value = _apiSettings.IsFeatureEnabled(ApiFeature.Profiles.ToString()),
                            Key = "ProfilesFeatureIsEnabled"
                        });

                    var jsonString = JsonConvert.SerializeObject(
                        postmanEnvironment,
                        Formatting.Indented,
                        new JsonSerializerSettings {ContractResolver = new CamelCasePropertyNamesContractResolver()});

                    var fileName = Path.Combine(_environmentFilePath, "environment.json");

                    File.WriteAllText(fileName, jsonString);
                }
            }

            List<Vendor> CreateDefaultVendor()
            {
                var apiClient = new ApiClient
                {
                    ApiClientName = "Api",
                    LocalEducationOrganizations = new List<int> {255901}
                };

                var application = new Application
                {
                    ApplicationName = "Default Application",
                    ClaimSetName = "Ed-Fi Sandbox",
                    ApiClients = new List<ApiClient> {apiClient}
                };

                var vendor = new Vendor
                {
                    Email = "test@ed-fi.org",
                    VendorName = "Test Admin",
                    Applications = new List<Application> {application},
                    NamespacePrefixes = new List<string>
                    {
                        "uri://ed-fi.org",
                        "uri://gbisd.edu",
                        "uri://tpdm.ed-fi.org"
                    }
                };

                return new List<Vendor> {vendor};
            }

            string GetGuid()
            {
                return Guid.NewGuid().ToString("N").Substring(0, 20);
            }
        }
    }
}
