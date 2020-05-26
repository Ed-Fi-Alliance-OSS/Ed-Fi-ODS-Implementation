# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.


$ErrorActionPreference = "Stop"

& "$PSScriptRoot\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "DatabaseTemplate\Modules\create-database-template.psm1")

function Get-MinimalConfiguration {
    $config = @{ }

    Merge-Configurations $config (Get-DefaultTemplateConfiguration)

    $config.Remove('apiClientNameSandbox')

    $config.testHarnessJsonConfigLEAs = @()

    $config.Remove('bulkLoadTempDirectorySample')
    $config.bulkLoadBootstrapInterchanges = @("InterchangeDescriptors")

    $config.databaseBackupName = "EdFi.Ods.Minimal.Template"
    $config.packageNuspecName = "EdFi.Ods.Minimal.Template"

    return $config
}

Set-Alias -Scope Global initmin Initialize-MinimalTemplate
function Initialize-MinimalTemplate {
    <#
    .SYNOPSIS
        Creates a new minimal template.

    .DESCRIPTION
        By default this will:
        * Validate all xml files
        * Resets the admin and security database
        * Creates a new database for the minimal template data to be loaded into
        * Restores packages and build the bulk load client
        * Copies sample files to isolate the files
        * Generates two apiclients with key/secret for the necessary claimsets
        * Starts the test harness api
        * Executes first load scenario using the bootstrap data and claimset
        * Executes second load scenario using the rest of the sample data and the sandbox claimset
        * Stops the test harness api
        * Creates a backup of the new minimal template at: Ed-Fi-ODS-Implementation\DatabaseTemplate\Database\Minimal.Template.bak
        * Creates a .nuspec file for the new minimal template at: Ed-Fi-ODS-Implementation\DatabaseTemplate\Database\Minimal.Template.nuspec

    .PARAMETER samplePath
        An absolute path to the folder to load samples from, for example: C:\MySampleXmlData\.
        Also supports specific version folders of the Data Standard repository, for example: C:\Ed-Fi-Standard\v3.0\ or C:\Ed-Fi-Standard\v2.0\

    .PARAMETER noExtensions
        Ignores any extension sources when running the sql scripts against the database.

    .PARAMETER noValidation
        Disables xml validation.

    .parameter engine
    The database engine provider, either 'SQLServer' or 'PostgreSQL'

    .EXAMPLE
        PS> Initialize-MinimalTempalate -samplePath "C:\edfi\Ed-Fi-Standard\v3.2\"
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
        samplePath = $samplePath
        noExtensions = $noExtensions
        noValidation = $noValidation
        engine = $engine
    }

    Merge-Configurations $global:templateConfiguration $paramConfig

    Set-TemplateConfigurationScript { Get-MinimalConfiguration }
    (Get-TemplateConfiguration).GetEnumerator() | Sort-Object -Property Name | Format-Table -HideTableHeaders -AutoSize -Wrap

    $script:tasks = @(
        'Invoke-SampleXmlValidation'
        'New-TempDirectory'
        'Copy-BootstrapInterchangeFiles'

        'Invoke-SetTestHarnessConfig'
        'Add-RandomKeySecret'
        'Invoke-RestoreLoadToolsPackages'
        'Invoke-BuildLoadTools'
        'New-DatabaseTemplate'
        'Assert-DisallowedSchemas'
        'Invoke-StartTestHarness'
        'Invoke-LoadBootstrapData'

        'Stop-TestHarness'
        'Backup-DatabaseTemplate'
        'New-DatabaseTemplateNuspec'
    )

    $script:result = @()
    try {
        $elapsed = Use-StopWatch {
            foreach ($task in $tasks) {
                $script:result += Invoke-Task -name $task -task { & $task }
            }
        }
    }
    catch {
        Stop-TestHarness
        throw $_
    }

    Test-Error

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format

    return $script:result | Format-Table
}

Export-ModuleMember -function * -Alias *
