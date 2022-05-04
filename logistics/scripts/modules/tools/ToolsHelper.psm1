# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5
$ErrorActionPreference = 'Stop'

& "$PSScriptRoot\..\..\..\..\logistics\scripts\modules\load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\utility\cross-platform.psm1")

function Get-ToolsPath {
    if (-not [string]::IsNullOrWhiteSpace($env:toolsPath)) { return $env:toolsPath }

    $toolsPath = Join-Path (Get-RepositoryResolvedPath) 'tools'

    return $toolsPath
}

function Get-DotNetTool {
    <#
    .description
    Gets information for the .Net tool installed with the specified name and path
    .parameter Path
    The path to the tools folder
    .parameter Name
    The name of the tool
    #>
    Param(
        [string] $Path,
        [string] $Name
    )
    if (-not (Test-Path $Path)) { return }

    $tool = & dotnet tool list --tool-path $Path | Select-String -Pattern $Name | Out-String
    if ($null -eq $tool) { return }

    $parts = $tool.Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
    if ($parts -ge 2) {
        return @{
            ProcessId = $parts[0]
            Version   = $parts[1]
            Commands  = $parts[2..-1]
        }
    }
}

function Uninstall-DotNetTool {
    <#
    .description
    Uninstalls the .Net tool with the specified name, path, and version
    .parameter Path
    The path to the tools folder
    .parameter Name
    The name of the tool
    .parameter Name
    The version of the tool
    #>
    Param(
        [string] $Path,
        [string] $Name,
        [string] $Version
    )
    Write-Host "Removing $Name version $Version from $Path"

    & dotnet tool uninstall $Name --tool-path $Path
}

function Install-DotNetTool {
    <#
    .description
    Installs the .Net tool with the specified name, path, and version
    .parameter Path
    The path to the tools folder
    .parameter Name
    The name of the tool
    .parameter Name
    The version of the tool
    #>
    Param(
        [string] $Path,
        [string] $Name,
        [string] $Version,
        [string] $Source = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
    )

    $installedVersion = (Get-DotNetTool $Path $Name).Version

    if ($Version -eq $installedVersion) {
        Write-Host "$Name version $Version is already installed at $Path"
        return
    }

    if ($null -ne $installedVersion) {
        # there is a bug where we cannot update a beta package, so a remove and install is the safe solution
        # c.f. https://github.com/dotnet/sdk/issues/2551
        Uninstall-DotNetTool $Path $Name $installedVersion
    }

    Write-Host "Installing $Name version $Version to $Path"
    Write-Host -ForegroundColor Magenta "& dotnet tool install $Name --version $Version --tool-path $Path --add-source $Source"

    & dotnet tool install $Name --version $Version --tool-path $Path --add-source $Source
}

function Install-ToolDbDeploy {
    <#
    .description
    Install DbDeploy tool
    .parameter Path
    The path to the tools folder
    .parameter Name
    The version of the tool
    #>
    Param(

        [string] $toolsPath,
        [string] $toolVersion
    )

    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $params = @{
            Path    = $toolsPath
            Name    = 'EdFi.Suite3.Db.Deploy'
            Version = $toolVersion
        }

        Install-DotNetTool @params
    }
}

function Install-ToolCodeGenUtility {
    <#
    .description
    Install Code Gen tool
    .parameter Path
    The path to the tools folder
    .parameter Name
    The version of the tool
    #>

    Param(

        [string] $toolsPath,
        [string] $toolVersion
    )

    Invoke-Task -name $MyInvocation.MyCommand.Name -task {
        $params = @{
            Path    = $toolsPath
            Name    = 'EdFi.Suite3.Ods.CodeGen'
            Version = $toolVersion
        }

        Install-DotNetTool @params
    }
}

function Test-DotNetCore {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        $requiredMajor = 6,
        [Parameter()]
        [int]
        $requiredMinor = 0,
        [Parameter()]
        [int]
        $requiredBuild = 4
    )

    try {
        $runtimes = Get-DotnetRuntimes
        
        # Method 1.A | This method will false positive if eg. there are 2 versions of AspNetCore but none of NetCore
        # Validate Both at once
        $validMajor = ($runtimes | Where {$_.Runtime -eq "Microsoft.AspNetCore.App" -OR $_.Runtime -eq "Microsoft.NETCore.App"} | Where { $_.Version.Major -ge $requiredMajor} )
        $validMinor = ($validMajor | Where { $_.Version.Minor -ge $requiredMinor})
        
        if ($validMinor.Count -lt 2) {
            throw
        }

        # Method 1.B | This will check both runtimes for the specific major/minor version
        # Validate each runtime
        $validAsp = ($runtimes | Where {$_.Runtime -eq "Microsoft.AspNetCore.App"} | Where { $_.Version.Major -ge $requiredMajor} | Where { $_.Version.Minor -ge $requiredMinor})
        $validCore = ($runtimes | Where {$_.Runtime -eq "Microsoft.NETCore.App"} | Where { $_.Version.Major -ge $requiredMajor} | Where { $_.Version.Minor -ge $requiredMinor})

        if ($validCore.Count -lt 1) {
            Write-Verbose "No valid runtime versions were found for: Microsoft.NETCore.App"
            throw
        }
        if ($validAsp.Count -lt 1) {
            Write-Verbose "No valid runtime versions were found for: Microsoft.AspNetCore.App"
            throw
        }
        

        <#
        # Method 2 | Same process as before for Windows. Tests every runtime for version, doesnt check name.
        if (Get-IsWindows) {
            ($dotnet = Get-Command dotnet -ErrorAction Stop) | Out-Null
            if ($dotnet.Version.Major -lt $requiredMajor) {
                throw
            }else {
                Write-Verbose "$($dotnet.Name) major version $($dotnet.Version.Major) is greater than or equal to the required: $requiredMajor."
            }
    
            if ($dotnet.Version.Major -eq $requiredMajor -and $dotnet.Version.Minor -lt $requiredMinor) {
                throw
            }else {
                Write-Verbose "$($dotnet.Name) minor version $($dotnet.Version.Minor) is greater than or equal to the required: $requiredMinor."
            }
        }else{
            $runtimes = Get-DotnetRuntimes
            foreach($dotnet in $runtimes){
                Write-Verbose "$($dotnet.Runtime) is installed at version $($dotnet.Version)."

                if ($dotnet.Version.Major -lt $requiredMajor) {
                    throw
                }else {
                    Write-Verbose "$($dotnet.Runtime) major version $($dotnet.Version.Major) is greater than or equal to the required: $requiredMajor."
                }
        
                if ($dotnet.Version.Major -eq $requiredMajor -and $dotnet.Version.Minor -lt $requiredMinor) {
                    throw
                }else {
                    Write-Verbose "$($dotnet.Runtime) minor version $($dotnet.Version.Minor) is greater than or equal to the required: $requiredMinor."
                }
            }

        }
        #>
        

        
    }
    catch {
        throw "Running scripts require .NET Core SDK $($requiredMajor).$($requiredMinor)+, available from https://dotnet.microsoft.com/download."
    }
}

