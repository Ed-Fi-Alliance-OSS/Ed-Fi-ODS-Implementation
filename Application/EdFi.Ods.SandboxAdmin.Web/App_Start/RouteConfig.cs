// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Web.Mvc;
using System.Web.Routing;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.IgnoreRoute(
                "{*favicon}",
                new
                {
                    favicon = @"(.*/)?favicon.ico(/.*)?"
                });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new
                          {
                              controller = "Home", action = "Index", id = UrlParameter.Optional
                          }
            );
        }
    }
}
