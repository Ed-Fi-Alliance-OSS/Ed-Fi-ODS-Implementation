/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */
package installers.templates

import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.powerShell
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.vcs
import jetbrains.buildServer.configs.kotlin.v2019_2.vcs.GitVcsRoot

object PackageAndPublishInstallerLibrary : _self.templates.BuildAndTestBaseClass() {
    init {
        name = "Build and Publish Installer Package"

        artifactRules = "*.nupkg"
        publishArtifacts = PublishMode.SUCCESSFUL

        option("shouldFailBuildOnAnyErrorMessage", "true")

        params {
            param("version.preReleaseLabel", "pre")
            param("project.name", "%system.teamcity.buildConfName%")
            param("project.shouldPublishPreRelease", "true")
            param("project.directory", "Ed-Fi-ODS-Implementation/scripts/NuGet/%project.name%")
            // Ignore ODS repo
            param("vcs.checkout.rules.ods", "-:.")
            // Only checkout the installer project directory
            param("vcs.checkout.rules.implementation", """
                +:scripts/NuGet => scripts/NuGet
                %vcs.checkout.rules.implementation.additional%
            """)
        }

        steps {
            powerShell {
                name = "Build Pre-release and release, publish pre-release package"
                id = "PackageAndPublishInstallerLibrary_PackPreRelease"
                formatStderrAsError = true
                workingDir = "%project.directory%"
                scriptMode = script {
                    content = """
                        ${"$"}parameters = @{
                            SemanticVersion = "%version%"
                            BuildCounter = "%build.counter%"
                            PreReleaseLabel = "%version.preReleaseLabel%"
                            Publish = [System.Convert]::ToBoolean("%project.shouldPublishPreRelease%")
                            NuGetFeed = "%myget.feed%"
                            NuGetApiKey = "%myget.apiKey%"
                        }
                        .\build-package.ps1 @parameters
                    """.trimIndent()
                }
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
