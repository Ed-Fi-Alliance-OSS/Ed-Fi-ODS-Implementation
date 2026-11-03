# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 7

<#
.SYNOPSIS
    Checks that the test harness issues and accepts JWT access tokens.

.DESCRIPTION
    Starts the test harness with a sandbox API client and verifies that:
    * The token endpoint returns an RS256-signed JWT with the expected claims (jti, iss, aud, exp, educationOrganizationId, odsInstances)
    * Requested OneRoster scopes are returned in the token response and in the scope claim
    * The token is active in token_info and authorizes a data request
    * A token with a tampered signature is rejected

    The test harness must have been configured with AccessTokenType 'jwt' (initdev -AccessTokenType jwt).

    .PARAMETER apiUrl
    The url of the test harness, must NOT end in a forward slash (Default: http://localhost:8765)

    .PARAMETER testHarnessLogNamePrefix
    Prefix for the test harness log file name

    .EXAMPLE
    PS> Invoke-JwtAccessTokenTests.ps1
#>
param(
    [string] $apiUrl = "http://localhost:8765",
    [string] $testHarnessLogNamePrefix = "JwtAccessTokenTests"
)

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot/../../logistics/scripts/modules/load-path-resolver.ps1"
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics/scripts/modules/LoadTools.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/TestHarness.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics/scripts/modules/tasks/TaskHelper.psm1")

$oneRosterScope = "https://purl.imsglobal.org/spec/or/v1p2/scope/roster-core.readonly"
$expectedEducationOrganizationId = "255901"

$config = @{
    apiClientNameSandbox    = "ODS/API"
    testHarnessJsonConfig   = (Get-RepositoryResolvedPath "logistics/scripts/smokeTestHarnessConfiguration.json")
    bulkLoadTempJsonConfig  = Join-Path ([IO.Path]::GetTempPath()) "jwtAccessTokenTestsConfig.json"
}

$script:failures = @()

function Assert-Condition([bool] $condition, [string] $description) {
    if ($condition) {
        Write-Host "PASS  $description" -ForegroundColor Green
    }
    else {
        Write-Host "FAIL  $description" -ForegroundColor Red
        $script:failures += $description
    }
}

function ConvertFrom-Base64Url([string] $value) {
    $value = $value.Replace('-', '+').Replace('_', '/')
    switch ($value.Length % 4) {
        2 { $value += '==' }
        3 { $value += '=' }
    }
    return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($value))
}

function Get-AccessToken([string] $scope) {
    $credentials = "$([uri]::EscapeDataString($config.apiSandboxKey)):$([uri]::EscapeDataString($config.apiSandboxSecret))"
    $headers = @{ Authorization = "Basic $([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($credentials)))" }
    $body = @{ grant_type = 'client_credentials' }
    if ($scope) { $body.scope = $scope }

    return Invoke-RestMethod -Uri "$apiUrl/oauth/token" -Method Post -Headers $headers -Body $body
}

function Get-StatusCode([string] $uri, [string] $accessToken) {
    $response = Invoke-WebRequest -Uri $uri -Headers @{ Authorization = "Bearer $accessToken" } -SkipHttpErrorCheck
    return [int]$response.StatusCode
}

function Invoke-JwtAccessTokenChecks {
    $tokenResponse = Get-AccessToken
    $parts = $tokenResponse.access_token.Split('.')
    Assert-Condition ($parts.Count -eq 3) "Access token is a JWT (header.payload.signature)"
    if ($parts.Count -ne 3) { return }

    $header = ConvertFrom-Base64Url $parts[0] | ConvertFrom-Json
    $payload = ConvertFrom-Base64Url $parts[1] | ConvertFrom-Json
    Assert-Condition ($header.alg -eq 'RS256') "JWT is signed with RS256"
    Assert-Condition (-not [string]::IsNullOrEmpty($payload.jti)) "JWT has a jti claim"
    Assert-Condition (-not [string]::IsNullOrEmpty($payload.iss)) "JWT has an iss claim"
    Assert-Condition (@($payload.aud).Count -gt 0) "JWT has an aud claim"
    Assert-Condition ($payload.exp -gt [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()) "JWT exp claim is in the future"
    Assert-Condition (@($payload.educationOrganizationId) -contains $expectedEducationOrganizationId) "JWT educationOrganizationId claim includes $expectedEducationOrganizationId"
    Assert-Condition (-not [string]::IsNullOrEmpty($payload.odsInstances)) "JWT has an odsInstances claim"

    $tokenInfo = Invoke-RestMethod -Uri "$apiUrl/oauth/token_info" -Method Post -Headers @{ Authorization = "Bearer $($tokenResponse.access_token)" } -Body @{ token = $tokenResponse.access_token }
    Assert-Condition ($tokenInfo.active -eq $true) "token_info reports the JWT as active"

    $statusCode = Get-StatusCode "$apiUrl/data/v3/ed-fi/schools?limit=1" $tokenResponse.access_token
    Assert-Condition ($statusCode -eq 200) "JWT authorizes GET /ed-fi/schools (status $statusCode)"

    $tamperedToken = "$($parts[0]).$($parts[1]).$($parts[2].Substring(0, $parts[2].Length - 4))AAAA"
    $statusCode = Get-StatusCode "$apiUrl/data/v3/ed-fi/schools?limit=1" $tamperedToken
    Assert-Condition ($statusCode -eq 401) "JWT with a tampered signature is rejected (status $statusCode)"

    $oneRosterResponse = Get-AccessToken $oneRosterScope
    $oneRosterPayload = ConvertFrom-Base64Url $oneRosterResponse.access_token.Split('.')[1] | ConvertFrom-Json
    Assert-Condition (($oneRosterResponse.scope -split ' ') -contains $oneRosterScope) "Token response scope includes the requested OneRoster scope"
    Assert-Condition (@($oneRosterPayload.scope) -contains $oneRosterScope) "JWT scope claim includes the requested OneRoster scope"
}

$errorCode = 0;

try {
    Clear-Error

    $script:result = @()

    $script:result += Invoke-Task "Add-RandomKeySecret" { Add-RandomKeySecret $config }

    $script:result += Invoke-Task "Start-TestHarness" {
        $params = @{
            apiUrl                   = $apiUrl
            configurationFilePath    = $config.bulkLoadTempJsonConfig
            testHarnessLogNamePrefix = $testHarnessLogNamePrefix
        }
        Start-TestHarness @params
    }

    $script:result += Invoke-Task "Invoke-JwtAccessTokenChecks" { Invoke-JwtAccessTokenChecks }

    Test-Error

    if ($script:failures.Count -gt 0) {
        throw "$($script:failures.Count) JWT access token check(s) failed."
    }

    $script:result += New-TaskResult -name '-' -duration '-'
    $script:result += New-TaskResult -name $MyInvocation.MyCommand.Name -duration $elapsed.format

    return $script:result | Format-Table
}
catch {
    Write-Host $_
    $errorCode = 1;
}
finally {
    Stop-TestHarness
    exit $errorCode;
}
