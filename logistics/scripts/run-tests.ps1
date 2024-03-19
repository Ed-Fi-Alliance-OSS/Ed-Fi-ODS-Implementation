# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

& "$PSScriptRoot\modules\load-path-resolver.ps1"

$testAssemblies = (Get-ChildItem -recurse -File $((Get-RepositoryRoot "ed-fi-ods") + "\*Tests.dll") | Where-Object { $_.FullName -match "\\bin\\?" -and $_.FullName -notmatch "\\net48\\?" -and $_.fullName -notmatch "ApprovalTests.dll" -and $_.fullName -notmatch "\\ref\\?" })
$reports = (Get-RepositoryRoot "ed-fi-ods-implementation") + "\reports\"

if (Test-Path $reports) {
    Remove-Item -Path $reports -Force -Recurse
}

New-Item -ItemType Directory -Force -Path $reports

foreach ($assembly in $testAssemblies) {
    Write-Host ( "Testing assembly " + $assembly)

    if (Test-TeamCityVersion) {
        $reportName = $reports + (Get-ChildItem $assembly | Select-Object -ExpandProperty Name) + ".xml"
    } else {
        $reportName = $reports + (Get-ChildItem $assembly | Select-Object -ExpandProperty Name) + ".trx"
    }

    & dotnet test $assembly --logger ("trx;LogFileName=" + $reportName)

    Write-Host "assembly exit code: $LASTEXITCODE"
}