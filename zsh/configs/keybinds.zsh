# > showkey -a
# > printf '%q => %q\n' "${(@kv)key}"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e # using emacs mode; https://wiki.archlinux.org/title/Zsh#Key_bindings

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# TODO:
if [ "$(uname)" = "Darwin" ]; then
    # bindkey -- "${terminfo[khome]}" beginning-of-line
    bindkey "^[[H" beginning-of-line
    # bindkey -- "${terminfo[kend]}" end-of-line
    bindkey "^[[F" end-of-line
    bindkey "^[[A" up-line-or-beginning-search
    bindkey "^[[B" down-line-or-beginning-search
else
    [ -n "$key[Home]" ] && bindkey -- "$key[Home]" beginning-of-line
    [ -n "$key[End]" ] && bindkey -- "$key[End]" end-of-line
    [ -n "$key[Up]" ] && bindkey -- "$key[Up]" up-line-or-beginning-search
    [ -n "$key[Down]" ] && bindkey -- "$key[Down]" down-line-or-beginning-search
fi
