function Get-IsWindows {
    <#
    .SYNOPSIS
        Checks to see if the current machine is a Windows machine.
    
    .EXAMPLE
        Get-IsWindows

        returns $True
    #>

    # Method 1
    # This could honestly just be the first if statement and nothing else
    if (!$IsWindows) {
        $IsUnix = $false
        $IsWindows = $true
    }elseif($IsWindows -eq $false){
        $IsUnix = $true
    }elseif($IsWindows -eq $true){
        $IsUnix = $false
    }

    # Method 2
    <#
    $psVersion = $PSVersionTable
    if ($psVersion.Platform -eq "Unix") {
        $IsUnix = $true
    }elseif (!$psVersion.Platform) {
        $IsUnix = $false
    }elseif($psVersion.Platform -like "*Win*"){
        $IsUnix = $false
    }
    #>


    return $IsWindows
}

Export-ModuleMember -Function "Get-IsWindows"