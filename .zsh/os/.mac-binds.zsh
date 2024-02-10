# substring plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# navigating/editing line with arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5B" backward-kill-word
bindkey "^[b" end-of-line
bindkey "^[f" beginning-of-line
bindkey "^[[1;3B" backward-kill-line