# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                                        
# Color definitions
export COLOR_RED='\033[0;31m'
export COLOR_GREEN='\033[0;32m'
export COLOR_YELLOW='\033[0;33m'
export COLOR_BLUE='\033[0;34m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_CYAN='\033[0;36m'
export COLOR_RESET='\033[0m'

# ==============================
# Environment Variables
# ==============================
export ZSH="$HOME/.oh-my-zsh"
. "$HOME/.cargo/env"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# ==============================
# Zinit Installation and Plugins
# ==============================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Oh-My-Zsh plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# ==============================
# Completion and Key Bindings
# ==============================
autoload -Uz compinit && compinit
zinit cdreplay -q

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ==============================
# History Configuration
# ==============================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ==============================
# Completion Styling
# ==============================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ==============================
# Aliases
# ==============================
alias ls='ls --color'
alias ll='ls -lah'
alias vim='nvim'
alias c='clear'
alias update='sudo pacman -Syu'  # For Arch-based systems
alias weather='curl wttr.in'
alias gitlog='git log --oneline --graph --decorate --all'

# ==============================
# External Tool Configurations
# ==============================
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# ==============================
# Final Configurations
# ==============================
source $ZSH/oh-my-zsh.sh

# Print a welcome message
fastfetch
echo ""
echo -e "${COLOR_CYAN}Welcome back, ${USER}!${COLOR_RESET}"
echo ""
