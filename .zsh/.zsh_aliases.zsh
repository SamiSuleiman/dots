alias c="clear"
alias h="history -10" # last 10 history commands
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"
alias tp="trash-put"
alias tpr="trash-restore"
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias lt="exa -T"
alias l="exa -l"
alias cat='bat'
alias grep='grep --color=always'

# TMUX
alias tn='tmux new-session -s'
alias t='tmux new-session -A -s'
alias tls='tmux ls'
alias tk='tmux kill-session -t'
alias ta='tmux attach-session -d'
alias tr='function _tmux_rename_session() { tmux rename-session -t $1 $2 }; _tmux_rename_session'

# ytdl
alias ytdl='yt-dlp'

alias nvim='TERM=xterm-kitty nvim'
alias vim='nvim'
alias v='nvim'
alias myip="curl http://ipecho.net/plain; echo"

alias code='codium'
