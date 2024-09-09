git_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    git_status=$(git status --porcelain 2>/dev/null)
    changes=""

    [[ -n $(echo "$git_status" | grep '^\?\?') ]] && changes+="?"
    [[ -n $(echo "$git_status" | grep '^ M') ]] && changes+="+"
    [[ -n $(echo "$git_status" | grep '^A') ]] && changes+="*"

    echo "($branch$changes)"
  fi
}

HISTFILE=~/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

setopt PROMPT_SUBST

## import aliases if file exists
if [ -f $ZDOTDIR/.zsh_aliases.zsh ]; then
    . $ZDOTDIR/.zsh_aliases.zsh
fi

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

unsetopt menu_complete
unsetopt flowcontrol
setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt no_list_ambiguous

unsetopt LIST_BEEP
unsetopt HIST_BEEP
unsetopt BEEP

source  ${ZDOTDIR:-$HOME}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source  ${ZDOTDIR:-$HOME}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source  ${ZDOTDIR:-$HOME}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

source ${ZDOTDIR:-$HOME}/.binds.zsh

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# disabling highlight on paste 
zle_bracketed_paste=()


autoload -U colors && colors


# PS1='%B%{$fg[white]%}[%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[white]%}]%{$fg[cyan]%}$(git_info)%{$reset_color%}$%b '
PROMPT='%B%{$fg[white]%}[%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[white]%}]%{$fg[cyan]%}$(git_info)%{$reset_color%}%b 
$ '

eval "$(zoxide init zsh)"
