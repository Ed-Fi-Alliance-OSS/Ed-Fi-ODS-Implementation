﻿# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

Import-Module -Force -Scope Global "$PSScriptRoot/nuget-helper.psm1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/utility/cross-platform.psm1")

function Restore-Packages {
    <#
    .SYNOPSIS
        Restores nuget packages and if necessary restores the NuGet.Cli.

    .DESCRIPTION
        Restores nuget packages for a specific solution file.

    .PARAMETER solutionPath
        Full path to the solution file.

    .PARAMETER toolsPath
        OPtional. The path to store nuget.exe to
    #>
    Param(
        [Parameter(Mandatory = $true)]
        [string] $solutionPath,

        [string] $toolsPath
    )

    & dotnet restore $solutionPath | Write-Host
}

Export-ModuleMember -Function Restore-Packages
