﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EdFi.Admin.DataAccess.Utils;
using EdFi.Ods.Sandbox.Repositories;
using EdFi.Ods.SandboxAdmin.Security;
using EdFi.Ods.SandboxAdmin.Services;
using log4net;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.Sandbox.Admin.Initialization
{
    public interface IInitializationEngine
    {
        Task CreateIdentityRoles();

        Task CreateIdentityUsers();

        void CreateVendors();

        void CreateSandboxes();

        void RebuildSandboxes();

        void UpdateClientWithLEAIdsFromPopulatedSandbox();
    }

    public class InitializationEngine : IInitializationEngine
    {
        private readonly ILog _log = LogManager.GetLogger(typeof(InitializationEngine));
        private readonly IClientAppRepo _clientAppRepo;
        private readonly IClientCreator _clientCreator;
        private readonly ITemplateDatabaseLeaQuery _templateDatabaseLeaQuery;
        private readonly IDefaultApplicationCreator _applicationCreator;
        private readonly IIdentityProvider _identityProvider;

        private readonly Dictionary<string, UserOptions> _users;

        public InitializationEngine(
            IOptions<Dictionary<string, UserOptions>> users,
            IClientAppRepo clientAppRepo,
            IClientCreator clientCreator,
            ITemplateDatabaseLeaQuery templateDatabaseLeaQuery,
            IDefaultApplicationCreator applicationCreator,
            IIdentityProvider identityProvider
            )
        {
            _users = users.Value;
            _clientAppRepo = clientAppRepo;
            _clientCreator = clientCreator;
            _templateDatabaseLeaQuery = templateDatabaseLeaQuery;
            _applicationCreator = applicationCreator;
            _identityProvider = identityProvider;
        }

        public async Task CreateIdentityRoles()
        {
            try
            {
                foreach (var role in SecurityRoles.AllRoles)
                {
                    await _identityProvider.CreateRole(role);
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex);
            }
        }

        public async Task CreateIdentityUsers()
        {
            try
            {
                foreach (var user in _users)
                {
                    var identityUser = await _identityProvider.FindUser(user.Key);

                    if (identityUser != null)
                    {
                        return;
                    }

                    _log.Debug($"Adding user: {user.Value} to asp net security.");

                    if (await _identityProvider.CreateUser(
                        user.Key, user.Value.Email, user.Value.Password, confirm: true))
                    {
                        identityUser = await _identityProvider.FindUser(user.Key);
                        var roles = new string[] { };

                        if (user.Value.Admin)
                        {
                            roles = new string[] { "Administrator" };
                        }

                        _log.Debug($"Adding user: {user.Value} to roles:  {string.Join(",", roles)} in asp net security.");
                        await _identityProvider.AddToRoles(identityUser.Id, roles);
                    }
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex);
            }
        }

        public void CreateVendors()
        {
            try
            {
                foreach (var user in _users)
                {
                    var namespacePrefixes = user.Value.NamespacePrefixes.ToList();

                    _log.Info($"Creating vendor {user.Value} with namespace prefixes {string.Join(",", namespacePrefixes)}");
                    _clientAppRepo.SetDefaultVendorOnUserFromEmailAndName(user.Value.Email, user.Key, namespacePrefixes);
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex);
            }
        }

        public void CreateSandboxes()
        {
            try
            {
                foreach (var user in _users)
                {
                    var clientProfile = _clientAppRepo.GetUser(user.Value.Email);

                    foreach (var sandboxKeyValuePair in user.Value.Sandboxes)
                    {
                        var sandboxName = sandboxKeyValuePair.Key;
                        var sandboxOptions = sandboxKeyValuePair.Value;

                        if (clientProfile.ApiClients.Any(c => c.Key == sandboxOptions.Key))
                        {
                            continue;
                        }

                        _log.Info($"Creating sandbox {sandboxName} for user {user.Key}");
                        _clientCreator.CreateNewSandboxClient(sandboxName, sandboxOptions, clientProfile);
                    }
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex);
            }
        }

        public void RebuildSandboxes()
        {
            try
            {
                foreach (var user in _users)
                {
                    var clientProfile = _clientAppRepo.GetUser(user.Value.Email);

                    foreach (var sandbox in user.Value.Sandboxes.Where(x => x.Value.Refresh))
                    {
                        _log.Debug($"Resetting sandbox {sandbox.Key} for {clientProfile.Vendor.VendorName}");
                        _clientCreator.ResetSandboxClient(sandbox.Key, sandbox.Value, clientProfile);
                    }
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex);
            }
        }

        public void UpdateClientWithLEAIdsFromPopulatedSandbox()
        {
            foreach (var user in _users)
            {
                var clientProfile = _clientAppRepo.GetUser(user.Value.Email);

                // look through all the sandboxes that are populated so we can get the lea ids from the created sandbox.
                // note our current template process has the populated data with lea's installed in it.
                foreach (var apiClient in clientProfile.ApiClients)
                {
                    var leaIds = _templateDatabaseLeaQuery.GetLocalEducationAgencyIds(apiClient.Key).ToList();

                    _applicationCreator.AddLeaIdsToApplication(leaIds, apiClient.Application.ApplicationId);
                }
            }
        }
    }
}
