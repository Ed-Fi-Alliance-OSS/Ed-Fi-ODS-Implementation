# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -module Pester -version 5

BeforeAll { Import-Module -Force ($PSCommandPath.Replace('.tests.ps1','.psm1')) }

Describe 'Test-AppSettings' {
    It "returns $true when settings are valid" {
        $file = "TestDrive:\test.json"
        Set-Content $file -value '{ "object": { "array": [ 0, 1, 2] }, "property": "value" }'
        $result = $file | Test-AppSettings

        $result | Should -Not -BeNullOrEmpty
        $result | Should -Be $true
    }

    It "returns $false when settings are invalid" {
        $file = "TestDrive:\test.json"
        Set-Content $file -value '{ "object": { "array": [ 0, 1, 2] }, "property": "value" }X'
        $result = $file | Test-AppSettings

        $result | Should -Not -BeNullOrEmpty
        $result | Should -Be $false
    }

    It "returns $false when file is not found" {
        $result = "notFound.json" | Test-AppSettings

        $result | Should -Not -BeNullOrEmpty
        $result | Should -Be $false
    }
}

Describe 'Get-MergedSettings' {
    It "returns settings as a hashtable" {
        $config = Get-MergedSettings -Engine 'SQLServer' -Project 'EdFi.Ods.SwaggerUI'
        ($config | ConvertTo-Json -Depth 10) | Out-Host
        $config | Should -Not -BeNullOrEmpty
    }
}

Describe 'New-DevelopmentAppSettings' {
    It "returns settings as a hashtable" {
        $config = New-DevelopmentAppSettings
        # ($config | ConvertTo-Json -Depth 10) | Out-Host
        # $config | Should -Not -BeNullOrEmpty
    }
}

Describe 'New-DevelopmentSettings' {
    It "returns settings as a hashtable" {
        $config = New-DevelopmentSettings
        # ($config | ConvertTo-Json -Depth 10) | Out-Host
        # $config | Should -Not -BeNullOrEmpty
    }
}


