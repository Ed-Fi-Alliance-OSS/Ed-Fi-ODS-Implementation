// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

package lib.edFiLoadTools

import jetbrains.buildServer.configs.kotlin.v2019_2.*

object EdFiLoadToolsProject : Project({
    name = "EdFi.LoadTools"
    id = RelativeId("EdFiLoadTools")
    description = "Build configurations for the EdFi.LoadTools solution and library"

    buildType(lib.edFiLoadTools.buildTypes.PullRequestBuild)
    buildType(lib.edFiLoadTools.buildTypes.BranchBuild)

    params {
        param("project.name", "EdFi.LoadTools")
        param("project.directory", "Ed-Fi-ODS/Utilities/DataLoading")
        param("project.file.sln", "%project.directory%/LoadTools.sln")
        param("project.file.csproj", "%project.directory%/%project.name%/%project.name%.csproj")
        param("project.testDirectory", "%project.directory%/%project.name%.Test/**")
        param("version.core", "%api.semantic.version%")

        // Need all new rules, default are not helpful here
        param("vcs.checkout.rules.ods.additional", "")
        param("vcs.checkout.rules.ods", """
            +:Utilities/DataLoading => Ed-Fi-ODS/Utilities/DataLoading
            +:Application/NuGetArtifacts => Ed-Fi-ODS/Application/NuGetArtifacts
        """.trimIndent())

        param("dotnet.test.args", "--filter TestCategory!~\"Run Manually\"")
    }
})
