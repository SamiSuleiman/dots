# ls aliases
alias ll='ls -alF'
alias c="clear"
alias h="history -10" # last 10 history commands
alias hc="history -c" # clear history
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"
alias ls="exa --icons --group-directories-first"
alias cat='bat'
alias grep='grep --color=always'

alias lll='nnn -deH'
alias hhh='export HISTTIMEFORMAT="%F %T "; history | fzf | cut -d" " -f2- | bash'
alias ccc='cd "$(dirname "$(find . -type f | fzf)")"'
alias vif='nvim $(fzf)'
alias pif='kill $(ps -ef | fzf | awk '\''{print $2}'\'')'
alias gbf='git checkout $(git branch | fzf)'
alias cdf='cd $(find * -type d | fzf)'

# more aliases
alias code='codium --profile=void-city'
alias vim='nvim'
alias myip="curl http://ipecho.net/plain; echo"

# situational, should probably find a way to do this like a normal human aka not a fucking retard
# alias nvim='nvim.appimage'
