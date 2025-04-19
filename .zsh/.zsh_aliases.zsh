alias c="clear"
alias h="history -10" # last 10 history commands
alias cp="cp -iv"
alias mv="mv -iv"
# alias rm="rm -vI"
alias rm="trash-put"
alias bc="bc -ql"
alias mkd="mkdir -pv"
alias tp="trash-put"
alias tpr="trash-restore"
alias ls="exa -F --icons"
alias ll="exa -lF --icons"
alias la="exa -laF --icons"
alias lt="exa -TF --icons"
alias l="exa -lF --icons"
alias cat='bat'
alias grep='grep --color=always'

# TMUX
alias tn='tmux new-session -s'
alias t='tmux new-session -A -s'
alias tls='tmux ls'
alias tk='tmux kill-session -t'
alias ta='tmux attach-session -d'
alias tr='tmux rename-session -t'

# ytdl
alias ytdl='yt-dlp'

alias vim='nvim'
alias v='nvim'
alias myip="curl http://ipecho.net/plain; echo"

alias code='codium'

# fzf
alias fcd='cd $(find . -type d | fzf)'
fhist(){
  local chosen_command=$(cat ~/.zsh/.zsh_history | cut -d';' -f 2 | fzf --tac)
  eval $chosen_command
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
