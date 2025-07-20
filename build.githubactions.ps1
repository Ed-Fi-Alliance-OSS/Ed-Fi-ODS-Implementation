# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

[CmdLetBinding()]
param(
    # Command to execute, defaults to "Build".
    [string]
    [ValidateSet("DotnetClean", "Restore", "Build", "Test", "Pack", "Publish", "CheckoutBranch","StandardVersions", "InstallCredentialHandler","WorkflowCheck","ComparePackageVersions","CreateOrUpdateRepositoriesJson","TestBranchExists")]
    $Command = "Build",

    [switch] $SelfContained,

    # Informational version number, defaults 1.0
    [string]
    $InformationalVersion = "1.0",

    # Build counter from the automation tool.
    [string]
    $BuildCounter = "1",

    [string]
    $BuildIncrementer = "0",

    # .NET project build configuration, defaults to "Release". Options are: Debug, Release.
    [string]
    [ValidateSet("Debug", "Release")]
    $Configuration = "Release",

    [bool]
    $DryRun = $false,

    [string]
    $NugetApiKey,

    [string]
    $EdFiNuGetFeed,

    # .Net Project Solution Name
    [string]
    $Solution,

    # .Net Project Name
    [string]
    $ProjectFile,

    [string]
    $PackageName,

    [string]
    $TestFilter,

    [string]
    $NuspecFilePath,

    [string]
    $RelativeRepoPath,

    [ValidateSet('4.0.0', '5.2.0', '6.0.0')]
    [string]  $StandardVersion,

    [string]$Url,

    [string]$ExpectedStatus = 'completed',

    [string[]]$ExpectedConclusions = 'success',

    [string]$StatusEnvName,

    [string]$RepoName,

    [string]$BranchName
)

$newRevision = ([int]$BuildCounter) + ([int]$BuildIncrementer)
$version = "$InformationalVersion.$newRevision"
$packageOutput = "$PSScriptRoot/NugetPackages"
$packagePath = "$packageOutput/$PackageName.$version.nupkg"

if ([string]::IsNullOrWhiteSpace($Solution)){
    $Solution =$ProjectFile
}

function Invoke-Execute {
    param (
        [ScriptBlock]
        $Command
    )

    $global:lastexitcode = 0
    & $Command

    if ($lastexitcode -ne 0) {
        throw "Error executing command: $Command"
    }
}

function Invoke-Step {
    param (
        [ScriptBlock]
        $block
    )

    $command = $block.ToString().Trim()

    Write-Host
    Write-Host $command -fore CYAN

    &$block
}

function Invoke-Main {
    param (
        [ScriptBlock]
        $MainBlock
    )

    try {
        &$MainBlock
        Write-Host
        Write-Host "Build Succeeded" -fore GREEN
        exit 0
    } catch [Exception] {
        Write-Host
        Write-Error $_.Exception.Message
        Write-Host
        Write-Error "Build Failed"
        exit 1
    }
}

function DotnetClean {
    Invoke-Execute { dotnet clean $Solution -c $Configuration --nologo -v minimal }
}

function Restore {
    Invoke-Execute { dotnet restore  $Solution --verbosity:normal }
}

function Compile {
    Invoke-Execute {
        dotnet --info
        dotnet build $Solution -c $Configuration --version-suffix $version --no-restore -p:StandardVersion=$StandardVersion
    }
}

