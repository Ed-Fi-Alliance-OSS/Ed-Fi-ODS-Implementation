/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */
package lib.templates

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

open class BuildSharedLibraryBase : _self.templates.BuildAndTestBaseClass() {
    init {
        name = "Build Shared Library"

        params {
            param("project.testDirectory", "Ed-Fi-ODS/tests/%project.name%.UnitTests/**")
            param("version.prerelease", "pre%build.counter%")
            param("project.file.sln", "%project.directory%/%project.name%.sln")
            param("project.file.csproj", "%project.directory%/%project.name%.csproj")
            param("version.informational", "%version.core%")
            param("project.rootDirectory", "Ed-Fi-ODS/application/")
            param("project.directory", "%project.rootDirectory%/%project.name%")
            // This allows a build type to "inherit" the default rule
            // set and add extra rules, withoutout having to duplicate
            // the inherited/default rules. For example, can customize
            // with param("vcs.checkout.rules.ods.additional", "+:tests/%project.name%.IntegrationTests => ...etc")
            param("vcs.checkout.rules.ods.additional", "")
            param("vcs.checkout.rules.ods", """
                +:Application/%project.name% => Ed-Fi-ODS/Application/%project.name%
                +:tests/%project.name%.UnitTests => Ed-Fi-ODS/tests/%project.name%.UnitTests
                +:tests/EdFi.TestFixture => Ed-FI-ODS/tests/EdFi.TestFixture
                %vcs.checkout.rules.ods.additional%
            """.trimIndent())
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
            // NB: the `dotnetTest` build step was not causing the build to fail, even
            // with the base template class having a "fail on metrics" condition set.
            // Therefore running through PowerShell and writing a failure message
            // out to TeamCity
            // powerShell {
            //     name = "Test - PS"
            //     id = "BuildSharedLibrary_Test_PS"
            //     formatStderrAsError = true
            //     scriptMode = script {
            //         content = """
            //             ${"$"}parameters = @(
            //                 "test", "%project.file.sln%",
            //                 "-c", "%msbuild.configuration%",
            //                 "--no-build"
            //             )
            //             &dotnet @parameters

            //             if (${"$"}LASTEXITCODE -ne 0) {
            //                 Write-Host "##teamcity[buildProblem description='Test failures occurred, review log for details']"
            //             }
            //         """.trimIndent()
            //     }
            // }
        }
    }
}
