/*
 * SPDX-License-Identifier: Apache-2.0
 * Licensed to the Ed-Fi Alliance under one or more agreements.
 * The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
 * See the LICENSE and NOTICES files in the project root for more information.
 */

package installers.buildTypes

import jetbrains.buildServer.configs.kotlin.v2019_2.*

object SwaggerUI : BuildType({
    templates(installers.templates.PackageAndPublishInstallerLibrary)
    id = RelativeId("Installers_SwaggerUI")
    name = "EdFi.Installer.SwaggerUI"
    description = "PowerShell deployment orchestration for ODS Swagger UI."

    publishArtifacts = PublishMode.SUCCESSFUL

    params {
        param("version", "1.0.0")
    }
})
