# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
.synopsis
Prepare the EdFi.CloudOds nuspec file for use with 'nuget pack'

.parameter packageName
Name of the output package

.parameter artifactsDirectory
Path to folder where build artifacts are located

.parameter outputDirectory
Path where nuspec file will be output

#>
param(
    [parameter(mandatory=$true)] $packageName,
    $artifactsDirectory,
    $outputDirectory
)

Write-Warning "'Scripts/NuGet/EdFi.RestApi.Databases/prep-package-cloud.ps1' is deprecated, and will be removed in the near future. Functionality is now included in 'logistics/scripts/activities/build/CloudOds/PrepareDatabasesForExport.ps1' instead."

# Note: this cannot be done in the param block. $PSScriptRoot must not be available at that time.
if (-not $outputDirectory) {
    $outputDirectory = $PSScriptRoot
}

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\packaging.psm1')
$nuspecPath = "$outputDirectory\$packageName.nuspec"

# Create a Nuspec file with an empty <files> element
New-Nuspec -forceOverwrite -nuspecPath $nuspecPath -id $packageName -description $packageName -authors "Ed-Fi Alliance" -owners "Ed-Fi Alliance"

$filesToPackage = (gci $artifactsDirectory -Exclude *.nuspec | where { ! $_.PSIsContainer } | foreach { @{ source=$_.FullName; target="." } })

# Add all files in the artifacts directory to the root of the nuspec package definition
Add-FileToNuspec -nuspecPath $nuspecPath -sourceTargetPair $filesToPackage
