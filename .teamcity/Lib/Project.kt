// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

package lib

import jetbrains.buildServer.configs.kotlin.v2019_2.*

object SharedLibrariesProject : Project({
    name = "Shared Libraries"
    id = RelativeId("SharedLibraries")
    description = "Build configurations for shared libraries"

    params {
        param("api.semantic.version", "4.0.0")
    }

    subProject(lib.edFiCommon.EdFiCommonProject)
    subProject(lib.edFiAdminDataAccess.EdFiAdminDataAccessProject)
    subProject(lib.edFiSecurityDataAccess.EdFiSecurityDataAccessProject)
    subProject(lib.edFiLoadTools.EdFiLoadToolsProject)

    template(lib.templates.BuildSharedLibraryPullRequest)
    template(lib.templates.BuildAndPackageSharedLibrary)
})
