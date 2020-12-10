# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

Import-Module (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\nuget-helper.psm1')
Import-Module (Get-RepositoryResolvedPath "logistics\scripts\modules\tools\ToolsHelper.psm1")

$pluginPaths = @()

$parameters = @{
    packageName     = "EdFi.Suite3.Ods.Extensions.TPDM"
    packageVersion  = "5.2.0-b10505"
    packageSource   = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
    outputDirectory = "$PSScriptRoot"
    toolsPath       = (Get-ToolsPath)
}
$pluginPaths += Get-NuGetPackage @parameters

return $pluginPaths