function Pack {
    if ([string]::IsNullOrWhiteSpace($PackageName) -and [string]::IsNullOrWhiteSpace($NuspecFilePath)){
        Invoke-Execute {
            dotnet pack $ProjectFile -c $Configuration --output $packageOutput --no-build --no-restore --verbosity normal -p:VersionPrefix=$version -p:NoWarn=NU5123
        }
    }
    if ($NuspecFilePath -Like "*.nuspec" -and $null -ne $PackageName ){
        $params = @{
            PackageDefinitionFile = $NuspecFilePath
            Version               = $version
            Properties            = @{
                configuration = $Configuration
                id = $PackageName
            }
            OutputDirectory       = $packageOutput
        }

        & "$PSScriptRoot/Initialize-PowershellForDevelopment.ps1"

        New-Package @params | Out-Host
    }
    if ([string]::IsNullOrWhiteSpace($NuspecFilePath) -and $null -ne $PackageName){
        Invoke-Execute {
            dotnet pack $ProjectFile -c $Configuration --output $packageOutput --no-build --no-restore --verbosity normal -p:VersionPrefix=$version -p:NoWarn=NU5123 -p:PackageId=$PackageName
        }
    }
}

function Publish {
    Invoke-Execute {

        if (-not $NuGetApiKey) {
            throw "Cannot push a NuGet package without providing an API key in the `NuGetApiKey` argument."
        }

        if (-not $EdFiNuGetFeed) {
            throw "Cannot push a NuGet package without providing a feed in the `EdFiNuGetFeed` argument."
        }

        if($DryRun){
            Write-Host "Dry run enabled, not pushing package."
        } else {
            Write-Host "Pushing $packagePath to $EdFiNuGetFeed"

            dotnet nuget push $packagePath --api-key $NuGetApiKey --source $EdFiNuGetFeed
        }
    }
}

function Test {
    if(-not $TestFilter) {
        Invoke-Execute { dotnet test $solution  -c $Configuration --no-build --no-restore -v normal }
    } else {
        Invoke-Execute { dotnet test $solution  -c $Configuration --no-build --no-restore -v normal --filter TestCategory!~"$TestFilter" }
    }
}

function CheckoutBranch {
    Set-Location $RelativeRepoPath
    $odsBranch = $Env:REPOSITORY_DISPATCH_BRANCH
    Write-Output "OdsBranch: $odsBranch"
    if(![string]::IsNullOrEmpty($odsBranch)){
        $patternName = "refs/heads/$odsBranch"
        $does_corresponding_branch_exist = $false
        $does_corresponding_branch_exist = git ls-remote --heads origin $odsBranch | Select-String -Pattern $patternName -SimpleMatch -Quiet
        if ($does_corresponding_branch_exist -eq $true) {
            Write-Output "Corresponding branch for $odsBranch exists in Implementation repo, so checking it out"
            git fetch origin $odsBranch
            git checkout $odsBranch
        } else {
            Write-Output "Corresponding branch for $odsBranch does not exist in Implementation repo, so not changing branch checked out"
        }
    } else {
        Write-Output "ref_name: $Env:REF_NAME"
        $current_branch = "$Env:REF_NAME"
        if ($current_branch -like "*/merge"){
            Write-Output "ref_name is PR, so using head_ref: $Env:HEAD_REF"
            $current_branch = "$Env:HEAD_REF"
        }
        $patternName = "refs/heads/$current_branch"
        Write-Output "Pattern Name is $patternName" -fore GREEN
        $branch_exists = $false
        $branch_exists = git ls-remote --heads origin $current_branch | Select-String -Pattern $patternName -SimpleMatch -Quiet
        if ($branch_exists -eq $true) {
            Write-Output "Current branch exists, so setting to $current_branch"
            git fetch origin $current_branch
            git checkout $current_branch
        } else {
            Write-Output "did not match on any results for changing ODS checkout branch"
        }
    }
}

