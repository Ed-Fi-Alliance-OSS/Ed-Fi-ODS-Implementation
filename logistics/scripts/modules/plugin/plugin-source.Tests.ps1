# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -module Pester -version 5

BeforeAll { Import-Module -Force -Scope Global ($PSCommandPath.Replace('.Tests.ps1', '.psm1')) }

Describe 'Get-PluginFolderFromSettings' {
    It "Gets the plugin folder"{
        $settings = Get-EdFiDeveloperPluginSettings
        $pfolder = Get-PluginFolderFromSettings $settings
        $pfolder | Should -BeOfType [System.Management.Automation.PathInfo]
        Test-path $pfolder | Should -Be $true
    }
}

Describe 'Get-PluginScriptsFromSettings' {
    It "Gets plugin scripts"{
        $settings = Get-EdFiDeveloperPluginSettings
        $pfolder = Get-PluginFolderFromSettings $settings
        $pScripts = Get-PluginScriptsFromSettings $settings
        foreach($pScript in $pScripts){
            $sPath = Join-Path $pfolder "$($pScript).ps1"
            Test-Path $sPath | Should -Be $true
        }
    }
}

Describe 'Get-Plugins' {
    It "Gets plugin"{
        $settings = Get-EdFiDeveloperPluginSettings
        $plugs = Get-Plugins $settings
        foreach($plug in $plugs){
            Test-Path $plug | Should -Be $true
            Get-Item $plug | Should -BeOfType System.IO.DirectoryInfo
        }
    }
}

Describe 'Remove-Plugins' {
    It "Removes plugin"{
        $settings = Get-EdFiDeveloperPluginSettings
        $pfolder = Get-PluginFolderFromSettings $settings
        Remove-Plugins $settings
        $plugchilds = Get-ChildItem $pfolder
        foreach ($plugchild in $plugchilds) {
            Test-Path $plugchild -PathType container | Should -Be $false
        }
    }
}

Describe 'Get-PluginScriptsForPackaging' {
    It "Gets plugin scripts and ready for packaging"{
        $settings = Get-EdFiDeveloperPluginSettings
        $pScripts = Get-PluginScriptsForPackaging $settings
        foreach($pScript in $pScripts){
            Test-Path $pScript | Should -Be $true
        }
    }
}