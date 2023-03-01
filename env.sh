#!/usr/bin/env sh

if [ -x "$(command -v vim)" ]; then
    export EDITOR=vim
fi

if [ -x "$(command -v nvim)" ]; then
    export EDITOR=nvim
fi

if [ -x "$(command -v bat)" ]; then
    export PAGER=bat
fi

if [ -x "$(command -v nvimpager)" ]; then
    export PAGER=nvimpager
fi

if [ -x "$(command -v gpg)" ] ||  [ -x "$(command -v gpg2)" ]; then
    export GPG_TTY=$(tty)
fi
