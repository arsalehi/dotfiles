eval "$(zoxide init zsh --cmd cd)" # "Faster" cd 
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    # echo "Load starship"
    eval "$(/usr/local/bin/starship init zsh)"
  }
# try vi mode in terminal
# set -o vi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Created by `pipx` on 2024-05-17 00:59:04
export PATH="$PATH:/Users/asalehi/.local/bin"

# fzf-tab config (replace default tab completion)
autoload -U compinit; compinit
source ~/tools/fzf-tab.plugin.zsh
# ALIASES

# Use `lsd` over ls by default: https://github.com/lsd-rs/lsd
alias ls="lsd"
alias oldls="\ls"

# Alias for connecting to VPN via CLI
alias vpn='cisco connect --server "US West1 N.California (managed)" --close'

# Alias for developing atlas sre cli
alias sredev="atlas atlasdev exec -b ~/dev/psre/sre-atlas-cli-plugin/bin/darwin-arm64/sre --"

# Alias for running local srew cli
alias lsrew="go run ~/dev/psre/sre-tooling/cli/srew"

# Alias for running atlas monarch next-gen
alias amon="atlas monarch-nextgen"

# fzf tools 
alias search='fzf --preview="bat --color=always {}"'
alias search_all='fzf --walker-root=$HOME --preview="bat --color=always {}"'
alias ginv='nvim $(fzf -m --walker-root=$HOME --preview="bat --color=always {}")'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

# git aliases
alias gb='git branch'
alias gcb='git checkout -b'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gcom='git commit -m'
alias gamend='git commit --amend'
alias gp='git pull'
alias gpp='git push'


export PATH="/Users/asalehi/.orbit/bin:$PATH"

# PSQL
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias rovo="acli rovodev run"

# Increasing history 
HISTSIZE=25000
SAVEHIST=50000

setopt HIST_IGNORE_ALL_DUPS
setopt APPEND_HISTORY

