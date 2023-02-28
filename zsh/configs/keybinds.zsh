# > showkey -a
# > printf '%q => %q\n' "${(@kv)key}"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e # using emacs mode

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

[ -n "$key[Home]" ] && bindkey -- "$key[Home]" beginning-of-line
bindkey "\e[H" beginning-of-line

[ -n "$key[End]" ] && bindkey -- "$key[End]" end-of-line
bindkey "\e[F" end-of-line

[ -n "$key[Up]" ] && bindkey -- "$key[Up]" up-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search

[ -n "$key[Down]" ] && bindkey -- "$key[Down]" down-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search
