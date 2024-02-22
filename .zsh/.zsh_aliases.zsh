alias ll='ls -alF'
alias c="clear"
alias h="history -10" # last 10 history commands
alias hc="history -c" # clear history
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"
alias tp="trash-put"
alias tpr="trash-restore"
# alias lf="lfcd"
alias ls="eza --icons --group-directories-first"
alias cat='bat'
alias grep='grep --color=always'


# TMUX
#
## Create a new tmux session
alias tn='tmux new-session -s'
## Start or attach to a tmux session
alias t='tmux new-session -A -s'
## List tmux sessions
alias tls='tmux ls'
# Kill a tmux session
alias tk='tmux kill-session -t'
# Attach to the last used session
alias ta='tmux attach-session -d'
# Rename a tmux session
alias tr='function _tmux_rename_session() { tmux rename-session -t $1 $2 }; _tmux_rename_session'

# NERD
alias lll='nnn -deH'
alias ccc='cd "$(dirname "$(find . -type f | fzf)")"'
alias vif='nvim $(fzf --hidden)'
alias pif='kill $(ps -ef | fzf | awk '\''{print $2}'\'')'
alias gbf='git checkout $(git branch | fzf)'

# APPS
alias nb='newsboat'

# ytdl
alias ytdl='yt-dlp'

# Define a function to open an editor with optional profile flag
open_editor() {
    # Check if codium command exists
    if command -v codium &>/dev/null; then
        codium --profile=tanaka "$@"
    # Check if code command exists
    elif command -v code &>/dev/null; then
        code --profile=tanaka "$@"
    # Check if nvim command exists
    elif command -v nvim &>/dev/null; then
        nvim "$@"
    # If none of the above commands exist, use vim as fallback
    else
        vim "$@"
    fi
}

# Create an alias for the function
alias editor=open_editor

alias vim='nvim'
alias v='nvim'
alias myip="curl http://ipecho.net/plain; echo"

# situational, should probably find a way to do this like a normal human aka not a fucking retard
# alias nvim='nvim.appimage'
