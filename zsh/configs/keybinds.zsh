# > showkey -a
# > printf '%q => %q\n' "${(@kv)key}"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

{{#if (ne zsh_vi 1)}}
bindkey -M emacs "\e[1;5C" forward-word
bindkey -M emacs "\e[1;5D" backward-word

[ -n "$key[Home]" ] && bindkey -M emacs -- "$key[Home]" beginning-of-line
bindkey -M emacs "\e[H" beginning-of-line

[ -n "$key[End]" ] && bindkey -M emacs -- "$key[End]" end-of-line
bindkey -M emacs "\e[F" end-of-line

[ -n "$key[Up]" ] && bindkey -M emacs -- "$key[Up]" up-line-or-beginning-search
bindkey -M emacs "\e[A" up-line-or-beginning-search
bindkey -M emacs "\eOA" up-line-or-beginning-search

[ -n "$key[Down]" ] && bindkey -M emacs -- "$key[Down]" down-line-or-beginning-search
bindkey -M emacs "\eOB" down-line-or-beginning-search
bindkey -M emacs "\e[B" down-line-or-beginning-search

bindkey -e
{{/if}}
