# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -z "${XDG_CACHE_HOME:-$HOME}/.config/nnn/pluging" ]]; then
   echo "Downloading nnn plugins"
   sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
else
   echo "nnn plugins already downloaded"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

bold=$(tput bold)
normal=$(tput sgr0)

# History in cache directory:
HISTFILE=~/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Get git stuff idk
git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{green}'
    fi
    echo "${gitstatuscolor}[${ref}]"
  else
    echo ""
  fi
}

# this works well (alternative to the next PROMPT, way simpler, no git)
# PROMPT='%9c $(git_branch_test_color)%F{none} %# '
# # add 24h time the right side
# RPROMPT='%D{%k:%M:%S}'

# allow function calls in $PROMPT
setopt PROMPT_SUBST

PROMPT='%F{yellow}%n@%m %F{blue}[%~]$(git_branch_test_color)%F{none} %F${bold}> %F{reset}'

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

# Load Angular CLI autocompletion.
source <(ng completion script)

# Plugins
source  ${ZDOTDIR:-$HOME}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source  ${ZDOTDIR:-$HOME}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source  ${ZDOTDIR:-$HOME}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# not neccessary, kinda gimmicky
# source  ${ZDOTDIR:-$HOME}/plugins/k/k.zsh

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    source ${ZDOTDIR:-$HOME}/os/.mac-binds.zsh

elif command -v apt > /dev/null; then
    source ${ZDOTDIR:-$HOME}/os/.linux-binds.zsh

else
    echo 'Unknown OS!'
fi

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# source ~/powerlevel10k/powerlevel10k.zsh-theme
source ${ZDOTDIR:-$HOME}/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/plugins/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/plugins/.p10k.zsh

# disabling highlight on paste 
zle_bracketed_paste=()

RED='\033[0;31m'
NC='\033[0m' # No Color
# function precmd() {
#     # Print a newline before the prompt, unless it's the
#     # first prompt in the process.
#     if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
#         NEW_LINE_BEFORE_PROMPT=1
#     elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
#         printf "${RED}ℓℓℓ${NC}\n"
#     fi
# }

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'


# newsboat stuff
# newsboat -i ~/.config/newsboat/urls.opml
setup_cron_job() {
    local cron_cmd="0 * * * * $HOME/.config/newsboat/reload_feeds.sh> /dev/null 2>&1 < /dev/null &"

    # Check if the cron job already exists
    if ! crontab -l | grep -qF "$cron_cmd"; then
        # Add the cron job
        (crontab -l ; echo "$cron_cmd") | crontab -
        echo "Cron job added successfully."
    else
        echo "Cron job already exists."
    fi
}
setup_cron_job