function Get-IsWindows {
    <#
    .SYNOPSIS
        Checks to see if the current machine is a Windows machine.
    .EXAMPLE
        Get-IsWindows returns $True
    #>
    if ($null -eq $IsWindows) {
        # This section will only trigger when the automatic $IsWindows variable is not detected.
        # Every version of PS released on Linux contains this variable so it will always exist.
        # $IsWindows does not exist pre PS 6.
        return $true
    }
    return $IsWindows
}
function InstallCredentialHandler {

    # Does the same as: iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
    # but this brings support for installing the provider on Linux.
    # Additionally, it's less likely to hit GitHub rate limits because this downloads it directly, instead of making a
    # request to https://api.github.com/repos/Microsoft/artifacts-credprovider/releases/latest to infer the latest version.

    $downloadPath = Join-Path ([IO.Path]::GetTempPath()) 'cred-provider.zip'
    
    $credProviderUrl = 'https://github.com/microsoft/artifacts-credprovider/releases/download/v1.4.1/Microsoft.Net6.NuGet.CredentialProvider.zip'
    Write-Host "Downloading artifacts-credprovider from $credProviderUrl ..."
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($credProviderUrl, $downloadPath)
    Write-Host "Download complete." 

    if (-not (Test-Path $downloadPath)) {
        throw "'$downloadPath' not found."
    }

    # The provider should be installed in the path: ~/.nuget/plugins/netcore/CredentialProvider.Microsoft/<binaries>
    Write-Host "Extracting $downloadPath ..."
    Expand-Archive -Force -Path $downloadPath -DestinationPath '~/.nuget/'
    Write-Host "The artifacts-credprovider was successfully installed" -ForegroundColor Green
}


function StandardVersions {

    $standardProjectDirectory = Split-Path $Solution  -Resolve
    $standardProjectPath = Join-Path $standardProjectDirectory "/Standard/"
    $versions = (Get-ChildItem -Path $standardProjectPath -Directory -Force -ErrorAction SilentlyContinue | Select -ExpandProperty Name | %{ "'" + $_ + "'" }) -Join ','
    $standardVersions = "[$versions]"
    return $standardVersions
}

function WorkflowCheck {
    $headers = @{
        Authorization = "Bearer $env:EDFI_ODS_TOKEN"
        Accept = "application/vnd.github.v3+json"
    }
    
    $response = Invoke-RestMethod -Uri $Url -Headers $headers
    
    if ( $response.workflow_runs.Count -gt 0) {
        Write-Host "Found workflow runs for URL: $Url."
    
        $runTracker = @{}  # Create an empty hash table to track printed run_numbers
    
        $response.workflow_runs | Where-Object { $_.status -eq $ExpectedStatus -and $ExpectedConclusions -contains $_.conclusion } | 
         Sort-Object -Property run_number -Descending | Select-Object -First 1| ForEach-Object {
            if (-not $runTracker.ContainsKey($_.run_number)) {
                Write-Host "Run ID: $($_.id)"
                Write-Host "Run Name: $($_.name)"
                Write-Host "Run Number: $($_.run_number)"
                Write-Host "Event: $($_.event)"
                Write-Host "Status: $($_.status)"
                Write-Host "Conclusion: $($_.conclusion)"
                Write-Host "Created At: $($_.created_at)"
                Write-Host "Updated At: $($_.updated_at)"
                Write-Host "URL: $($_.html_url)"
    
                # Mark this run_number as printed
                $runTracker[$_.run_number] = $true
                echo "$StatusEnvName=true" >> $Env:GITHUB_ENV
                echo "rebuild_database_templates_lastrunId=$($_.id)" >> $Env:GITHUB_ENV
            }
        }
    } else {
        Write-Host "No matching workflow runs found for URL: $Url."
        echo "$StatusEnvName=false" >> $Env:GITHUB_ENV
    }
}

