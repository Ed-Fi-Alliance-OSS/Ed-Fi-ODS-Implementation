/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */

package lib.edFiSecurityDataAccess

import jetbrains.buildServer.configs.kotlin.v2019_2.*

object EdFiSecurityDataAccessProject : Project({
    name = "EdFi.Security.DataAccess"
    id = RelativeId("EdFiSecurityDataAccess")
    description = "Build configurations for the EdFi.Admin.DataAccess shared library"

    buildType(lib.edFiSecurityDataAccess.buildTypes.PullRequestBuild)
    buildType(lib.edFiSecurityDataAccess.buildTypes.BranchBuild)

    params {
        param("project.name", "EdFi.Security.DataAccess")
        param("version.core", "%api.semantic.version%")

        // This project has a direct dependency on EdFi.Common
        param("vcs.checkout.rules.ods.additional", "+:Application/EdFi.Common=>Ed-Fi-ODS/Application/EdFi.Common")
    }
})
