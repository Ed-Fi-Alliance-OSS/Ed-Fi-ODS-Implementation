# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\nuget-helper.psm1')
Import-Module (Get-RepositoryResolvedPath "logistics\scripts\modules\tools\ToolsHelper.psm1")

$pluginPaths = @()

$parameters = @{
    packageName     = "EdFi.Suite3.Ods.Extensions.Sample"
    packageVersion  = "5.0.0-b10271"
    packageSource   = "https://www.myget.org/F/ed-fi/"
    outputDirectory = "$PSScriptRoot"
    toolsPath       = (Get-ToolsPath)
}
$pluginPaths += Get-NuGetPackage @parameters

$parameters = @{
    packageName     = "EdFi.Suite3.Ods.Extensions.Homograph"
    packageVersion  = "5.1.0-b10399"
    packageSource   = "https://www.myget.org/F/ed-fi/"
    outputDirectory = "$PSScriptRoot"
    toolsPath       = (Get-ToolsPath)
}
$pluginPaths += Get-NuGetPackage @parameters

return $pluginPaths
