bindkey -e # using emacs mode; https://wiki.archlinux.org/title/Zsh#Key_bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# TODO:
# bindkey -- "${terminfo[khome]}" beginning-of-line
bindkey "^[[H" beginning-of-line
# bindkey -- "${terminfo[kend]}" end-of-line
bindkey "^[[F" end-of-line
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
