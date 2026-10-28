# Defender control

Keep Microsoft Defender on, but stop it from slowing down dev work. Both scripts need an elevated PowerShell.

| Script | What it does |
| --- | --- |
| `set-exclusions.ps1` | Excludes the source root (`D:\src` by default) and package caches (fnm, pnpm, uv, Go modules) from real-time scanning. Safe to re-run. `-WhatIf` previews; `-Remove` undoes. |
| `toggle-realtime.ps1` | `-Off [-Minutes N]`, `-On`, `-Status`. With `-Minutes`, a one-shot scheduled task turns protection back on. |

## Tradeoff

Excluded folders are not scanned when files are written, so anything cloned or downloaded into them isn't checked by real-time protection. Scheduled scans still cover them. Keep downloads out of excluded paths.

`toggle-realtime.ps1` only works with **Tamper Protection off** (Windows Security > Virus & threat protection > Manage settings). Windows ignores the change otherwise, and the script refuses to run. Prefer `-Minutes` so protection can't be left off by accident.
