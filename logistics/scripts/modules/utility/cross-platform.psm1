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
        # $IsWindows does not exist pre PS 6, so this will create it in that case.
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
    foreach($runtime in $data){
        
        $values =  $runtime.Split(" ",3)
        $thisRuntime = [ordered]@{
            "Runtime" = $values[0];
            "Version" = $values[1];
            "Path" = $values[2];
        }
        $thisObject = [PSCustomObject]$thisRuntime
        $runtimeArray += $thisObject
    }
    return $runtimeArray
}
Export-ModuleMember -Function "Get-IsWindows","Get-DotnetRuntimes"