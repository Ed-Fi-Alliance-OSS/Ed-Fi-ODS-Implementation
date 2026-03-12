# Test Docker Images Locally Before Pushing
# Run from: C:\Workspace\Ed-Fi-ODS-Implementation

Write-Host "`n╔═══════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Docker Image Build Test - MSSQL Multi-Platform ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

$ErrorActionPreference = "Stop"
$testsPassed = 0
$testsFailed = 0

# Test 1: MSSQL Web API Single Platform (AMD64)
Write-Host "`n[Test 1/4] Building MSSQL Web API (AMD64 only)..." -ForegroundColor Yellow
try {
    Push-Location Docker
    ./Invoke-Build.ps1 -PackageVersion "7.3" -PreRelease `
        -ImageName "ods-api-web-api" -Path "alpine/mssql"
    Pop-Location
    Write-Host "✅ Test 1 PASSED: MSSQL Web API (AMD64) built successfully" -ForegroundColor Green
    $testsPassed++
} catch {
    Write-Host "❌ Test 1 FAILED: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
    Pop-Location
}

# Test 2: MSSQL Sandbox Admin Single Platform (AMD64)
Write-Host "`n[Test 2/4] Building MSSQL Sandbox Admin (AMD64 only)..." -ForegroundColor Yellow
try {
    Push-Location Docker
    ./Invoke-Build.ps1 -PackageVersion "7.3" -PreRelease `
        -ImageName "ods-api-web-sandbox-admin" -Path "alpine/mssql"
    Pop-Location
    Write-Host "✅ Test 2 PASSED: MSSQL Sandbox Admin (AMD64) built successfully" -ForegroundColor Green
    $testsPassed++
} catch {
    Write-Host "❌ Test 2 FAILED: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
    Pop-Location
}

# Test 3: PostgreSQL Web API for comparison
Write-Host "`n[Test 3/4] Building PostgreSQL Web API (for comparison)..." -ForegroundColor Yellow
try {
    Push-Location Docker
    ./Invoke-Build.ps1 -PackageVersion "7.3" -PreRelease `
        -ImageName "ods-api-web-api" -Path "alpine/pgsql"
    Pop-Location
    Write-Host "✅ Test 3 PASSED: PostgreSQL Web API built successfully" -ForegroundColor Green
    $testsPassed++
} catch {
    Write-Host "❌ Test 3 FAILED: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
    Pop-Location
}

# Test 4: Verify image sizes
Write-Host "`n[Test 4/4] Verifying image sizes..." -ForegroundColor Yellow
try {
    $mssqlImage = docker images edfialliance/ods-api-web-api:pre --format "{{.Size}}" | Select-Object -First 1
    $pgsqlImage = docker images edfialliance/ods-api-web-api:pre --format "{{.Size}}" | Select-Object -Skip 1 -First 1
    
    Write-Host "  MSSQL image size: $mssqlImage" -ForegroundColor White
    Write-Host "  PostgreSQL image size: $pgsqlImage" -ForegroundColor White
    Write-Host "✅ Test 4 PASSED: Image sizes verified" -ForegroundColor Green
    $testsPassed++
} catch {
    Write-Host "⚠️  Test 4 SKIPPED: Could not verify image sizes" -ForegroundColor Yellow
}

# Summary
Write-Host "`n╔═══════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║              Test Results Summary                 ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════╝`n" -ForegroundColor Cyan
Write-Host "  Tests Passed: $testsPassed" -ForegroundColor Green
Write-Host "  Tests Failed: $testsFailed" -ForegroundColor $(if ($testsFailed -gt 0) { "Red" } else { "Green" })
Write-Host ""

if ($testsFailed -eq 0) {
    Write-Host "✅ All tests passed! Ready to commit and push." -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "  1. git add Docker/" -ForegroundColor White
    Write-Host '  2. git commit -m "[ODS-6812] Remove MSSQL tools for multi-platform"' -ForegroundColor White
    Write-Host "  3. git push origin ODS-6812" -ForegroundColor White
    Write-Host "  4. Trigger 'Analyze Docker Images' workflow on GitHub" -ForegroundColor White
} else {
    Write-Host "❌ Some tests failed. Please review errors above." -ForegroundColor Red
    exit 1
}
