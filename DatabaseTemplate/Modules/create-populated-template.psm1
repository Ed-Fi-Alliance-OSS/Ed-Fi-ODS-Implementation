# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.


$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "DatabaseTemplate\Modules\create-database-template.psm1")

Set-Alias -Scope Global initpop Initialize-PopulatedTemplate
function Initialize-PopulatedTemplate {
    <#
    .SYNOPSIS
        Creates a new Populated Template.

    .DESCRIPTION
        By default this will:
        * Validate all xml files
        * Resets the admin and security database
        * Creates a new database for the populated template data to be loaded into
        * Restores packages and build the bulk load client
        * Copies sample files to isolate the files into two sections one for each of the two load scenarios
        * Generates two apiclients with key/secret for the two necessary claimsets
        * Starts the test harness api
        * Executes first load scenario using the bootstrap data and claimset
        * Executes second load scenario using the rest of the sample data and the sandbox claimset
        * Stops the test harness api
        * Creates a backup of the new populated template at: Ed-Fi-ODS-Implementation\DatabaseTemplate\Database\Populated.Template.bak
        * Creates a .nuspec file for the new populated template at: Ed-Fi-ODS-Implementation\DatabaseTemplate\Database\Populated.Template.nuspec

    .PARAMETER samplePath
        An absolute path to the folder to load samples from, for example: C:\MySampleXmlData\.
        Also supports specific version folders of the Data Standard repository, for example: C:\Ed-Fi-Standard\v3.0\ or C:\Ed-Fi-Standard\v2.0\

    .PARAMETER noExtensions
        Ignores any extension sources when running the sql scripts against the database.

    .PARAMETER noValidation
        Disables xml validation.

    .parameter Engine
    The database engine provider, either 'SQLServer' or 'PostgreSQL'

    .EXAMPLE
        PS> Initialize-PopulatedTempalate -samplePath "C:\edfi\Ed-Fi-Standard\v3.2\"
    #>
    param(
        [Parameter(
            Mandatory = $true,
            HelpMessage = "An absolute path to the folder to load samples from, for example: C:\MySampleXmlData\.`r`nAlso supports specific version folders of the Data Standard repository, for example: C:\Ed-Fi-Standard\v3.0\ or C:\Ed-Fi-Standard\v2.0\"
        )]
        [ValidateNotNullOrEmpty()]
        [ValidateScript( { Resolve-Path $_ } )]
        [string] $samplePath,
        [switch] $noExtensions,
        [switch] $noValidation,
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $engine = 'SQLServer'
    )

    Clear-Error

    $paramConfig = @{
        samplePath   = $samplePath
        noExtensions = $noExtensions
        noValidation = $noValidation
        engine       = $engine
    }

    $config = (Get-DefaultTemplateConfiguration $paramConfig)
    Write-FlatHashtable $config

    $script:result = @()

    $elapsed = Use-StopWatch {
        try {
            $script:result += Invoke-Task 'Invoke-SampleXmlValidation' { Invoke-SampleXmlValidation $config }
            $script:result += Invoke-Task 'New-TempDirectory' { New-TempDirectory $config }
            $script:result += Invoke-Task 'Copy-BootstrapInterchangeFiles' { Copy-BootstrapInterchangeFiles $config }
            $script:result += Invoke-Task 'Copy-SampleInterchangeFiles' { Copy-SampleInterchangeFiles $config }
            $script:result += Invoke-Task 'Invoke-SetTestHarnessConfig' { Invoke-SetTestHarnessConfig $config }
            $script:result += Invoke-Task 'Add-RandomKeySecret' { Add-RandomKeySecret $config }
            $script:result += Invoke-Task 'Invoke-BuildLoadTools' { Invoke-BuildLoadTools $config }
            $script:result += Invoke-Task 'New-DatabaseTemplate' { New-DatabaseTemplate $config }
            $script:result += Invoke-Task 'Assert-DisallowedSchemas' { Assert-DisallowedSchemas $config }
            $script:result += Invoke-Task 'Invoke-StartTestHarness' { Invoke-StartTestHarness $config }
            $script:result += Invoke-Task 'Invoke-LoadBootstrapData' { Invoke-LoadBootstrapData $config }
            $script:result += Invoke-Task 'Invoke-LoadSampleData' { Invoke-LoadSampleData $config }
            $script:result += Invoke-Task 'Stop-TestHarness' { Stop-TestHarness $config }
            $script:result += Invoke-Task 'Backup-DatabaseTemplate' { Backup-DatabaseTemplate $config }
            $script:result += Invoke-Task 'New-DatabaseTemplateNuspec' { New-DatabaseTemplateNuspec $config }
        }
        catch {
            Stop-TestHarness
            throw $_
        }
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format

    return $script:result | Format-Table
}

Export-ModuleMember -function * -Alias *
