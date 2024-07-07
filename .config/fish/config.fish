set -q XDG_CACHE_HOME; or set -xg XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME; or set -xg XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -xg XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -xg XDG_STATE_HOME $HOME/.local/state

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/pnpm

alias y="yazi"

alias c="clear"
alias v="nvim"
alias tn="tmux new-session -s"
alias t="tmux new-session -A -s"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias ta="tmux attach-session -d"

alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias lt="exa -T"
alias l="exa -l"

alias fv=" command nvim (fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window=right:70%:wrap --bind 'ctrl-o:execute(nvim {})+abort')"

alias ytdl="yt-dlp"

alias fhist="eval (history | fzf)"
alias fopen="open (fd | fzf)"
alias ftldr="tldr (tldr --list | fzf)"
function fgitadd
    set files (git ls-files --modified --others --exclude-standard | fzf -m)
    and git add $files
end
function fgitswitch
    set branch (git branch --all | fzf)
    and git switch (echo $branch | sed 's:remotes/[^/]*/::')
end
function fcd
    set dir (find . -type d -not -path '*/node_modules/*' | fzf)
    and z $dir
end
function fdockerlogs
    set container (docker ps --format "{{.ID}}: {{.Names}}" | fzf | awk -F: '{print $1}')
    and docker logs -f $container
end
function fdockersh
    set container (docker ps --format "{{.ID}}: {{.Names}}" | fzf | awk -F: '{print $1}')
    and docker exec -it $container sh
end

alias bookmarks="nb search \"bookmark.md\" --all --list"
alias todos="nb search \"todo.md\" --all --list"

set -gx EDITOR nvim
set -gx LSCOLORS ExGxBxDxCxEgEdxbxgxcxd

set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cc kill-whole-line repaint
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block

set -gx GOPATH $XDG_DATA_HOME/go

set -gx LF_ICONS "\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

oh-my-posh init fish --config ~/.config/ohmyposh/base.toml | source
zoxide init fish | source

# if status is-interactive
#     eval (zellij setup --generate-auto-start fish | string collect)
# end

# pnpm
set -gx PNPM_HOME "/home/sami/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

