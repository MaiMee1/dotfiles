<#
.SYNOPSIS
    Exclude dev folders from Microsoft Defender real-time scanning.

.DESCRIPTION
    Builds, installs and git operations touch thousands of small files, and
    real-time scanning of each one is the main source of slowdowns. This adds
    path exclusions for source and package-cache folders only. Existing
    exclusions are left alone; re-running is safe.

.PARAMETER SrcRoot
    Root of the source workspace. Defaults to D:\src.

.PARAMETER Remove
    Remove these exclusions instead of adding them.

.EXAMPLE
    .\set-exclusions.ps1 -WhatIf
.EXAMPLE
    .\set-exclusions.ps1 -SrcRoot C:\src
#>
#Requires -RunAsAdministrator

[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$SrcRoot = 'D:\src',
    [switch]$Remove
)

$paths = @(
    $SrcRoot
    $(if ($env:FNM_DIR) { $env:FNM_DIR } else { Join-Path $env:APPDATA 'fnm' })
    Join-Path $env:LOCALAPPDATA 'fnm_multishells'
    Join-Path $env:LOCALAPPDATA 'pnpm'
    Join-Path $env:LOCALAPPDATA 'uv'
)
if (Get-Command go -ErrorAction SilentlyContinue) {
    $paths += (go env GOMODCACHE)
}

$existing = @((Get-MpPreference).ExclusionPath)

foreach ($path in $paths | Where-Object { $_ } | Select-Object -Unique) {
    $present = $existing -contains $path
    if ($Remove) {
        if ($present -and $PSCmdlet.ShouldProcess($path, 'Remove Defender exclusion')) {
            Remove-MpPreference -ExclusionPath $path
            Write-Host "Removed  $path"
        }
    } elseif ($present) {
        Write-Host "Exists   $path"
    } elseif ($PSCmdlet.ShouldProcess($path, 'Add Defender exclusion')) {
        Add-MpPreference -ExclusionPath $path
        Write-Host "Added    $path"
    }
}
