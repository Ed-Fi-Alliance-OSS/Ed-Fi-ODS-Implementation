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

function Merge-HashtablesDeepRight {
    param(
        [Hashtable] $HashtableLeft,

        [Hashtable] $HashtableRight
    )

    $result = $HashtableLeft | Get-HashtableDeepClone

    foreach ($key in $HashtableRight.Keys) {
        if ($HashtableLeft[$key] -is [Hashtable] -and $HashtableRight[$key] -is [Hashtable]) {
            $result[$key] = Merge-HashtablesDeepRight $HashtableLeft[$key] $HashtableRight[$key]
        }
        else {
            $result[$key] = $HashtableRight[$key]
        }
    }

    return $result
}

function Merge-Hashtables {
    param(
        [Hashtable[]] $Hashtables
    )

    $result = $Hashtables[0]

    for ($i = 0; $i -lt @($Hashtables).Count; $i++) {
        $result = Merge-HashtablesDeepRight $result $Hashtables[$i + 1]
    }

    return $result
}


Export-ModuleMember -Function *
