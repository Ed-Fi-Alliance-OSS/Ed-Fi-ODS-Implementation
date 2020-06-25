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
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.pullRequests
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.PullRequests
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.vcs
import jetbrains.buildServer.configs.kotlin.v2019_2.triggers.VcsTrigger

object BuildSharedLibraryPullRequest : BuildSharedLibraryBase() {
    init {
        params {
            // This allows a build type to "inherit" the default rule
            // set and add extra rules, withoutout having to duplicate
            // the inherited/default rules. For example, can customize
            // with param("vcs.checkout.rules.ods.additional", "+:tests/%project.name%.IntegrationTests => ...etc")
            param("vcs.checkout.rules.ods.additional", "")
            param("vcs.checkout.rules.ods", """
                +:Application/%project.name% => Ed-Fi-ODS/Application/%project.name%
                +:tests/%project.name%.UnitTests => Ed-Fi-ODS/tests/%project.name%.UnitTests
                %vcs.checkout.rules.ods.additional%
            """.trimIndent())
                // +:tests/EdFi.TestFixture => Ed-FI-ODS/tests/EdFi.TestFixture
        }

        features {
            commitStatusPublisher {
                publisher = github {
                    githubUrl = "https://api.github.com"
                    authType = personalToken {
                        token = "%github.accessToken%"
                    }
                }
            }
            pullRequests {
                vcsRootExtId = "${_self.vcsRoots.EdFiOds.id}"
                provider = github {
                    authType = vcsRoot()
                    filterTargetBranch = "+:<default>"
                    filterAuthorRole = PullRequests.GitHubRoleFilter.MEMBER_OR_COLLABORATOR
                }
            }
        }

        triggers {
            vcs {
                id ="vcsTrigger"
                quietPeriodMode = VcsTrigger.QuietPeriodMode.USE_CUSTOM
                quietPeriod = 120
                // This allows triggering on "anything" and then removes
                // triggering on the default branch and in feature branches,
                // thus leaving only the pull requests.
                branchFilter = """
                    +:*
                    -:<default>
                    -:refs/heads
                """.trimIndent()
            }
        }
    }
}
