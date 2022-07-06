#  TO DO
# use new-item instead of mkdir
BeforeAll { 
    Import-Module "$PSScriptRoot/utility/cross-platform.psm1"
    Import-Module -Force -Scope Global ($PSCommandPath.Replace('.tests.ps1', '.psm1'))
    if(Get-IsWindows){
        mkdir "$($pwd.Path)/Application" -Force
        mkdir "$($pwd.Path)/Application/EdFi.Ods.Extensions.Tests" -Force
    }else{
        mkdir "$($pwd.Path)/Application" -p
        mkdir "$($pwd.Path)/Application/EdFi.Ods.Extensions.Tests" -p
    }
    
}
Describe 'Select-RepositoryResolvedFiles' {
    It 'Returns a valid and reachable path' {
        $RepositoryFiles = Select-RepositoryResolvedFiles "logistics"
        Test-Path $RepositoryFiles.FullName | Should -Be $true
    }
}
Describe 'Select-CumulativeRepositoryResolvedItems' {
    It 'Returns a valid and reachable path' {
        $RepositoryFiles = Select-CumulativeRepositoryResolvedItems "logistics"
        Test-Path $RepositoryFiles.FullName | Should -Be $true
    }
}
Describe 'Select-SupportingArtifactResolvedSources' {
    It 'Returns a valid Extension directory' {
        $SupportingArtifactResolvedSources = Select-SupportingArtifactResolvedSources
        $SupportingArtifactResolvedSources.Name | Should -Be "EdFi.Ods.Extensions.Tests"
    }
}

Describe 'Get-RootPath' {
    It 'Returns a valid and reachable Root path' {
        $getRootPath = Get-RootPath
        Test-Path $getRootPath.Path | Should -Be $true
    }
}
Describe 'Get-CorePath' {
    It 'Returns an ODS Core path' {
        $getCorePath = Get-CorePath
        Test-Path $getCorePath.Path | Should -Be $true
        $getCorePath.Path | Should -BeLike "*Ed-Fi-ODS/" 
    }
}
Describe 'Get-RepositoryResolvedPath' {
    It 'Return paths to specified files, checking all repositories' {
        Get-RepositoryResolvedPath
    }
}
Describe 'Get-RepositoryRoot' {
    It 'Returns valid and reachable repository roots' {
        $getRepositoryRoot = Get-RepositoryRoot
        Test-Path $getRepositoryRoot[0] | Should -Be $true
        Test-Path $getRepositoryRoot[1] | Should -Be $true
    }
}
Describe 'Get-RepositoryNames' {
    It 'Returns the repositoryNames variable' {
        Get-RepositoryNames | Should -Not -BeNullOrEmpty
    }
}
Describe 'Get-RepositoryNameFromPath' {
    It 'Returns valid and reachable repository root from a path within' {
        $getRepositoryNamePath = Get-RepositoryNameFromPath .
        $getRepositoryNamePath | Should -Be "Ed-Fi-ODS-Implementation"
    }
}

Describe 'Format-ArrayByRepositories' {
    It 'Returns an array of paths' {
        $repoArray = Format-ArrayByRepositories $pwd.Path, "$($pwd.Path)/tasks"
        # When you use a pipe, PowerShell "unrolls" the collection and 
        #   pipes in one element at a time, breaking our array check
        # Use PowerShell's unary comma operator to wrap the collection in a one-element array
        ,$repoArray | Should -BeOfType [System.Array]
    }
}


AfterAll {
    rm "$($pwd.Path)/Application" -R
}