# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -module Pester -version 5

BeforeAll { Import-Module -Force ($PSCommandPath.Replace('.tests.ps1', '.psm1')) }

Describe 'ConvertTo-Hashtable' {
    It "converts object to hashtable" {
        $a = '{ "x": "0" }' | ConvertFrom-Json | ConvertTo-Hashtable

        $a | Should -BeOfType [System.Collections.Hashtable]
        $a.x | Should -Be '0'
    }

    It "converts nested objects to hashtable" {
        $a = '{ "x": { "y": "0" } }' | ConvertFrom-Json | ConvertTo-Hashtable

        $a | Should -BeOfType [System.Collections.Hashtable]
        $a.x | Should -BeOfType [System.Collections.Hashtable]
        $a.x.y | Should -Be '0'
    }

    It "converts doubly nested objects to hashtable" {
        $a = '{ "x": { "y": { "z": 0 } } }' | ConvertFrom-Json | ConvertTo-Hashtable

        $a | Should -BeOfType [System.Collections.Hashtable]
        $a.x | Should -BeOfType [System.Collections.Hashtable]
        $a.x.y | Should -BeOfType [System.Collections.Hashtable]
        $a.x.y.z | Should -Be '0'
    }

    It "converts arrays to hashtable" {
        $a = '{ "x": [ 0, 1, 2 ] }' | ConvertFrom-Json | ConvertTo-Hashtable

        $a | Should -Not -BeNullOrEmpty
        $a.x | Should -BeOfType [int]
        $a.x[0] | Should -Be 0
        $a.x[1] | Should -Be 1
        $a.x[2] | Should -Be 2
    }

    It "converts nested arrays to hashtable" {
        $a = '{ "x": { "y": [ 0, 1, 2 ] } }' | ConvertFrom-Json | ConvertTo-Hashtable

        $a | Should -Not -BeNullOrEmpty
        $a.x | Should -BeOfType [System.Collections.Hashtable]
        $a.x.y | Should -BeOfType [int]
        $a.x.y[0] | Should -Be 0
        $a.x.y[1] | Should -Be 1
        $a.x.y[2] | Should -Be 2
    }

    It "converts doubly nested arrays to hashtable" {
        $a = '{ "x": { "y": { "z": [ 0, 1, 2 ] } } }' | ConvertFrom-Json | ConvertTo-Hashtable

        $a | Should -Not -BeNullOrEmpty
        $a.x | Should -BeOfType [System.Collections.Hashtable]
        $a.x.y | Should -BeOfType [System.Collections.Hashtable]
        $a.x.y.z | Should -BeOfType [int]
        $a.x.y.z[0] | Should -Be 0
        $a.x.y.z[1] | Should -Be 1
        $a.x.y.z[2] | Should -Be 2
    }
}

Describe 'Get-HashtableDeepClone' {
    It "creates a deep clone of a nested hashtable" {
        $a = @{ x = 0 }
        $b = @{ y = 1; z = $a }
        $result = $b | Get-HashtableDeepClone

        $result | Should -BeOfType [System.Collections.Hashtable]
        $result | Should -Not -Be $b
        $result.z | Should -Not -Be $a

        $result.y | Should -Be 1
        $result.z | Should -BeOfType [System.Collections.Hashtable]
        $result.z.x | Should -Be 0
    }

    It "creates a deep clone of a doubly nested hashtable" {
        $a = @{ w = 0 }
        $b = @{ x = $a }
        $c = @{ y = 1; z = $b }
        $result = $c | Get-HashtableDeepClone

        $result | Should -BeOfType [System.Collections.Hashtable]
        $result | Should -Not -Be $c
        $result.z | Should -Not -Be $b
        $result.z.x | Should -Not -Be $a

        $result.y | Should -Be 1
        $result.z | Should -BeOfType [System.Collections.Hashtable]
        $result.z.x | Should -BeOfType [System.Collections.Hashtable]
        $result.z.x.w | Should -Be 0
    }
}