function ComparePackageVersions {
    # API URLs for branch and main
    $url_branch = "https://api.github.com/repos/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Implementation/contents/configuration.packages.json?ref=$Env:current_branch"
    $url_main = "https://api.github.com/repos/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Implementation/contents/configuration.packages.json?ref=main"

    $headers = @{
        Authorization = "Bearer $env:EDFI_ODS_TOKEN"
        Accept = "application/vnd.github.v3+json"
    }

    # Get the file content for the branch
    $response_branch = Invoke-RestMethod -Uri $url_branch -Headers $headers
    $content_branch = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($response_branch.content))
    $json_branch = $content_branch | ConvertFrom-Json

    # Get the file content for the main branch
    $response_main = Invoke-RestMethod -Uri $url_main -Headers $headers
    $content_main = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($response_main.content))
    $json_main = $content_main | ConvertFrom-Json
    # Extract the PackageVersion for the package name
    $branch_version = $json_branch.packages.$PackageName.PackageVersion
    $main_version = $json_main.packages.$PackageName.PackageVersion

    # Convert versions to a comparable format 
    $branch_version = [Version]$branch_version
    $main_version = [Version]$main_version

    # Compare the versions and print
    if ($branch_version -gt $main_version) {
        Write-Host "Package versions are different:"
        Write-Host "Branch ($branch): $branch_version"
        Write-Host "Main: $main_version"
        echo "$StatusEnvName=true" >> $Env:GITHUB_ENV
    } else {
        Write-Host "Package versions are the same:"
        Write-Host "Branch ($branch): $branch_version"
        Write-Host "Main: $main_version"
        echo "$StatusEnvName=false" >> $Env:GITHUB_ENV
    }
}

function CreateOrUpdateRepositoriesJson {

    $FilePath = "$PSScriptRoot/repositories.json"

    $headers = @{
        Authorization = "Bearer $env:EDFI_ODS_TOKEN"
        Accept = "application/vnd.github.v3+json"
    }

    # Fetch the last commit details
    $response = Invoke-RestMethod -Uri $url -Headers $headers

    #Define the messages to ignore
    $ignoreMessages = @(
        "Updating for new CodeGen version",
        "Updating for new Extensions- TPDM, Sample, Homograph,Profiles.Sample package version",
        "Updating for new EdFi.Ods.Minimal.Template , EdFi.Ods.Minimal.Template.PostgreSQL ,EdFi.Ods.Populated.Template ,EdFi.Ods.Populated.Template.PostgreSQL package version"
    )

    if ($null -eq $response -or $response.Length -eq 0) {
        Write-Host "API response is null or empty. Stopping the build."
        exit 1
    }

    # # Filter out the commits with the ignored messages
    $filteredCommits = $response | Where-Object { $ignoreMessages -notcontains $_.commit.message }

    if ($null -eq $filteredCommits) {
        Write-Host "Stopping the build. filteredCommits returns null"
        exit 1
    }

    if ($filteredCommits -and $filteredCommits.Count -gt 0) {
        $latestCommit = $filteredCommits[0]
        $commitMessage = $latestCommit.commit.message
        $commitId = $latestCommit.sha
    } else {
        Write-Host "No valid commits found after filtering. Stopping the build."
        exit 1
    }

    $jsonContent = $null

    # Check if the file exists
    if (Test-Path $FilePath) {

        Write-Host "File Exists $FilePath ."
        # Read the existing content
        $jsonContent = Get-Content -Path $FilePath -Raw | ConvertFrom-Json

        if ($null -eq $jsonContent.repositories) {
            $jsonContent.repositories = @()
        }

        # Find the repository entry or create a new one
        $repoEntry = $jsonContent.repositories | Where-Object { $_.repo_name -eq $RepoName }
        
        Write-Host "Printing before checking where new  Commit ID exists or not "
        Get-Content $filePath | Write-Host

        if ($repoEntry) {
            # Check if the existing commit ID is different from the latest commit ID
            if ($repoEntry.commit_id -ne $commitId) {
                # Update the entry if the commit ID is different
                Write-Host "Printing before updating new Commit ID"
                Get-Content $filePath | Write-Host
                Write-Host "New commit ID   is different with old Commit Id "
                $repoEntry.repo_name = $RepoName                
                $repoEntry.commit_message = $commitMessage
                $repoEntry.commit_id = $commitId
                $repoEntry.IscommitChanged = 'true'
                Write-Host "Updated repository entry for $RepoName with new commit ID."
                Write-Host "IscommitChanged is true."
            } else {
                Write-Host "The commit ID for $RepoName is already up to date."
                Write-Host "IscommitChanged is false."  
                $repoEntry.IscommitChanged = 'false'                      
            }
        } else {
            # Add new entry if the repository entry does not exist
            $newRepoEntry = @{
                repo_name      = $RepoName
                commit_message = $commitMessage
                commit_id      = $commitId
                IscommitChanged = 'true'
            }
            $jsonContent.repositories += $newRepoEntry
            Write-Host "Added new repository entry for $RepoName."
            Write-Host "IscommitChanged is true."         
        }
    } else {
        # Create a new file with the initial content
        Write-Host "File not Exists $FilePath .new file is created"        
        $jsonContent = @{
            repositories = @(
                @{
                    repo_name      = $RepoName
                    commit_message = $CommitMessage
                    commit_id      = $CommitId
                    IscommitChanged = 'true'
                }
            )
        }
        Write-Host "IscommitChanged is true." 
    }

    # Write updated content back to the file
    $jsonContent | ConvertTo-Json -Depth 4 | Out-File -FilePath $FilePath -Encoding UTF8

    # Print the repositories.json content for verification
     Write-Host "Print the repositories.json content for verification"
     Get-Content $filePath | Write-Host
}

