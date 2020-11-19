# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# TeamCity build script used to deploy all the databases.
$ErrorActionPreference = 'Stop'
$Error.Clear()

& "$PSScriptRoot\..\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'Application\SolutionScripts\InitializeDevelopmentEnvironment.psm1')

Write-Warning "'logistics/scripts/activities/build/initialize-database/initialize-test-database.ps1' is deprecated, and will be removed in the near future. Please use the 'Application/SolutionScripts/InitializeDevelopmentEnvironment.psm1' instead."

Invoke-ConfigTransform
Reset-TestAdminDatabase
Reset-TestSecurityDatabase
Reset-TestPopulatedTemplateDatabase
Initialize-DeploymentEnvironment
Test-Error
