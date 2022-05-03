function Get-IsWindows {
    <#
    .SYNOPSIS
        Checks to see if the current machine is a Windows machine.
    
    .EXAMPLE
        Get-IsWindows

        returns $True
    #>

    if ($null -eq $IsWindows) {
        $IsWindows = $true
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
Export-ModuleMember -Function "Get-IsWindows","Get-DotnetRuntimes"