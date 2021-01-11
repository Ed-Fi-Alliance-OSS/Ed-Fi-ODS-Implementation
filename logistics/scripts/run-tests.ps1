# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\modules\load-path-resolver.ps1"

$solutionPath = (Get-RepositoryResolvedPath "Application/Ed-Fi-Ods.sln")
$reports = (Get-RepositoryRoot "ed-fi-ods-implementation") + "\reports\"

if (Test-Path $reports) {
    Remove-Item -Path $reports -Force -Recurse
}

New-Item -ItemType Directory -Force -Path $reports

Write-Host "Testing Solution at $solutionPath"

$reportName = $reports + "Ed-Fi-Ods-Tests.xml"

Write-Host -ForegroundColor Magenta "& dotnet test $solutionPath --no-build --no-restore --logger (""trx;LogFileName=$reportName"")"

& dotnet test $solutionPath --no-build --no-restore --logger ("trx;LogFileName=$reportName")
