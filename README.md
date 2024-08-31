# dotfiles

Config
- `.editorconfig`?
- visual studio code user settings
- git settings (branch, features, crlf)
- terminal startup profiles
  - `$PROFILE` on Windows
  - `.zprofile` for zsh
  - `.bashrc` for linux

### Windows

Things to install:
- visual studio code
  - "Open with Code" context menu
- `git`
  - pre: visual studio code
    - `git config --global core.editor "code --wait"`
- `docker` (docker desktop)
  - pre: WSL
- `node`
  - pre: python3
  - pre: visual studio (C++ workload)
- GitHub Desktop
- Web Browsers
  - Chrome
  - \[Firefox\]
- [\[oh-my-posh\]](https://ohmyposh.dev/docs)
  - Fonts
  - `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussel.omp.json" | Invoke-Expression`
- Database viewers
  - MongoDB Compass? (if using MongoDB)
  - DataGrip is great✨, ~~but no license 🙁~~, yes license.
<!--  -->
- [] (if using Java)
  - IntelliJ
  - Java SDKs?
- [] (if using a lot of Python)
  - PyCharm
  - better package manager?
<!--  -->
- [] (game dev)
  - Unity? Unreal? Visual Studio workloads
  - Blender / [Maya, Mudbox/ZBrush]
<!--  -->
- [] (personal)
  - Adobe Ps, Ai, Lr, Ae, Pr, DC
  - Revit, Lumion, 3dsMax, Maya
  - Blender
  - qBitTorrent
  - Tor?
  - **TODO:** some VPN?
  - Discord
  - CPU-Z, HWMonitor
  - WinDirStat
  - WinRAR, UltraISO

Do:
- ✅ Use [JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/) instead of individual installers
- ✅ Use one version of Visual Studio: Community Edition
- ✅ Create shortcut for Visual Studio installer instead of Visual Studio directly
- ✅ Use Chrome profiles for logged in accounts

Things to init:
- ssh keys
- \[gpg key]
<!--  -->
- path limit
- [ExecutionPolicy](scripts/executionPolicy.ps1)
- User Account Control settings
<!--  -->
- Maybe remove bloatware?
- Startup Services
  - Remove docker desktop
  - Remove bloatware
- Windows Terminal
  - Set as default
- Explorer
  - Show file extensions, hidden files, and checkboxes
- Disable Windows Defender
- Disable AI
