# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

function ConvertTo-Hashtable {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [PSObject] $Object
    )

    $result = @{ }

    $keys = $Object | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name

    foreach ($key in $keys) {
        if ($Object.$key -is [PSObject]) {
            $result[$key] = $Object.$key | ConvertTo-Hashtable
        }
        else {
            $result[$key] = $Object.$key
        }
    }

    return $result
}

function Get-HashtableDeepClone {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Hashtable] $Hashtable
    )

    $result = @{ }

    foreach ($key in $Hashtable.Keys) {
        if ($Hashtable[$key] -is [Hashtable]) {
            $result[$key] = $Hashtable[$key] | Get-HashtableDeepClone
        }
        else {
            $result[$key] = $Hashtable[$key]
        }
    }

    return $result
}

$script:MergeWithDefault = { param($Key, $Left, $Right) return $Right[$Key] }

function Merge-HashtablesDeepRight {
    param(
        [Hashtable] $HashtableLeft,

        [Hashtable] $HashtableRight,

        [scriptblock] $MergeWith = $script:MergeWithDefault
    )

    $result = $HashtableLeft | Get-HashtableDeepClone

    foreach ($key in $HashtableRight.Keys) {
        if ($HashtableLeft[$key] -is [Hashtable] -and $HashtableRight[$key] -is [Hashtable]) {
            $result[$key] = (Merge-HashtablesDeepRight $HashtableLeft[$key] $HashtableRight[$key] $MergeWith)
        }
        else {
            $result[$key] = (& $MergeWith $key $HashtableLeft $HashtableRight)
        }
    }

    return $result
}

function Merge-Hashtables {
    param(
        [Hashtable[]] $Hashtables,

        [scriptblock] $MergeWith = $script:MergeWithDefault
    )

    $result = $Hashtables[0] | Get-HashtableDeepClone

    for ($i = 0; $i -lt @($Hashtables).Count; $i++) {
        $result = Merge-HashtablesDeepRight $result $Hashtables[$i + 1] $MergeWith
    }

    return $result
}

function Merge-HashtablesOrDefaults {
    param(
        [Hashtable[]] $Hashtables
    )

    $MergeWith = {
        param(
            $Key,

            $Left,

            $Right
        )

        if (-not ([string]::IsNullOrWhiteSpace($Left[$Key]))) { return $Left[$Key] }

        return (& $script:MergeWithDefault $Key $Left $Right)
    }

    return (Merge-Hashtables $Hashtables $MergeWith)
}

function Get-FlatHashTable {
    param(
        [hashtable] $Hastable,

        [string] $Delimiter = ':'
    )

    $result = @{ }

    function Get-FlatObject {
        param(
            $Object,

            [string] $Name
        )

        if ($Object -is [Hashtable]) {
            foreach ($key in $Object.Keys) {
                Get-FlatObject $Object[$key] "$Name$key$Delimiter"
            }
        }
        elseif ($Object -is [Object[]]) {
            for ($i = 0; $i -lt @($Object).Count; $i++) {
                Get-FlatObject $Object[$i] "$Name$i$Delimiter"
            }
        }
        else {
            $result[$Name.Trim($Delimiter)] = $Object
        }
    }

    Get-FlatObject($Hastable)

    return $result
}

function Write-FlatHashtable {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Hashtable] $Hashtable
    )

    (Get-FlatHashtable ($Hashtable)).GetEnumerator() |
        Sort-Object -Property Name |
        Format-Table -HideTableHeaders -AutoSize -Wrap |
        Out-Host
}

function Get-UnFlatObject {
    param(
        [string] $Key,

        $Value,

        $Object
    )

    $RegExFilter = "\A(?<curr>[^:]+)(:(?<remain>(?<sub>[^:]+)(:.*)?))?\Z"

    if ($Value) {
        if ($key -match $RegExFilter) {
            $Current = $matches.curr

            if (-not ($Object | gm $Current)) {
                if (-not $Object.ContainsKey($Current)) { $Object.$Current = @{ }
                }
            }

            if ($matches.remain) {
                $Object.$Current = Get-UnFlatObject -Key $matches.remain -Value $Value -Obj ($Object.$Current)
            }
            else {
                $Object.$Current = $Value
            }

            return $Object
        }
    }
}

function Get-UnFlatHashTable {
    param(
        [Hashtable] $Hashtable
    )

    $resultTable = @{ }

    foreach ($key in $Hashtable.Keys) {
        if ($Hashtable.$key) {
            $resultTable = Get-UnFlatObject -Key $key -Value $Hashtable.$key -Obj $resultTable
        }
    }

    return $resultTable
}

Export-ModuleMember -Function *
