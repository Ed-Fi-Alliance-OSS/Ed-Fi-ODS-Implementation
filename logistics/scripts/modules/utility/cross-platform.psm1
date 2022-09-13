function IsCommandAvailable {
    param (
        [String]
        [Parameter(Mandatory=$true)]
        $Command,

        [string[]]
        $Arguments
    )

    try {
        & $Command @Arguments | Out-Null
        return $true
    }
    catch {
        return $false 
    }
}

function EnsureCommandIsAvailable {
    param (
        [String]
        [Parameter(Mandatory=$true)]
        $Command,

        [string[]]
        $Arguments
    )

    if (!(IsCommandAvailable $Command $Arguments)) {
        throw "The next command is required by the script but it is not installed: $Command"
    }
}

function Get-IsWindows {
    <#
    .SYNOPSIS
        Checks to see if the current machine is a Windows machine.
    
    .EXAMPLE
        Get-IsWindows

        returns $True
    #>

    if ($null -eq $IsWindows) {
        # This section will only trigger when the automatic $IsWindows variable is not detected.
        # Every version of PS released on Linux contains this variable so it will always exist.
        # $IsWindows does not exist pre PS 6.
        return $true
    }

    return $IsWindows
}


function Get-DotnetRuntimes {

    try {
        $data = dotnet --list-runtimes
    }
    catch {
        throw "Running scripts require .NET Core SDK, available from https://dotnet.microsoft.com/download."
    }
    
    $runtimeArray = @()
    foreach($entry in $data){
        
        $values =  $entry.Split(" ",3)
        $runtime = $values[0]
        $version = [Version]$values[1]
        $path = $values[2] -replace '[][]',''
        $thisRuntime = [ordered]@{
            "Runtime" = $runtime;
            "Version" = $version;
            "Path" = $path;
        }
        $thisObject = [PSCustomObject]$thisRuntime
        $runtimeArray += $thisObject
    }
    return $runtimeArray
}

Export-ModuleMember -Function `
    Get-IsWindows,
    Get-DotnetRuntimes,
    IsCommandAvailable,
    EnsureCommandIsAvailable
