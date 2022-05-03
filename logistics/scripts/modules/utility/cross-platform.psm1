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