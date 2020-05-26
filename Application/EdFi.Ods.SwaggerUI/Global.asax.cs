// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Web;

namespace EdFi.Ods.SwaggerUI
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e) { }

        protected void Session_Start(object sender, EventArgs e) { }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            bool isSiteRootPath = Request.ApplicationPath == "/";

            bool isVirtualRootPath = Request.ApplicationPath != null
                                     && Request.ApplicationPath.Equals(Request.Path, StringComparison.OrdinalIgnoreCase);

            if (isSiteRootPath || !isVirtualRootPath)
            {
                return;
            }

            var redirectUrl = VirtualPathUtility.AppendTrailingSlash(Request.ApplicationPath);
            Response.RedirectPermanent(redirectUrl);
        }

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("server");
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e) { }

        protected void Application_Error(object sender, EventArgs e) { }

        protected void Session_End(object sender, EventArgs e) { }

        protected void Application_End(object sender, EventArgs e) { }
    }
}
