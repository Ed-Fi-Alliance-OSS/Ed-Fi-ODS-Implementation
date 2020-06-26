/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */

package lib.edFiLoadTools.buildTypes

import jetbrains.buildServer.configs.kotlin.v2019_2.*

object BranchBuild : BuildType ({
    name = "Branch Build, Package, and Publish"
    id = RelativeId("EdFiLoadTools_BranchBuild")

    templates(lib.templates.BuildAndPackageSharedLibrary)

    vcs {
        root(lib.edFiLoadTools.vcsRoots.EdFiStandard, "+:Schemas/Bulk => Ed-Fi-Standard/Schemas/Bulk")
    }
})
