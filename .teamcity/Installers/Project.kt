/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */
package installers

import jetbrains.buildServer.configs.kotlin.v2019_2.*
import jetbrains.buildServer.configs.kotlin.v2019_2.Project

object InstallersProject : Project({
    name = "PowerShell Installer Packages"
    id = RelativeId("Installers")
    description = "Build configurations for PowerShell installer packages"

    params {
        param("api.semantic.version", "4.0.0")
    }

    buildType(installers.buildTypes.EdFiInstallerSandboxAdmin)

    template(installers.templates.PackageAndPublishInstallerLibrary)
})
