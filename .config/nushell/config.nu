alias c = clear
alias cp = cp -iv
alias mv = mv -iv
alias rm = rm -vI
alias bc = bc -ql
alias cat = bat
alias grep = grep --color=always

# TMUX
alias tn = tmux new-session -s
alias t = tmux new-session -A -s
alias tls = tmux ls
alias tk = tmux kill-session -t
alias ta = tmux attach-session -d
alias tr = tmux rename-session -t

# ytdl
alias ytdl = yt-dlp

alias vim = nvim
alias v = nvim
alias myip = curl http://ipecho.net/plain; echo

alias code = codium


source ~/.cache/carapace/init.nu
use ~/.config/nushell/fnm.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ~/.zoxide.nu
