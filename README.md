# dotfiles

Config
- `.editorconfig`?
- visual studio code user settings
- git settings (branch, features, crlf)
- terminal startup profiles
  - `$PROFILE` on Windows
  - `.zprofile` for zsh
  - `.bashrc` for linux

### \*

**Install**
- [ ] Git
- [ ] Visual Studio Code
  - [ ] "Open with Code" context menu
  - [ ] Add "code" to PATH
- [ ] JetBrains Toolbox
- [ ] GitHub Desktop
- Browsers
  - [ ] Google Chrome
    -  [ ] Google Password Manager / 1Password
- Package Managers
- Languages
  - [ ] Python 3
  - [ ] Node
    - [ ] corepack enable pnpm
  - [ ] Go
  - [ ] gcc?

**Set Up**
- [ ] SSH keys
- [ ] (optional) GPG key
- [ ] git config --global user.name
- [ ] git config --global user.email
- [ ] `src` folder

### Work

**Install**
- [ ] Zoom Workplace
- [ ] Microsoft Teams
- [ ] Google Chat
- [ ] Colima (docker)

### Personal

**Install**
- [ ] Docker Desktop
- [ ] qBitTorrent
- [ ] Blender
- [ ] Discord
- [ ] Burp Suite

#### Windows

**Install**
- [ ] Adobe Ps, Ai, Lr, Ae, Pr, DC
- [ ] Revit, 3D Civil, Lumion
- [ ] 3dsMax, Maya
- [ ] Tor?
- **TODO:** some VPN?
- [ ] CPU-Z, HWMonitor
- [ ] WinDirStat
- [ ] WinRAR

**Set Up**
- [ ] WSL
- [ ] Terminal (if old Windows)

### MacOS

- Git
  - type 'git' in Terminal, install dev tools
- Visual Studio Code
  - Install for all users
  - Open Command Pallete (Command + Shift + P) -> Install "code" command in PATH
  - `git config --global core.editor "code --wait"`

### TO BE UPDATED

- [\[oh-my-posh\]](https://ohmyposh.dev/docs)
  - Fonts
  - `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussel.omp.json" | Invoke-Expression`
<!--  -->
- [] (game dev)
  - Unity? Unreal? Visual Studio workloads
  - Blender / [Maya, Mudbox/ZBrush]

Do:
- ✅ Use [JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/) instead of individual installers
- ✅ Use one version of Visual Studio: Community Edition
- ✅ Create shortcut for Visual Studio installer instead of Visual Studio directly
- ✅ Use Chrome profiles for logged in accounts

Things to init:
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
