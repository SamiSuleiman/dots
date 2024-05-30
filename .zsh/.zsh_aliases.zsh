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


# ytdl
alias ytdl='yt-dlp'

alias nvim='TERM=xterm-kitty nvim'
alias vim='nvim'
alias v='nvim'
alias myip="curl http://ipecho.net/plain; echo"

# quick edit
# notes alias to open env var $NOTES_DIR in nvim

alias notes='nvim $NOTES_DIR'

# situational, should probably find a way to do this like a normal human aka not a fucking retard
# alias nvim='nvim.appimage'
