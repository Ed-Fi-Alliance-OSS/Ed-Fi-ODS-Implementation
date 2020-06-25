/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */

// This base class should be used by all templates

package _self.templates

import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.freeDiskSpace
import jetbrains.buildServer.configs.kotlin.v2019_2.buildFeatures.swabra
import jetbrains.buildServer.configs.kotlin.v2019_2.buildSteps.powerShell

open class BuildAndTestBaseClass : Template({

    option("shouldFailBuildOnAnyErrorMessage", "true")

    features {
        freeDiskSpace {
            id = "jetbrains.agent.free.space"
            requiredSpace = "%build.feature.freeDiskSpace%"
            failBuild = true
        }
        // The default setting is to clean before next build
        swabra {
        }
    }

    params {
        param("vcs.checkout.rules.implementation", "+:. => Ed-Fi-ODS-Implementation")
        param("vcs.checkout.rules.ods", "+:. => Ed-Fi-ODS")
    }

    vcs {
        root(_self.vcsRoots.EdFiOds, "%vcs.checkout.rules.ods%")
        // This attached the Ed-Fi-ODS-Implementation repository
        root(DslContext.settingsRoot, "%vcs.checkout.rules.implementation%")
    }
})
