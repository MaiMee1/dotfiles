# dotfiles

Machine setup for Windows (main), macOS and Linux. Apps come from [winget](https://learn.microsoft.com/windows/package-manager/) configuration files; dotfiles are managed by [chezmoi](https://www.chezmoi.io/) from [`home/`](home).

## Windows bootstrap

1. Allow local scripts for your user: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` (see [scripts/executionPolicy.ps1](scripts/executionPolicy.ps1)).
2. Install apps:
   ```powershell
   winget configure -f windows\winget\configuration.dsc.yaml
   winget configure -f windows\winget\personal.dsc.yaml   # optional; trim first
   ```
3. Apply dotfiles. This asks for git name/email and a personal/work profile once:
   ```powershell
   chezmoi init --apply MaiMee1
   ```
4. Node via fnm: `fnm install --lts`, then `corepack enable pnpm`.
5. Optional Defender exclusions and a real-time toggle: see [windows/defender](windows/defender).

## What chezmoi manages

| Source | Target |
| --- | --- |
| `home/dot_gitconfig.tmpl` | `~/.gitconfig` (identity from chezmoi data) |
| `home/Documents/*/Microsoft.PowerShell_profile.ps1.tmpl` | PowerShell 7 and Windows PowerShell profiles (fnm, oh-my-posh). Windows only. |
| `home/private_dot_ssh/config` | `~/.ssh/config`. Keys are not tracked; see [docs/ssh-keygen.md](docs/ssh-keygen.md). |

Edit with `chezmoi edit <file>` or in this repo, then `chezmoi apply`. Pull updates with `chezmoi update`.

## Manual steps

**Every machine**
- [ ] SSH key ([docs/ssh-keygen.md](docs/ssh-keygen.md))
- [ ] (optional) GPG key
- [ ] `src` folder: `<drive>\src\github.com\<owner>\<repo>`
- [ ] Chrome profiles per logged-in account; password manager

**Windows**
- [ ] Visual Studio workloads in the VS Installer (pin the Installer, not VS itself)
- [ ] Windows Terminal: set as default terminal, PowerShell 7 as default profile, a Nerd Font
- [ ] Explorer: show file extensions, hidden files and item checkboxes
- [ ] Enable long paths (`HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\LongPathsEnabled = 1`)
- [ ] User Account Control level
- [ ] Startup apps: remove Docker Desktop and bloatware
- [ ] WSL distro: `wsl --install -d Ubuntu`
- [ ] Not on winget / licensed: Adobe (Ps, Ai, Lr, Ae, Pr, DC), Revit, Civil 3D, Lumion, 3ds Max, Maya

**Work machines**
- [ ] Zoom, Microsoft Teams, Google Chat
- [ ] Colima instead of Docker Desktop (macOS)

## macOS

- Git: run `git` in Terminal to install the developer tools.
- VS Code: Command Palette > "Shell Command: Install 'code' command in PATH".
- chezmoi: `brew install chezmoi && chezmoi init --apply MaiMee1`
- TODO: Brewfile for apps (`brew bundle`).

## Ideas

- Track `~/.claude` (settings, CLAUDE.md, skills) with chezmoi.
- Game dev: Unity/Unreal, VS game workloads, ZBrush/Mudbox.
