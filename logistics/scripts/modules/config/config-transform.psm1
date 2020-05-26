# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\tools\ToolsHelper.psm1')

function Install-ToolConfigTransformerCore {
    Param(
        [string] $path = (Get-ToolsPath),

        [string] $version = '1.0.0'
    )

    $params = @{
        Path = $path
        Name = 'ConfigTransformerCore'
        Version = $version
    }

    Install-DotNetTool @params | Out-Null

    return (Join-Path $params.Path $params.Name)
}

function Invoke-TransformConfigFile {
    Param(
        [Parameter(Mandatory = $true)]
        [string] $sourceFile,

        [Parameter(Mandatory = $true)]
        [string[]] $transformFiles,

        [Parameter(Mandatory = $true)]
        [string] $destinationFile
    )

    $executablePath = Install-ToolConfigTransformerCore

    foreach ($transformFile in $transformFiles) {
        & $executablePath -s $sourceFile -t $transformFile -d $destinationFile | Out-Host
        $sourceFile = $destinationFile
    }
}

Export-ModuleMember Install-ToolConfigTransformerCore, Invoke-TransformConfigFile
