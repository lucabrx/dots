# Fish shell configuration

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

# Colors
set fish_color_command green
set fish_color_param normal
set fish_color_error red
set fish_color_normal normal

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias vim='nvim'
alias c='clear'
alias update='sudo pacman -Syu'
alias weather='curl wttr.in'
alias gitlog='git log --oneline --graph --decorate --all'

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
    echo -n "🐠 "
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

# Starship prompt (optional, comment out if you prefer the custom prompt above)
# starship init fish | source

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
