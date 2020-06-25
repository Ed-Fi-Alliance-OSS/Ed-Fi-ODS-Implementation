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

object BuildAndPackageSharedLibrary : BuildAndTestBaseClass() {
    init {
        name = "Build and Package Shared Library"

        artifactRules = "**/%project.name%*.nupkg"
        publishArtifacts = PublishMode.SUCCESSFUL

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
                id = "Build"
                projects = "%project.file.sln%"
                configuration = "%msbuild.configuration%"
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
            dotnetTest {
                name = "Test"
                id = "Test"
                projects = "%project.file.sln%"
                configuration = "%msbuild.configuration%"
                skipBuild = true
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
            dotnetPack {
                name = "Pack Pre-Release"
                id = "Pack_PreRelease"
                projects = "%project.file.csproj%"
                configuration = "%msbuild.configuration%"
                outputDir = "%teamcity.build.checkoutDir%"
                skipBuild = true
                args = """-p:VersionPrefix=%version.core% --version-suffix "%version.prerelease%""""
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
            dotnetPack {
                name = "Pack Release"
                id = "Pack_Release"
                projects = "%project.file.csproj%"
                configuration = "%msbuild.configuration%"
                outputDir = "%teamcity.build.checkoutDir%"
                skipBuild = true
                args = "-p:VersionPrefix=%version.core%"
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
        }

        triggers {
            vcs {
                id = "vcsTrigger"
                triggerRules = """
                    +:%project.directory%/**
                    +:%project.testDirectory%/**
                """.trimIndent()
            }
        }

        features {
            replaceContent {
                id = "Replace_AssemblyVersion"
                fileRules = "**/Directory.Build.props"
                pattern = """(<(AssemblyVersion)\s*>).*(<\/\s*\2\s*>)"""
                replacement = "${'$'}1%version.core%.%build.counter%${'$'}3"
            }
            replaceContent {
                id = "Replace_FileVersion"
                fileRules = "**/Directory.Build.props"
                pattern = """(<(FileVersion)\s*>).*(<\/\s*\2\s*>)"""
                replacement = "${'$'}1%version.core%.%build.counter%${'$'}3"
            }
            replaceContent {
                id = "Replace_InformationalVersion"
                fileRules = "**/Directory.Build.props"
                pattern = """(<(InformationalVersion)\s*>).*(<\/\s*\2\s*>)"""
                replacement = "${'$'}1%version.informational%${'$'}3"
            }
        }
    }
}
