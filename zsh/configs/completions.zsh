autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# https://unix.stackexchange.com/a/258661
autoload -U select-word-style
select-word-style bash

_comp_options+=(globdots)
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' sort false
zstyle ':completion:*' file-sort access

# only show directories when completing with ls(and its aliases)
zstyle ':completion:*:ls:*'  file-patterns '*(/):directories'
zstyle ':completion:*:exa:*' file-patterns '*(/):directories'
