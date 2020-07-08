// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Threading;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using CommandLine;
using EdFi.Ods.Admin.Initialization;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.Admin.Services;
using EdFi.Ods.Common.Configuration;
using EdFi.Security.DataAccess.Contexts;
using EdFi.Security.DataAccess.Repositories;
using Microsoft.Owin.Hosting;
using Newtonsoft.Json;
using EdFi.Ods.Sandbox.Repositories;
using EdFi.Ods.Sandbox.Provisioners;
using Newtonsoft.Json.Serialization;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class Program
    {
        private static TestHarnessConfiguration _testHarnessConfiguration = new TestHarnessConfiguration();

        internal static int Main(string[] args)
        {
            var result = ReturnStatus.Success;

            Options options = null;

            Parser.Default.ParseArguments<Options>(args)
                .WithParsed(opts => options = opts)
                .WithNotParsed(
                    errs =>
                    {
                        Console.WriteLine("Invalid options were entered.");
                        Console.WriteLine(errs.ToString());
                        result = ReturnStatus.Error;
                    });

            if (result != ReturnStatus.Success)
            {
                return (int) result;
            }

            if (!string.IsNullOrEmpty(options.ConfigurationFilePath))
            {
                if (!File.Exists(options.ConfigurationFilePath))
                {
                    throw new Exception($"Configuration file {options.ConfigurationFilePath} does not exists.");
                }

                _testHarnessConfiguration =
                    JsonConvert.DeserializeObject<TestHarnessConfiguration>(File.ReadAllText(options.ConfigurationFilePath));
            }
            else
            {
                _testHarnessConfiguration.Vendors = CreateDefaultVendor();
            }

            UpdateAdminDatabase();

            StartApi();

            void StartApi()
            {
                string baseAddress = ConfigurationManager.AppSettings["selfHost:baseAddress"] ?? "http://localhost:8765/";
                Console.WriteLine("Starting up API in OWin. Use Control-C to exit. ");
                Console.WriteLine("-----------------------------------------------");

                using (WebApp.Start<Startup>(url: baseAddress))
                {
                    Thread.Sleep(Timeout.Infinite);
                }
            }

            List<Vendor> CreateDefaultVendor()
            {
                var apiClient = new ApiClient
                {
                    ApiClientName = "Api",
                    LocalEducationOrganizations = new List<int> {255901}
                };

                var applicaton = new Application
                {
                    ApplicationName = "Default Application",
                    ClaimSetName = "Ed-Fi Sandbox",
                    ApiClients = new List<ApiClient> {apiClient}
                };

                var vendor = new Vendor
                {
                    Email = "test@ed-fi.org",
                    VendorName = "Test Admin",
                    Applications = new List<Application> {applicaton},
                    NamespacePrefixes = new List<string>
                    {
                        "uri://ed-fi.org",
                        "uri://gbisd.edu",
                        "uri://tpdm.ed-fi.org"
                    }
                };

                return new List<Vendor> {vendor};
            }

            void UpdateAdminDatabase()
            {
                using (var container = new WindsorContainer())
                {
                    RegisterComponents();
                    var applicationCreator = container.Resolve<IDefaultApplicationCreator>();
                    var clientAppRepo = container.Resolve<IClientAppRepo>();
                    var postmanEnvironment = new PostmanEnvironment();

                    clientAppRepo.Reset();

                    foreach (var vendor in _testHarnessConfiguration.Vendors)
                    {
                        var user = clientAppRepo.GetUser(vendor.Email) ??
                                   clientAppRepo.CreateUser(
                                       new User
                                       {
                                           FullName = vendor.VendorName,
                                           Email = vendor.Email,
                                           Vendor = clientAppRepo.CreateOrGetVendor(vendor.Email, vendor.VendorName, vendor.NamespacePrefixes)
                                       });

                        foreach (var app in vendor.Applications)
                        {
                            var application = clientAppRepo.CreateApplicationForVendor(
                                user.Vendor.VendorId, app.ApplicationName, app.ClaimSetName);

                            var leaIds = app.ApiClients.SelectMany(s => s.LocalEducationOrganizations).Distinct().ToList();
                            applicationCreator.AddLeaIdsToApplication(leaIds, application.ApplicationId);

                            foreach (var client in app.ApiClients)
                            {

                                var key = !string.IsNullOrEmpty(client.Key)
                                    ? client.Key
                                    : GetGuid();

                                var secret = !string.IsNullOrEmpty(client.Secret)
                                    ? client.Secret
                                    : GetGuid();

                                var apiClient = clientAppRepo.CreateApiClient(user.UserId, client.ApiClientName, key, secret);

                                postmanEnvironment.Values.Add(new ValueItem
                                {
                                    Enabled = true,
                                    Value = key,
                                    Key = "ApiKey_" + client.ApiClientName
                                });

                                postmanEnvironment.Values.Add(new ValueItem
                                {
                                    Enabled = true,
                                    Value = secret,
                                    Key = "ApiSecret_" + client.ApiClientName
                                });

                                clientAppRepo.AddLeaIdsToApiClient(
                                    user.UserId, apiClient.ApiClientId, client.LocalEducationOrganizations,
                                    application.ApplicationId);

                                postmanEnvironment.Values.Add(new ValueItem
                                {
                                    Enabled = true,
                                    Value = client.LocalEducationOrganizations,
                                    Key = client.ApiClientName + "LeaId"
                                });
                            }

                            if (app.Profiles != null)
                            {
                                clientAppRepo.AddProfilesToApplication(app.Profiles, application.ApplicationId);
                            }
                        }
                    }

                    CreateEnvironmentFile();

                    void CreateEnvironmentFile()
                    {
                        if (!string.IsNullOrEmpty(options.EnvironmentFilePath) && new DirectoryInfo(options.EnvironmentFilePath).Exists)
                        {
                            postmanEnvironment.Values.Add(new ValueItem
                            {
                                Enabled = true,
                                Value = ConfigurationManager.AppSettings["selfHost:baseAddress"] ?? "http://localhost:8765/",
                                Key = "ApiBaseUrl"
                            });

                            postmanEnvironment.Values.Add(new ValueItem
                            {
                                Enabled = true,
                                Value = ConfigurationManager.AppSettings["composites:featureIsEnabled"],
                                Key = "CompositesFeatureIsEnabled"
                            });

                            postmanEnvironment.Values.Add(new ValueItem
                            {
                                Enabled = true,
                                Value = ConfigurationManager.AppSettings["profiles:featureIsEnabled"],
                                Key = "ProfilesFeatureIsEnabled"
                            });

                            var jsonString = JsonConvert.SerializeObject(postmanEnvironment,
                                Formatting.Indented,
                                new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() });

                            var fileName = Path.Combine(options.EnvironmentFilePath, "environment.json");

                            File.WriteAllText(fileName, jsonString);
                        }
                    }

                    string GetGuid()
                    {
                        return Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);
                    }

                    void RegisterComponents()
                    {
                        container.Register(
                            Component
                                .For<IConfigConnectionStringsProvider>()
                                .ImplementedBy<AppConfigConnectionStringsProvider>(),
                            Component
                                .For<IConfigValueProvider>()
                                .ImplementedBy<AppConfigValueProvider>(),
                            Component
                                .For<IDatabaseTemplateLeaQuery>()
                                .ImplementedBy<DatabaseTemplateLeaQuery>(),
                            Component
                                .For<IDatabaseEngineProvider>()
                                .ImplementedBy<DatabaseEngineProvider>(),
                            Component
                                .For<IApiConfigurationProvider>()
                                .ImplementedBy<ApiConfigurationProvider>(),
                            Component
                                .For<IUsersContextFactory>()
                                .ImplementedBy<UsersContextFactory>(),
                            Component.For<IClientAppRepo>()
                                .ImplementedBy<ClientAppRepo>(),
                            Component
                                .For<ISecurityContextFactory>()
                                .ImplementedBy<SecurityContextFactory>(),
                            Component.For<ISecurityRepository>()
                                .ImplementedBy<SecurityRepository>(),
                            Component.For<IClientCreator>()
                                .ImplementedBy<ClientCreator>(),
                            Component.For<IDefaultApplicationCreator>()
                                .ImplementedBy<DefaultApplicationCreator>(),
                            Component
                                .For<IInitializationSettingsFactory, InitializationSettingsFactory>(),
                            Component
                                .For<InitializationModel>()
                                .UsingFactoryMethod(k => k.Resolve<IInitializationSettingsFactory>().GetInitializationModel()),
                            Component
                                .For<InitializationEngine>(),
                            Component
                                .For<ISandboxProvisioner, SqlSandboxProvisioner>());
                    }
                }
            }

            return (int) ReturnStatus.Success;
        }

        private enum ReturnStatus
        {
            Success = 0,
            Error = 1
        }
    }
}
