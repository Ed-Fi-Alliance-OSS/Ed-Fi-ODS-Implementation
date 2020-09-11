# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -module Pester -version 5

BeforeAll { Import-Module -Force ($PSCommandPath.Replace('.tests.ps1', '.psm1')) }

Describe 'Test-AppSettings' {
    It "returns $true when settings are valid" {
        $file = "TestDrive:\test.json"
        Set-Content $file -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }'
        $result = $file | Test-AppSettings

        $result | Should -Not -BeNullOrEmpty
        $result | Should -Be $true
    }

    It "returns $false when settings are invalid" {
        $file = "TestDrive:\test.json"
        Set-Content $file -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }X'
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

Describe 'Get-FeatureSubTypesFromSettings' {
    It "returns a single known subtype" {
        $subtypes = Get-FeatureSubTypesFromSettings @{
            ApiSettings = @{
                Features = @(
                    @{ Name = 'ChangeQueries'; IsEnabled = $true; }
                )
            }
        }

        $subtypes | Should -Not -BeNullOrEmpty
        $subtypes | Should -Not -BeNullOrEmpty
        @($subtypes).Length | Should -Be 1
        $subtypes | Should -Be 'changes'
    }

    It "returns multiple known subtypes" {
        $subtypes = Get-FeatureSubTypesFromSettings @{
            ApiSettings = @{
                Features = @(
                    @{ Name = 'ChangeQueries'; IsEnabled = $true; }
                    @{ Name = 'OwnershipBasedAuthorization'; IsEnabled = $true; }
                )
            }
        }

        $subtypes | Should -Not -BeNullOrEmpty
        @($subtypes).Length | Should -Be 2
        $subtypes | Should -Contain 'changes'
        $subtypes | Should -Contain 'RecordOwnership'
    }

    It "returns only known subtypes" {
        $subtypes = Get-FeatureSubTypesFromSettings @{
            ApiSettings = @{
                Features = @(
                    @{ Name = 'Unknown'; IsEnabled = $true; }
                    @{ Name = 'ChangeQueries'; IsEnabled = $true; }
                    @{ Name = 'OwnershipBasedAuthorization'; IsEnabled = $true; }
                )
            }
        }

        @($subtypes).Length | Should -Be 2
        $subtypes | Should -Not -BeNullOrEmpty
        $subtypes | Should -Contain 'changes'
        $subtypes | Should -Contain 'RecordOwnership'
    }

    It "returns only enabled subtypes" {
        $subtypes = Get-FeatureSubTypesFromSettings @{
            ApiSettings = @{
                Features = @(
                    @{ Name = 'ChangeQueries'; IsEnabled = $false; }
                    @{ Name = 'OwnershipBasedAuthorization'; IsEnabled = $true; }
                )
            }
        }

        @($subtypes).Length | Should -Be 1
        $subtypes | Should -Not -BeNullOrEmpty
        $subtypes | Should -Contain 'RecordOwnership'
    }

    It "returns $null if setting are not present" {
        $subtypes = Get-FeatureSubTypesFromSettings $null

        $subtypes | Should -BeNullOrEmpty
    }
}

Describe 'Get-EnabledFeaturesFromSettings' {
    It "returns all enabled features" {
        $features = Get-EnabledFeaturesFromSettings @{
            ApiSettings = @{
                Features = @(
                    @{ Name = 'Extensions'; IsEnabled = $true; }
                    @{ Name = 'Profiles'; IsEnabled = $false; }
                    @{ Name = 'OpenApiMetadata'; IsEnabled = $true; }
                )
            }
        }

        $features | Should -Not -BeNullOrEmpty
        @($features).Length | Should -Be 2
        $features | Should -contain 'Extensions'
        $features | Should -contain 'OpenApiMetadata'
    }

    It "returns no features if non are enabled" {
        $features = Get-EnabledFeaturesFromSettings @{
            ApiSettings = @{
                Features = @(
                    @{ Name = 'Extensions'; IsEnabled = $false; }
                    @{ Name = 'Profiles'; IsEnabled = $false; }
                    @{ Name = 'OpenApiMetadata'; IsEnabled = $false; }
                )
            }
        }

        $features | Should -BeNullOrEmpty
        @($features).Length | Should -Be 0
    }

    It "returns $null if setting are not present" {
        $features = Get-EnabledFeaturesFromSettings $null

        $features | Should -BeNullOrEmpty
    }
}

Describe 'Get-MergedSettings' {
    It "returns merged settings from multiple files as a hashtable" {
        $appSettings = "TestDrive:\appSettings.json"
        Set-Content $appSettings -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }'

        $developmentAppSettings =  "TestDrive:\appSettings.development.json"
        Set-Content $developmentAppSettings -value '{ "object": { "array": [ 0 ], "newProperty": "value" }, "property": "newValue" }'

        $userAppSettings =  "TestDrive:\appSettings.user.json"
        Set-Content $userAppSettings -value '{ "object": { "newObject": { "newObjectProperty": "value" } } }'

        $settings = Get-MergedAppSettings $appSettings, $developmentAppSettings, $userAppSettings

        $settings | Should -Not -BeNullOrEmpty
        $settings.object | Should -Not -BeNullOrEmpty
        $settings.object.array | Should -Not -BeNullOrEmpty
        $settings.object.array.Length | Should -Be 1
        $settings.property | Should -Not -BeNullOrEmpty
        $settings.property | Should -be 'newValue'
        $settings.object.newProperty | Should -Not -BeNullOrEmpty
        $settings.object.newObject | Should -Not -BeNullOrEmpty
        $settings.object.newObject.newObjectProperty | Should -Not -BeNullOrEmpty
    }
}
