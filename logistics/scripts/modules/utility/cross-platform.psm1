function Get-IsWindows {
    <#
    .SYNOPSIS
        Checks to see if the current machine is a Windows machine.
    
    .EXAMPLE
        Get-IsWindows

        returns $True
    #>

    if (!$IsWindows) {
        $IsUnix = $false
        $IsWindows = $true
    }

    return $IsWindows
}

Export-ModuleMember -Function "Get-IsWindows"