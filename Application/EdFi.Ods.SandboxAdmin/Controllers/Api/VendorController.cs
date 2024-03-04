// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Admin.DataAccess.Models;
using EdFi.Admin.DataAccess.Repositories;
using EdFi.Ods.Sandbox.Provisioners;
using EdFi.Ods.SandboxAdmin.Models.Vendor;
using EdFi.Ods.SandboxAdmin.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace EdFi.Ods.SandboxAdmin.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class VendorController : ControllerBase
    {
        private readonly ISandboxProvisioner _sandboxProvisioner;
        private readonly IClientCreator _clientCreator;
        private readonly IClientAppRepo _clientAppRepo;

        public VendorController(IClientAppRepo clientAppRepo, IClientCreator clientCreator)
        {
            _clientAppRepo = clientAppRepo;
            _clientCreator = clientCreator;
        }

        [HttpGet]
        public Task<IActionResult> GetVendors()
        {
            try
            {
                var vendors = _clientAppRepo.GetVendors();
                var models = vendors.Select(ToVendorIndexViewModel)
                                   .ToArray();
                return Task.FromResult<IActionResult>(Ok(models));
            }
            catch (Exception e)
            {
                var currentException = e;
                var counter = 0;
                var message = string.Empty;

                while (currentException != null)
                {
                    Trace.TraceError("{0}: {1}", currentException.Message, currentException.StackTrace);
                    message += string.Format("{0}:{1}", counter, currentException.Message);
                    counter++;
                    currentException = currentException.InnerException;
                }

                throw new Exception(string.Format("Unhandled exception with these messages: {0}", message));
            }
        }

        private VendorIndexViewModel ToVendorIndexViewModel(Vendor vendor)
        {
            var namespacePrefix = vendor.VendorNamespacePrefixes.Select(a => a.NamespacePrefix).FirstOrDefault();

            var user = vendor.Users.Where(a => a.Vendor.VendorId == vendor.VendorId).FirstOrDefault();

            VendorIndexViewModel viewModel = new VendorIndexViewModel
            {
                Id = vendor.VendorId,
                Name = vendor.VendorName,
                NamespacePrefix = namespacePrefix,
                ContactName = user.FullName,
                ContactEmailAddress = user.Email
            };
            return viewModel;
        }

        [HttpPost]
        public IActionResult PostVendor([FromBody] VendorCreateModel vendorCreateModel)
        {
            var vendors = _clientAppRepo.GetVendors();
            if (vendors!=null && vendors.Any(a => a.VendorName == vendorCreateModel.VendorName))
            {
                var message = $"The Vendor {vendorCreateModel.VendorName} already exists!";
                return BadRequest(message);
            }
            var newVendor = _clientAppRepo.CreateOrGetVendor(vendorCreateModel.VendorName, new string[] { vendorCreateModel.NamespacePrefix },vendorCreateModel.ContactName,vendorCreateModel.ContactEmailAddress);
            return Ok(ToVendorIndexViewModel(newVendor));
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteVendor(int id)
        {
            var vendor = _clientAppRepo.GetVendor(id);

            if (vendor == null)
            {
                return NotFound();
            }

            _clientAppRepo.DeleteVendor(vendor.VendorId);
            return NoContent();
        }
    }
}