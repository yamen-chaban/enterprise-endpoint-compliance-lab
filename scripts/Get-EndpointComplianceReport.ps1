#requires -Version 7.0
<#
.SYNOPSIS
    Generates a synthetic Windows endpoint security baseline report.
.DESCRIPTION
    Reads a JSON inventory and writes a compliance CSV. This does not call
    Microsoft Intune or inspect real machines. Demo baseline only.
.EXAMPLE
    ./scripts/Get-EndpointComplianceReport.ps1 -InventoryPath ./data/devices.sample.json -ReportPath ./output/compliance-report.csv
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InventoryPath,
    [Parameter(Mandatory = $true)]
    [string]$ReportPath,
    [ValidateRange(1, 999999)]
    [int]$MinimumWindowsBuild = 22631
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $InventoryPath -PathType Leaf)) {
    throw "Inventory file not found: $InventoryPath"
}
$inventory = Get-Content -LiteralPath $InventoryPath -Raw -Encoding UTF8 | ConvertFrom-Json
if ($null -eq $inventory -or $null -eq $inventory.devices) {
    throw "Inventory JSON must contain a 'devices' array."
}
$devices = @($inventory.devices)
if ($devices.Count -eq 0) { throw 'Inventory must contain at least one device.' }
$requiredProperties = @('deviceName', 'osBuild', 'bitlockerEnabled', 'defenderEnabled', 'firewallEnabled')
$seen = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
$rows = @(
    foreach ($device in $devices) {
        foreach ($property in $requiredProperties) {
            if ($device.PSObject.Properties.Name -notcontains $property -or $null -eq $device.$property) {
                throw "Device entry is missing required property: $property"
            }
        }
        $deviceName = [string]$device.deviceName
        if ([string]::IsNullOrWhiteSpace($deviceName)) { throw 'deviceName cannot be empty.' }
        if (-not $seen.Add($deviceName)) { throw "Duplicate deviceName: $deviceName" }
        $osBuild = [int]$device.osBuild
        $issues = [System.Collections.Generic.List[string]]::new()
        if ($osBuild -lt $MinimumWindowsBuild) { $issues.Add("OS build below baseline ($MinimumWindowsBuild)") }
        if ($device.bitlockerEnabled -ne $true) { $issues.Add('BitLocker disabled') }
        if ($device.defenderEnabled -ne $true) { $issues.Add('Defender disabled') }
        if ($device.firewallEnabled -ne $true) { $issues.Add('Firewall disabled') }
        [pscustomobject]@{
            DeviceName = $deviceName
            OSBuild = $osBuild
            BitLockerEnabled = [bool]$device.bitlockerEnabled
            DefenderEnabled = [bool]$device.defenderEnabled
            FirewallEnabled = [bool]$device.firewallEnabled
            ComplianceStatus = if ($issues.Count -eq 0) { 'Compliant' } else { 'NonCompliant' }
            Findings = if ($issues.Count -eq 0) { 'No baseline findings' } else { $issues -join '; ' }
        }
    }
)
$parent = Split-Path -Path $ReportPath -Parent
if (-not [string]::IsNullOrWhiteSpace($parent) -and -not (Test-Path -LiteralPath $parent)) {
    New-Item -Path $parent -ItemType Directory -Force | Out-Null
}
$rows | Export-Csv -LiteralPath $ReportPath -NoTypeInformation -Encoding UTF8
$passed = @($rows | Where-Object ComplianceStatus -eq 'Compliant').Count
$failed = $rows.Count - $passed
Write-Host "Analyzed: $($rows.Count); Compliant: $passed; NonCompliant: $failed"
Write-Host "CSV report: $ReportPath"
