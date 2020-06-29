// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

package lib.templates

import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetBuild
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetNugetPush
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetPack
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.powerShell
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.vcs
import jetbrains.buildServer.configs.kotlin.v2019_2.vcs.GitVcsRoot

object BuildAndPackageSharedLibrary : BuildSharedLibraryBase() {
    init {
        name = "Build and Package Shared Library"

        artifactRules = "**/%project.name%*.nupkg"

        steps {
            powerShell {
                name ="Created Four-Digit Build Number"
                executionMode = BuildStep.ExecutionMode.RUN_ON_SUCCESS
                id = "BuildAndPackageSharedLibrary_Padded_BuildNumber"
                formatStderrAsError = true
                scriptMode = script {
                    content = """
                        ${"$"}padded = "%build.counter%".PadLeft(4,'0')
                        Write-Host "##teamcity[setParameter name='build.counter' value='${"$"}padded']"
                    """.trimIndent()
                }
            }
            dotnetPack {
                name = "Pack Pre-Release"
                executionMode = BuildStep.ExecutionMode.RUN_ON_SUCCESS
                id = "BuildAndPackageSharedLibrary_Pack_PreRelease"
                projects = "%project.file.csproj%"
                configuration = "%msbuild.configuration%"
                outputDir = "%teamcity.build.checkoutDir%"
                skipBuild = true
                args = """-p:VersionPrefix=%version.core% --version-suffix "%version.prerelease%""""
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
            dotnetPack {
                name = "Pack Release"
                executionMode = BuildStep.ExecutionMode.RUN_ON_SUCCESS
                id = "BuildAndPackageSharedLibrary_Pack_Release"
                projects = "%project.file.csproj%"
                configuration = "%msbuild.configuration%"
                outputDir = "%teamcity.build.checkoutDir%"
                skipBuild = true
                args = "-p:VersionPrefix=%version.core%"
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
            dotnetNugetPush {
                name = "Publish Pre-Release"
                executionMode = BuildStep.ExecutionMode.RUN_ON_SUCCESS
                id = "BuildAndPackageSharedLibrary_Publish_PreRelease"
                packages = "%project.name%.%version.core%-%version.prerelease%.nupkg"
                serverUrl = "%myget.feed%"
                apiKey = "%myget.apiKey%"
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
        }

        triggers {
            vcs {
                id = "vcsTrigger"
                branchFilter = "+:<default>"
            }
        }
    }
}
