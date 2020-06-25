/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */
package _self.templates

import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.commitStatusPublisher
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.replaceContent
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.swabra
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetBuild
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetNugetPush
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetPack
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetTest
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.powerShell
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.vcs
import jetbrains.buildServer.configs.kotlin.v2019_2.vcs.GitVcsRoot

open class BuildSharedLibraryBase : BuildAndTestBaseClass() {
    init {
        name = "Build Shared Library"

        params {
            param("project.testDirectory", "Ed-Fi-ODS/tests/%project.name%.UnitTests/**")
            param("version.prerelease", "pre%build.counter%")
            param("project.name", "%system.teamcity.buildConfName%")
            param("project.file.sln", "%project.directory%/%project.name%.sln")
            param("project.file.csproj", "%project.directory%/%project.name%.csproj")
            param("version.informational", "%version.core%")
            param("project.rootDirectory", "Ed-Fi-ODS/application/")
            param("project.directory", "%project.rootDirectory%/%project.name%")
        }

        steps {
            dotnetBuild {
                name = "Build"
                id = "BuildSharedLibrary_Build"
                projects = "%project.file.sln%"
                configuration = "%msbuild.configuration%"
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
            dotnetTest {
                name = "Test"
                id = "BuildSharedLibrary_Test"
                projects = "%project.file.sln%"
                configuration = "%msbuild.configuration%"
                skipBuild = true
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
        }
    }
}
