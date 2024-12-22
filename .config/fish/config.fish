
# Environment Variables
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -gx PATH $JAVA_HOME/bin $PATH
set -gx NVM_DIR "$HOME/.nvm"
set -gx PATH "$HOME/.local/bin" $PATH
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools
set -gx PATH "$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Colors
set fish_color_command green
set fish_color_param normal
set fish_color_error red
set fish_color_normal normal

# Aliases
alias ls='eza --group-directories-first --icons'
alias ll='eza -lah --group-directories-first --icons'
alias lt='eza -laT --group-directories-first --icons'  # Tree listing
alias lg='eza -lah --group-directories-first --icons --git'  # Show Git status

alias vim='nvim'
alias c='clear'
alias gitlog='git log --oneline --graph --decorate --all'
alias ports='netstat -tulanp'
alias fishconfig='vim ~/.config/fish/config.fish'
alias reloadfish='source ~/.config/fish/config.fish'
alias h='history'
alias hg='history | grep'

# Docker aliases 
alias d='docker'
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dps='docker ps'

# HTTPie
alias h='time http'
alias hp='time http POST'
alias hd='time http DELETE'
alias hpa='time http PATCH'

# SSH aliases
alias vemeet-ssh='ssh -i ~/.ssh/vemeet luka@vemeet.me'
alias valu-ssh='ssh -i ~/.ssh/netcup-else root@valu-media.com'

## asus 
alias pq='asusctl profile -P quiet'
alias pp='asusctl profile -P performance'
alias pb='asusctl profile -P balanced'
alias pc='asusctl profile -p'

# because of hyprland ( if using 1.25)
# alias code='code -enable-features=WaylandWindowDecorations -ozone-platform-hint=auto '

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Prompt
function fish_prompt
    set_color brblue
    echo -n "🐧"
    set_color normal
    echo -n (prompt_pwd)
    set_color yellow
    printf '%s ' (__fish_git_prompt)
    set_color normal
    echo -n '> '
end

# FZF
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# Zoxide
zoxide init fish | source

starship init fish | source

# SSH agent
eval (ssh-agent -c)
ssh-add ~/.ssh/id_ed25519

# Print welcome message
fastfetch
echo ""
set_color cyan
echo "Welcome back, $USER!"
set_color normal
echo ""


function cd
    if count $argv > /dev/null
        z $argv
    else
        z
    end
end



