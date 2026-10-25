#requires -Version 7.0
# Built-in smoke test: no Pester dependency required.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$source = Join-Path $root 'data/devices.sample.json'
$script = Join-Path $root 'scripts/Get-EndpointComplianceReport.ps1'
$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.IO.Path]::GetRandomFileName())
$null = New-Item -Path $tempDir -ItemType Directory -Force
$report = Join-Path $tempDir 'report.csv'
try {
    & $script -InventoryPath $source -ReportPath $report
    if (-not (Test-Path -LiteralPath $report -PathType Leaf)) { throw 'Report was not created.' }
    $rows = @(Import-Csv -LiteralPath $report)
    if ($rows.Count -ne 5) { throw "Expected 5 devices, received $($rows.Count)." }
    $compliant = @($rows | Where-Object ComplianceStatus -eq 'Compliant').Count
    $nonCompliant = @($rows | Where-Object ComplianceStatus -eq 'NonCompliant').Count
    if ($compliant -ne 2 -or $nonCompliant -ne 3) {
        throw "Expected 2/3 compliant/noncompliant, got $compliant/$nonCompliant."
    }
    $device = $rows | Where-Object DeviceName -eq 'LAB-PC-03' | Select-Object -First 1
    if ($null -eq $device -or $device.Findings -notmatch 'BitLocker disabled') {
        throw 'Expected BitLocker finding on LAB-PC-03.'
    }
    Write-Host 'PASS: all smoke tests completed.'
}
finally {
    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}
