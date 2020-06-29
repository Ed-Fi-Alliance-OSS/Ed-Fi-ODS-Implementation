// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

package lib.templates

import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetBuild
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.dotnetTest

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
                +:Application/NuGetArtifacts => Ed-Fi-ODS/Application/NuGetArtifacts
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
                args = "-p:AssemblyVersion=%version.core%.%build.counter% -p:FileVersion=%version.core%.%build.counter% -p:InformationalVersion=%version.core%"
            }
            dotnetTest {
                name = "Test"
                id = "BuildSharedLibrary_Test"
                projects = "%project.file.sln%"
                configuration = "%msbuild.configuration%"
                args = "%dotnet.test.args%"
                skipBuild = true
                param("dotNetCoverage.dotCover.home.path", "%teamcity.tool.JetBrains.dotCover.CommandLineTools.DEFAULT%")
            }
        }
    }
}
