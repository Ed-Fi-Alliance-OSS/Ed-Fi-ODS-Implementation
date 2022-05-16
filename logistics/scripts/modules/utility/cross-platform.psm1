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

Export-ModuleMember -Function "Get-IsWindows"