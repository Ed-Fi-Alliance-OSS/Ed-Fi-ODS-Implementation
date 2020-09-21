// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Routing;

namespace EdFi.Ods.SandboxAdmin.Services
{
    public class RouteService : IRouteService
    {
        private readonly IActionContextAccessor _actionContextAccessor;

        public RouteService(IActionContextAccessor actionContextAccessor)
        {
            _actionContextAccessor = actionContextAccessor;
        }

        private UrlHelper Url
        {
            get { return new UrlHelper(_actionContextAccessor.ActionContext); }
        }

        public string GetRouteForPasswordReset(string email, string marker)
        {
            return Url.Action(
                           "ResetPassword",
                           "Account",
                           new
                           {
                               Email = email,
                               Marker = marker
                           });
        }

        public string GetRouteForActivation(string email, string marker)
        {
            return Url.Action(
                           "ActivateAccount",
                           "Account",
                           new
                           {
                               Email = email,
                               Marker = marker
                           });
        }
    }
}