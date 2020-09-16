# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

Import-Module -Force -Global "$PSScriptRoot\modules\path-resolver.psm1"

$testAssemblies = (Get-ChildItem -recurse -File $((Get-RootBasedRepositoryPath "ed-fi-ods") + "\*Tests.dll") | Where-Object { $_.FullName -match "\\bin\\?" -and $_.FullName -notmatch "\\net48\\?" -and $_.fullName -notmatch "ApprovalTests.dll" })
$reports = (Get-RootBasedRepositoryPath "ed-fi-ods-implementation") + "\reports\"

if (-not (Test-Path $reports))
{
    New-Item -ItemType Directory -Force -Path $reports
}

$failed = $false

foreach ($assembly in $testAssemblies) {
    Write-Host ( "Testing assembly " + $assembly)

    $reportName = $reports + (Get-ChildItem $assembly | Select-Object -ExpandProperty Name) + ".xml"

    & dotnet test $assembly --logger ("trx;LogFileName=" + $reportName)

    if ($LASTEXITCODE = 1)
    {
        $failed = $true
    }
}

if ($failed)
{
    $EXITCODE = 1
}
else {
    $EXITCODE = 0
}