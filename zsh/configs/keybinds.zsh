# > showkey -a
# > printf '%q => %q\n' "${(@kv)key}"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# keybind_helper() {
#     local mode=$1
#     local key=$2
#     local action=$3
#     [[ "$mode" = *"v"* ]] && bindkey -v $key $action
#     [[ "$mode" = *"e"* ]] && bindkey -e $key $action
#     [[ "$mode" = *"a"* ]] && bindkey -a $key $action
# }
# unset -f keybind_helper

bindkey -e "\e[1;5C" forward-word
bindkey -e "\e[1;5D" backward-word

[ -n "$key[Home]" ] && bindkey -e -- "$key[Home]" beginning-of-line
bindkey -e "\e[H" beginning-of-line

[ -n "$key[End]" ] && bindkey -e -- "$key[End]" end-of-line
bindkey -e "\e[F" end-of-line

[ -n "$key[Up]" ] && bindkey -e -- "$key[Up]" up-line-or-beginning-search
bindkey -e "\e[A" up-line-or-beginning-search
bindkey -e "\eOA" up-line-or-beginning-search

[ -n "$key[Down]" ] && bindkey -e -- "$key[Down]" down-line-or-beginning-search
bindkey -e "\eOB" down-line-or-beginning-search
bindkey -e "\e[B" down-line-or-beginning-search