Describe 'Merge-HashtablesDeepRight' {
    It "merges two hashtables into a new hashtable" {
        $a = @{ w = 0; x = 1; y = @{ z = 2 } }
        $b = @{ a = 3; b = 4; c = @{ d = 5 } }
        $result = Merge-HashtablesDeepRight $a $b

        $result | Should -BeOfType [System.Collections.Hashtable]
        $result.w | Should -Be 0
        $result.x | Should -Be 1
        $result.y | Should -BeOfType [System.Collections.Hashtable]
        $result.y.z | Should -Be 2
        $result.a | Should -Be 3
        $result.b | Should -Be 4
        $result.c | Should -BeOfType [System.Collections.Hashtable]
        $result.c.d | Should -Be 5
    }

    It "overrides properties in the first hastable with properties from the second hashtable" {
        $a = @{ a = @{ b = 0; c = 1 }; y = 2 }
        $b = @{ a = @{ b = 3; c = 4 }; z = 5 }
        $result = Merge-HashtablesDeepRight $a $b

        $result | Should -BeOfType [System.Collections.Hashtable]
        $result.a | Should -BeOfType [System.Collections.Hashtable]
        $result.a.b | Should -Be 3
        $result.a.c | Should -Be 4
        $result.y | Should -Be 2
        $result.z | Should -Be 5
    }

    It "is non destructive" {
        $a = @{ a = 0; b = @{ c = 1 } }
        $b = @{ x = 2; b = @{ c = 3; d = 4 } }
        $result = Merge-HashtablesDeepRight $a $b

        $result | Should -Not -BeExactly $a
        $result.b | Should -Not -BeExactly $b.b

        $result | Should -BeOfType [System.Collections.Hashtable]
        $result.a | Should -Be 0
        $result.b | Should -BeOfType [System.Collections.Hashtable]
        $result.b.c | Should -Be 3
        $result.x | Should -Be 2
        $result.b.d | Should -Be 4
    }

    It "does not merge arrays" {
        $a = @{ a = 0; b = @( 0, 1, 2 ) }
        $b = @{ x = 2; b = @( 3, 4, 5 ) }
        $result = Merge-HashtablesDeepRight $a $b

        $result | Should -BeOfType [System.Collections.Hashtable]
        $result.a | Should -Be 0
        $result.b | Should -BeOfType [int]
        $result.b[0] | Should -Be 3
        $result.b[1] | Should -Be 4
        $result.b[2] | Should -Be 5
    }
}

Describe 'Merge-Hashtables' {
    It "merges multiple hashtables into a new hashtable" {
        $a = @{ a = 0; b = @{ c = 1 } }
        $b = @{ b = @{ c = 2; d = @{ e = 3 } }; f = 4 }
        $c = @{ b = @{ d = @{ e = 5; g = @{ h = 6 } } }; i = @{ j = 7 } }
        $d = @{ k = 8; i = @{ l = 9 } }
        $result = Merge-Hashtables $a, $b, $c, $d

        # @{ a = 0; b = @{ c = 2; d = @{ e = 5; g = @{ h = 6 } } }; i = @{ j = 7; l = 9 }; k = 8 }
        $result | Should -BeOfType [System.Collections.Hashtable]
        $result.a | Should -Be 0
        $result.b | Should -BeOfType [System.Collections.Hashtable]
        $result.b.c | Should -Be 2
        $result.b.d | Should -BeOfType [System.Collections.Hashtable]
        $result.b.d.e | Should -Be 5
        $result.b.d.g | Should -BeOfType [System.Collections.Hashtable]
        $result.b.d.g.h | Should -Be 6
        $result.i | Should -BeOfType [System.Collections.Hashtable]
        $result.i.j | Should -Be 7
        $result.i.l | Should -Be 9
        $result.k | Should -Be 8
    }
}

Describe 'Get-FlatHashtable' {
    It "merges multiple hashtables into a new hashtable" {
        $a = @{
            b = @{
                d = @{
                    e = @(0, 1, 2);
                    g = @{
                        h = @(@{ l = 3; m = @{ n = 4 } }, 5)
                    }
                }
            };
            i = @{
                j = 6
            };
            k = @(
                @{ l = 7; m = @{ n = 8 } }
                @{ o = 9; p = @{ q = 10 } }
            )
        }
        $result = Get-FlatHashtable $a

        $result['b:d:e:0'] | Should -Be 0
        $result['b:d:e:1'] | Should -Be 1
        $result['b:d:e:2'] | Should -Be 2
        $result['b:d:g:h:0:l'] | Should -Be 3
        $result['b:d:g:h:0:m:n'] | Should -Be 4
        $result['b:d:g:h:1'] | Should -Be 5
        $result['i:j'] | Should -Be 6
        $result['k:0:l'] | Should -Be 7
        $result['k:0:m:n'] | Should -Be 8
        $result['k:1:o'] | Should -Be 9
        $result['k:1:p:q'] | Should -Be 10
    }
}

Describe 'Get-UnFlatHashTable' {
    It "Convert the flatten hashtables into a new unflatten hashtable" {
    $a = @{ 
    'a:b:c' = 'd'
    'a:b:e:f:g' = 'h'
    }

    $result = Get-UnFlatHashTable $a

    $result | Should -BeOfType [System.Collections.Hashtable]
    $result.a | Should -BeOfType [System.Collections.Hashtable]
    $result.a.b | Should -BeOfType [System.Collections.Hashtable]
    $result.a.b.c | Should -Be 'd'
    $result.a.b.e | Should -BeOfType [System.Collections.Hashtable]
    $result.a.b.e.f | Should -BeOfType [System.Collections.Hashtable]
    $result.a.b.e.f.g | Should -Be 'h'

   }
}
