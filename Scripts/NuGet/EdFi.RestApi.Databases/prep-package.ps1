# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
.synopsis
Prepare the EdFi.RestApi.Databases nuspec file for use with 'nuget pack'

.notes
The format of the EdFi Database Deployment NuGet package:

Everything we add belongs in the lib\ folder. As we are not a tool intended to be invoked from with Visual Studio, this is correct per the NuGet package spec.

That said, at this time we are not breaking out by .NET version, even for executables and DLLs we place in the lib\ folder. This is acceptable and in line with the spec as well.

Powershell and database scripts belong in a repository-specific folder, and should retain their relative paths to that folder. So, 'Database\Data\EduId' in an Ed-Fi-Apps repository would go in 'lib\Ed-Fi-Apps\Database\Data\EduId'.

As only one .nuspec file can be used to generate a given NuGet package, the least generic repository (traditionally called Ed-Fi-Apps) must contain references to all files, even ones in other, less generic repositories (such as Ed-Fi-Core).

This way, Powershell and database scripts can be referenced using the path resolver in a way that permits normal overrides,
while binaries are invoked directly.
#>
param(
    [parameter(mandatory = $true)] $packageName,
    $enabledSources,
    $outputDirectory
)

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'DatabaseTemplate\Modules\database-template-source.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\config\config-management.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\database\database-lifecycle.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\packaging.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tasks\TaskHelper.psm1')

function Select-ExtensionAssemblyMetadataJson
{
    $extensions = @()
    $enabledSources | ForEach-Object {
        $extensions += (Select-CumulativeRepositoryResolvedItems -recurse "Application/EdFi.Ods.Extensions.$_" | Where-Object { $_.Name -eq "assemblyMetadata.json" })
    }
    return $extensions
}

if (-not $outputDirectory) { $outputDirectory = $PSScriptRoot} # Note: this cannot be done in the param block. $PSScriptRoot is not available at that time.
if (-not $enabledSources) { $enabledSources = (Get-Configuration).artifactSources }

$nuspecPath = "$outputDirectory\$packageName.nuspec"

$nuspecArgs = @{
    forceOverwrite = $true
    nuspecPath     = $nuspecPath
    id             = $packageName
    description    = $packageName
    authors        = "Ed-Fi Alliance"
    owners         = "Ed-Fi Alliance"
}
New-Nuspec @nuspecArgs

# Add all of the in-repository files which have a relative path that should be preserved in the target
$repoNuspecFiles = @(
    Select-CumulativeRepositoryResolvedItems -recurse "logistics/scripts"
    Select-CumulativeRepositoryResolvedItems -recurse "logistics/bin"
    Get-TemplateScripts

    # DbScripts in Artifacts
    Select-CumulativeRepositoryResolvedItems -recurse "Artifacts"

    # Core Ods Scripts
    Select-CumulativeRepositoryResolvedItems -recurse "Application/EdFi.Ods.Standard/Artifacts"

    # Extension scripts
    Select-SupportingArtifactResolvedFiles -recurse -artifactType "Database" -artifactSources $enabledSources
    Select-ExtensionAssemblyMetadataJson

    # Add the EdFi.Db.Deploy tool files
    Select-CumulativeRepositoryResolvedItems "tools\EdFi.Db.Deploy.exe"
    ((Select-CumulativeRepositoryResolvedItems -recurse "tools\.store\edfi.db.deploy.suite3" ) | Where-Object { -not $_.Name.EndsWith(".nupkg") })
)
Add-RepositoryFileToNuspec -nuspecPath $nuspecPath -file $repoNuspecFiles

# Add all of the out of repository files which will specify a custom target path
$nonrepoNuspecFiles = Get-ChildItem $outputDirectory -Exclude *.nuspec, prep-package*.ps1 |
    Where-Object { -not $_.PSIsContainer } |
    ForEach-Object { @{ source = $_.FullName; target = "." } }

Add-FileToNuspec -nuspecPath $nuspecPath -sourceTargetPair $nonrepoNuspecFiles

Write-Host -ForegroundColor Green "Created nuspec at: $nuspecPath"

Test-Error
