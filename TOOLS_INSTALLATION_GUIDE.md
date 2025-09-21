# CLI Tools Installation Guide

This document lists all the CLI tools and applications I use, organized by installation method. Use this when setting up a new development environment.

## Package Managers to Install First

### 1. Homebrew (macOS Package Manager)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. pipx (Python Application Installer)
```bash
brew install pipx
pipx ensurepath
```

### 3. Node Version Manager (nvm)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# Restart terminal, then:
nvm install node  # installs latest node
```

## Essential CLI Tools (Homebrew Formulas)

### Shell & Terminal Enhancement
```bash
# Modern shell prompt
brew install starship

# Better cd command with smart jumping
brew install zoxide

# Fuzzy finder (essential for many workflows)
brew install fzf

# Better ls with colors and icons
brew install lsd

# Syntax highlighting for cat
brew install bat

# Better grep with colors
brew install ripgrep

# File finder (better than find)
brew install fd
```

### Text Editors & Development
```bash
# Modern text editor
brew install neovim

# Git delta for better diffs
brew install git-delta

# Lazy git TUI
brew install lazygit

# Terminal multiplexer
brew install tmux

# Code statistics
brew install cloc

# Better diff tool
brew install difftastic

# JSON processor
brew install jq

# Markdown viewer in terminal
brew install glow
```

### Programming Languages & Tools
```bash
# Go programming language
brew install go

# Redis database
brew install redis

# PostgreSQL client tools
brew install libpq

# Terraform for infrastructure
brew install terraform

# Parallel command execution
brew install parallel

# System information
brew install neofetch

# Screen resolution utility
brew install screenresolution

# File watching
brew install watchman
```

### Work-Specific Tools
```bash
# Atlassian CLI
brew install acli

# Atlas CLI (Atlassian internal)
brew install atlas-cli

# AWS CLI
brew install awscli

# Docker Compose
brew install docker-compose

# CSV manipulation
brew install csvkit

# Governator CLI (Atlassian internal)
brew install governator-cli
```

## Applications (Homebrew Casks)

```bash
# Window manager (tiling)
brew install --cask aerospace

# Audio control
brew install --cask background-music

# Docker Desktop
brew install --cask docker

# Terminal emulator
brew install --cask ghostty

# Menu bar meeting info
brew install --cask meetingbar
```

## Python Applications (pipx)

```bash
# Atlassian VPN client
pipx install atlassian-vpn

# Python dependency management
pipx install poetry
```

## Manual Installations

### 1. fzf-tab (zsh plugin)
```bash
mkdir -p ~/tools
cd ~/tools
git clone https://github.com/Aloxaf/fzf-tab.git
# Then add to .zshrc: source ~/tools/fzf-tab/fzf-tab.plugin.zsh
```

### 2. Orbit CLI (if needed)
```bash
# Download from internal Atlassian tools
# Will be available at ~/.orbit/bin/orbit
```

## Configuration Steps After Installation

### 1. Shell Setup
```bash
# Add to shell PATH in .zshrc:
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/Users/$(whoami)/.orbit/bin:$PATH"
export PATH="$PATH:/Users/$(whoami)/.local/bin"

# Initialize tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
source <(fzf --zsh)
```

### 2. Git Configuration
```bash
# Set up git delta for better diffs
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default
```

### 3. Node.js Setup
```bash
# Install latest Node.js via nvm
nvm install node
nvm use node
nvm alias default node
```

## Verification Commands

After installation, verify everything works:

```bash
# Test essential tools
starship --version
zoxide --version
fzf --version
lsd --version
bat --version
nvim --version
rg --version

# Test work tools
acli --version
atlas --version
aws --version

# Test Python tools
pipx list
cisco --version
poetry --version

# Test Node.js
node --version
npm --version
```

## Notes

- **Aerospace**: Window manager configured via `~/.config/aerospace/aerospace.toml`
- **Starship**: Prompt configured via `~/.config/starship.toml`
- **fzf-tab**: Must be cloned manually to `~/tools/` directory
- **Orbit**: Internal Atlassian tool, may need special installation steps
- **VPN**: `cisco` command is from atlassian-vpn package via pipx

## Aliases Used

The following aliases are defined in `.zshrc`:
- `ls` → `lsd` (better ls)
- `search` → fzf with bat preview
- `ginv` → global file search and edit with nvim
- `inv` → local file search and edit with nvim
- Various git shortcuts (`gs`, `ga`, `gc`, etc.)
- `vpn` → Cisco VPN connection
- `rovo` → Atlassian CLI shortcut

## Post-Setup

After installing everything:
1. Clone this dotfiles repo to `~/.config`
2. Create symlinks: `ln -sf ~/.config/.zshrc ~/.zshrc`
3. Restart terminal
4. Test that all tools work with the verification commands above