// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Admin.DataAccess.Utils;
using EdFi.Ods.SandboxAdmin.Security;
using EdFi.Ods.SandboxAdmin.Services;
using EdFi.Ods.Sandbox.Repositories;
using log4net;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.SandboxAdmin.Initialization
{
    public class InitializationEngine
    {
        private readonly ILog _log = LogManager.GetLogger(typeof(InitializationEngine));
        private readonly IClientAppRepo _clientAppRepo;
        private readonly IClientCreator _clientCreator;
        private readonly ITemplateDatabaseLeaQuery _templateDatabaseLeaQuery;
        private readonly IDefaultApplicationCreator _applicationCreator;
        private readonly IIdentityProvider _identityProvider;

        private readonly UserOptions _userOptions;

        public InitializationEngine(
            IOptions<UserOptions> userOptions,
            IClientAppRepo clientAppRepo,
            IClientCreator clientCreator,
            ITemplateDatabaseLeaQuery templateDatabaseLeaQuery,
            IDefaultApplicationCreator applicationCreator
            )
        {
            _userOptions = userOptions.Value;
            _clientAppRepo = clientAppRepo;
            _clientCreator = clientCreator;
            _templateDatabaseLeaQuery = templateDatabaseLeaQuery;
            _applicationCreator = applicationCreator;
        }

        public void CreateIdentityRoles()
        {
            try
            {
                foreach (var role in SecurityRoles.AllRoles)
                {
                    _identityProvider.CreateRole(role);
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
                var identityUser = await _identityProvider.FindUser(_userOptions.Name);

                if (identityUser != null)
                {
                    return;
                }

                _log.Debug($"Adding user: {_userOptions} to asp net security.");

                if (await _identityProvider.CreateUser(
                    _userOptions.Name, _userOptions.Email, _userOptions.Password, confirm: true))
                {
                    identityUser = await _identityProvider.FindUser(_userOptions.Name);
                    var roles = new string[] { };

                    if (_userOptions.Admin)
                    {
                        roles = new string[] { "Administrator" };
                    }

                    _log.Debug($"Adding user: {_userOptions} to roles:  {string.Join(",", roles)} in asp net security.");
                    await _identityProvider.AddToRoles(identityUser.Id, roles);
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
                var namespacePrefixes = _userOptions.NamespacePrefixes.ToList();

                _log.Info($"Creating vendor {_userOptions} with namespace prefixes {string.Join(",", namespacePrefixes)}");
                _clientAppRepo.SetDefaultVendorOnUserFromEmailAndName(_userOptions.Email, _userOptions.Name, namespacePrefixes);
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
                var clientProfile = _clientAppRepo.GetUser(_userOptions.Email);

                foreach (var sandboxKeyValuePair in _userOptions.Sandboxes)
                {
                    var sandboxName = sandboxKeyValuePair.Key;
                    var sandboxOptions = sandboxKeyValuePair.Value;

                    if (clientProfile.ApiClients.Any(c => c.Key == sandboxOptions.Key))
                    {
                        continue;
                    }

                    _log.Info($"Creating sandbox {sandboxName} for user {_userOptions.Name}");
                    _clientCreator.CreateNewSandboxClient(sandboxName, sandboxOptions, clientProfile);
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
                var clientProfile = _clientAppRepo.GetUser(_userOptions.Email);

                foreach (var sandbox in _userOptions.Sandboxes.Where(x => x.Value.Refresh))
                {
                    _log.Debug($"Resetting sandbox {sandbox.Key} for {clientProfile.Vendor.VendorName}");
                    _clientCreator.ResetSandboxClient(sandbox.Key, sandbox.Value, clientProfile);
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex);
            }
        }

        public void UpdateClientWithLEAIdsFromPopulatedSandbox()
        {
            var clientProfile = _clientAppRepo.GetUser(_userOptions.Email);

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
