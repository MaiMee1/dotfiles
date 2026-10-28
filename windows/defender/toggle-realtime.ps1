<#
.SYNOPSIS
    Turn Microsoft Defender real-time protection off or on.

.DESCRIPTION
    For big installs or builds where Defender gets in the way. With -Minutes,
    a one-shot scheduled task turns protection back on automatically, so it
    is never left off by accident.

    Tamper Protection must be off (Windows Security > Virus & threat
    protection > Manage settings) or Windows silently ignores the change.

.EXAMPLE
    .\toggle-realtime.ps1 -Status
.EXAMPLE
    .\toggle-realtime.ps1 -Off -Minutes 30
.EXAMPLE
    .\toggle-realtime.ps1 -On
#>
#Requires -RunAsAdministrator

[CmdletBinding(DefaultParameterSetName = 'Status')]
param(
    [Parameter(ParameterSetName = 'Off', Mandatory)][switch]$Off,
    [Parameter(ParameterSetName = 'Off')][ValidateRange(1, 1440)][int]$Minutes,
    [Parameter(ParameterSetName = 'On', Mandatory)][switch]$On,
    [Parameter(ParameterSetName = 'Status')][switch]$Status
)

$taskName = 'dotfiles-defender-realtime-on'

function Show-Status {
    $s = Get-MpComputerStatus
    Write-Host "Real-time protection: $(if ($s.RealTimeProtectionEnabled) { 'ON' } else { 'OFF' })"
    Write-Host "Tamper protection:    $(if ($s.IsTamperProtected) { 'ON' } else { 'OFF' })"
    if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
        $at = (Get-ScheduledTask -TaskName $taskName).Triggers[0].StartBoundary
        Write-Host "Auto re-enable at:    $at"
    }
}

if ($PSCmdlet.ParameterSetName -eq 'Status') {
    Show-Status
    return
}

if ((Get-MpComputerStatus).IsTamperProtected) {
    Write-Error ('Tamper Protection is on, so Windows will ignore this change. ' +
        'Turn it off in Windows Security > Virus & threat protection > Manage settings, then re-run.')
    exit 1
}

Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction SilentlyContinue

if ($On) {
    Set-MpPreference -DisableRealtimeMonitoring $false
} else {
    Set-MpPreference -DisableRealtimeMonitoring $true
    if ($Minutes) {
        $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument (
            '-NoProfile -NonInteractive -Command "Set-MpPreference -DisableRealtimeMonitoring $false; ' +
            "Unregister-ScheduledTask -TaskName $taskName -Confirm:`$false`"")
        $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes($Minutes)
        $principal = New-ScheduledTaskPrincipal -UserId 'SYSTEM' -RunLevel Highest
        Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal | Out-Null
    } else {
        Write-Warning 'Real-time protection stays off until you run: .\toggle-realtime.ps1 -On'
    }
}

Show-Status