function Invoke-DbDeploy {
    <#
    .DESCRIPTION
    Runs the dotnet tool "EdFi.Db.Deploy" for deployment of Ed-Fi databases.

    .PARAMETER Verb
    The command to run, currently either "Deploy" or "WhatIf".

    .PARAMETER Engine
    The database engine provider, either "SQLServer" or "PostgreSQL"

    .PARAMETER Database
    The database type to be deployed.

    .PARAMETER ConnectionString
    The full connection string to the database server.

    .PARAMETER FilePaths
    Array of paths to sql scripts and extension directories.

    .PARAMETER Features
    An optional array of features (aka "sub types") to deploy.

	.PARAMETER ToolsPath
    Path where the dotnet tools are installed. Optional. Defaults to tools" under Ed-Fi-ODS-Implementation.

    .EXAMPLE
    Deploy the ODS database with GrandBend and Sample extensions and with
    Change Queries enabled, to the "EdFi_Ods" database on a local SQL Server instance:

    $params = @{
        Verb = "Deploy"
        Engine = "SQLServer"
        Database = "ODS"
        ConnectionString = "server=localhost;database=EdFi_Ods;integrated security=sspi"
        FilePaths = @(
            "Ed-Fi-Ods\", "Ed-Fi-ODS\Application\EdFi.Ods.Standard",
            "C:\Source\3.x\Ed-Fi-Ods-Implementation\Application\EdFi.Ods.Extensions.GrandBend\SupportingArtifacts\Database",
            "C:\Source\3.x\Ed-Fi-Ods-Implementation\Application\EdFi.Ods.Extensions.Sample\SupportingArtifacts\Database"
        )
        Features = @("Changes")
    }
    Invoke-DbDeploy @params
    #>
    param(
        [ValidateSet('Deploy', 'WhatIf')]
        [String] $Verb = 'Deploy',

        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine = 'SQLServer',

        # EdFi, EdFi_Admin, and EdFiSecurity are the "database id" values in the
        # initdev process. The real values of ODS, Admin, and Security are
        # provided as a convenience for those who directly invoke this command.
        [ValidateSet('EdFi', 'EdFi_Admin', 'EdFiSecurity', 'Ods', 'Admin', 'Security')]
        [String] $Database = 'EdFi',

        [Parameter(Mandatory = $true)] [String] $ConnectionString,

        [String[]]
        [ValidateNotNullOrEmpty()]
        $FilePaths = @(),

        [String[]]
        [AllowNull()]
        [AllowEmptyCollection()]
        $Features = @(),

        [string] $ToolsPath = (Get-ToolsPath),

        [Int] $DatabaseTimeoutInSeconds = 600
    )

    $databaseIdLookup = @{
        "Admin"        = "Admin"
        "EdFi_Admin"   = "Admin"
        "ODS"          = "ODS"
        "EdFi"         = "ODS"
        "Security"     = "Security"
        "EdFiSecurity" = "Security"
    }
    $databaseType = $databaseIdLookup[$Database]

    $tool = (Join-Path $ToolsPath 'EdFi.Db.Deploy')

    $params = @(
        $Verb,
        "--engine", $Engine,
        "--database", $databaseType,
        "--connectionString", $ConnectionString,
        "--timeOut", $DatabaseTimeoutInSeconds,
        "--filePaths", ($FilePaths -join ',')
    )

    if ($Features.count -gt 0) { $params += @('--features', ($Features -join ',')) }

    Write-Host -ForegroundColor Magenta "& $tool $params"
    & $tool $params | Write-Host

    # EdFi.Db.Deploy returns 0 when "deploy" is successful; 0 or 1 when "whatif" is successful (1 meaning that an
    # upgrade is required, 0 that no upgrade is required); and any other exit code denotes a failure condition.
    switch ($Verb) {
        "Deploy" {
            if ($LASTEXITCODE -eq 0) { return $LASTEXITCODE }
        }
        "WhatIf" {
            if ($LASTEXITCODE -eq 0 -or $LASTEXITCODE -eq 1) { return $LASTEXITCODE }
        }
    }

    Throw "$tool exited with code $LASTEXITCODE"
}

Export-ModuleMember -Function * -Alias *
Test-DotNetCore
