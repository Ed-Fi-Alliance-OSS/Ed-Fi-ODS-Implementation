# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -module Pester -version 5

BeforeAll { Import-Module -Force ($PSCommandPath.Replace('.tests.ps1', '.psm1')) }

Describe 'Assert-ValidAppSettings' {
    It "returns successful when settings are valid" {
        $file = "TestDrive:\test.json"
        Set-Content $file -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }'
        $result = Assert-ValidAppSettings $file

        $result | Should -Not -BeNullOrEmpty
        $result.success | Should -Be $true
    }

    It "returns unsuccessfully with exception when settings are invalid" {
        $file = "TestDrive:\test.json"
        Set-Content $file -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }X'
        $result = Assert-ValidAppSettings $file

        $result | Should -Not -BeNullOrEmpty
        $result.success | Should -Be $false
        $result.exception | Should -Not -BeNullOrEmpty
    }

    It "returns unsuccessfully with exception when file is not found" {
        $result = Assert-ValidAppSettings "notFound.json"

        $result.success | Should -Be $false
        $result.exception | Should -Not -BeNullOrEmpty
    }

    It "returns results for multiple files" {
        $files = ("TestDrive:\test0.json", "TestDrive:\test1.json", "TestDrive:\test2.json")
        Set-Content $files[0] -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }'
        Set-Content $files[1] -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }X'
        Set-Content $files[2] -value '{ "object": { "array": [ 0, 1, 2 ] }, "property": "value" }'
        $result = Assert-ValidAppSettings $files

        $result[0].success | Should -Be $true
        $result[1].success | Should -Be $false
        $result[1].exception | Should -Not -BeNullOrEmpty
        $result[2].success | Should -Be $true
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

        $appSettingsFiles = @(
            $appSettings,
            $developmentAppSettings
        )
        $settings = Get-MergedAppSettings $appSettingsFiles ((Get-ProjectTypes).WebApi)

        $settings | Should -Not -BeNullOrEmpty
        $settings.object | Should -Not -BeNullOrEmpty
        $settings.object.array | Should -Not -BeNullOrEmpty
        $settings.object.array.Length | Should -Be 1
        $settings.property | Should -Not -BeNullOrEmpty
        $settings.property | Should -be 'newValue'
        $settings.object.newProperty | Should -Not -BeNullOrEmpty
    }
}

Describe 'Set-Feature' {
    It "returns a settings object with a new feature when the feature does not exist" {
        $appSettings = "TestDrive:\appSettings.json"
        Set-Content $appSettings -value '{ "ApiSettings": { "Features": [ ] } }'

        $settings = Get-MergedAppSettings $appSettings
        $settings = Set-Feature -Settings $settings -FeatureName "NewFeature" -IsEnabled $true

        $settings | Should -Not -BeNullOrEmpty
        $settings.ApiSettings | Should -Not -BeNullOrEmpty
        $settings.ApiSettings.Features | Should -Not -BeNullOrEmpty
        $settings.ApiSettings.Features.Length | Should -Be 1

        $feature = $settings.ApiSettings.Features[0]

        $feature | Should -Not -BeNullOrEmpty
        $feature.Name | Should -Be "NewFeature"
        $feature.IsEnabled | Should -Be $true
    }

    It "returns a settings file with an updated feature" {
        $appSettings = "TestDrive:\appSettings.json"
        $settings = Set-Content $appSettings -value '{ "ApiSettings": { "Features": [ {"Name" : "Feature", "IsEnabled" : "false"} ] } }'

        $settings = Get-MergedAppSettings $appSettings
        $settings = Set-Feature -Settings $settings -FeatureName "Feature" -IsEnabled $true

        $settings | Should -Not -BeNullOrEmpty
        $settings.ApiSettings | Should -Not -BeNullOrEmpty
        $settings.ApiSettings.Features | Should -Not -BeNullOrEmpty
        $settings.ApiSettings.Features.Length | Should -Be 1

        $feature = $settings.ApiSettings.Features[0]

        $feature | Should -Not -BeNullOrEmpty
        $feature.Name | Should -Be "Feature"
        $feature.IsEnabled | Should -Be $true
    }
}
