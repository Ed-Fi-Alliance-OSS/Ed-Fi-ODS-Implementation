// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System.Web.Optimization;

namespace EdFi.Ods.SandboxAdmin.Web
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(
                new ScriptBundle("~/bundles/scripts")
                   .Include(
                        "~/Content/Scripts/extensions.js",
                        "~/Content/Scripts/globals.js",
                        "~/Content/Scripts/edfiadmin.auth.js",
                        "~/Content/Scripts/underscore.js"
                    )
            );

            bundles.Add(
#if DEBUG
                new Bundle("~/bundles/client")
#else
                new ScriptBundle("~/bundles/client")
#endif
                   .Include(
                        "~/Content/Scripts/client.js"
                    )
            );

            bundles.Add(
                new ScriptBundle("~/bundles/sandbox")
                   .Include(
                        "~/Content/Scripts/sandbox.js"
                    )
            );

            bundles.Add(
                new StyleBundle("~/Content/StyleSheets/basecss")
                   .Include("~/Content/StyleSheets/Bootstrap_Bootswatch_Flatly.css")
                   .Include("~/Content/StyleSheets/font-awesome.css")
                   .Include("~/Content/StyleSheets/Site.css")
                   .Include("~/Content/StyleSheets/bootstrap-glyphicons.css")
            );

            BundleTable.EnableOptimizations = true;
        }
    }
}
