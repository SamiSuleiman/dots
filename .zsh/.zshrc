bold=$(tput bold)
normal=$(tput sgr0)

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

source <(ng completion script)

source  ${ZDOTDIR:-$HOME}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source  ${ZDOTDIR:-$HOME}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source  ${ZDOTDIR:-$HOME}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

if [[ $(uname) == "Darwin" ]]; then
    source ${ZDOTDIR:-$HOME}/os/.mac-binds.zsh

elif command -v pacman > /dev/null; then
    source ${ZDOTDIR:-$HOME}/os/.linux-binds.zsh

else
    echo 'Unknown OS!'
fi

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# disabling highlight on paste 
zle_bracketed_paste=()

RED='\033[0;31m'
NC='\033[0m' # No Color

eval "$(starship init zsh)"