function TestBranchExists {

    $headers = @{
        Authorization = "Bearer $env:EDFI_ODS_TOKEN"
        Accept        = "application/vnd.github.v3+json"
    }

    try {
        $response = Invoke-RestMethod -Uri $url -Headers $headers
        if ($response.name -eq $BranchName) {
            Write-Host "Branch '$BranchName' exists in repository '$RepoName'."
            return
        } else {
            Write-Host "Branch '$BranchName' does not exist in repository '$RepoName'."
            Write-Host "Stopping the build."
            exit 1
        }
    } catch {
        Write-Host "Branch '$BranchName' does not exist in repository '$RepoName'."
        Write-Host "Stopping the build."
        exit 1
    }
}

function Invoke-StandardVersions {
    Invoke-Step { StandardVersions }
}

function Invoke-Build {
    Write-Host "Building Version $version" -ForegroundColor Cyan
    Invoke-Step { DotnetClean }
    Invoke-Step { Compile }
}

function Invoke-DotnetClean {
    Invoke-Step { DotnetClean }
}

function Invoke-Restore {
    Invoke-Step { Restore }
}

function Invoke-Publish {
    Invoke-Step { Publish }
}

function Invoke-Tests {
    Invoke-Step { Test }
}

function Invoke-Pack {
    Invoke-Step { Pack }
}

function Invoke-CheckoutBranch {
    Invoke-Step { CheckoutBranch }
}

function Invoke-InstallCredentialHandler {
    Invoke-Step { InstallCredentialHandler }
}

function Invoke-WorkflowCheck {
    Invoke-Step { WorkflowCheck }
}

function Invoke-ComparePackageVersions {
    Invoke-Step { ComparePackageVersions }
}

function Invoke-CreateOrUpdateRepositoriesJson {
    Invoke-Step { CreateOrUpdateRepositoriesJson }
}

function Invoke-TestBranchExists {
    Invoke-Step { TestBranchExists }
}

Invoke-Main {
    switch ($Command) {
        DotnetClean { Invoke-DotnetClean }
        Restore { Invoke-Restore }
        Build { Invoke-Build }
        Test { Invoke-Tests }
        Pack { Invoke-Pack }
        Publish { Invoke-Publish }
        CheckoutBranch { Invoke-CheckoutBranch }
        InstallCredentialHandler { Invoke-InstallCredentialHandler }
        StandardVersions { Invoke-StandardVersions }
        WorkflowCheck { Invoke-WorkflowCheck }
        ComparePackageVersions { Invoke-ComparePackageVersions }
        CreateOrUpdateRepositoriesJson { Invoke-CreateOrUpdateRepositoriesJson } 
        TestBranchExists { Invoke-TestBranchExists }               
        
        default { throw "Command '$Command' is not recognized" }
    }
}