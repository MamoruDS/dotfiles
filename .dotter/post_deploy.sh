# {{#if dotter.packages.zsh}}
CONFIG_DIR=${ZDOTDIR:-$HOME}
if [ ! -f $CONFIG_DIR/.zshrc ]; then
    echo "[ -f ~/.zshrc.dot ] && . ~/.zshrc.dot" > $CONFIG_DIR/.zshrc
    if [ -n "$DOTTER_BIN_DIR" ]; then
        echo "DOTTER_BIN_DIR=$DOTTER_BIN_DIR" >> $CONFIG_DIR/.zshrc
    fi
    if [ -n "$DOTFILES_ROOT" ]; then
        echo "DOTFILES_ROOT=$DOTFILES_ROOT" >> $CONFIG_DIR/.zshrc
    fi
    if [ -n "$DOTFILES_LOCAL" ]; then
        echo "DOTFILES_LOCAL=$DOTFILES_LOCAL" >> $CONFIG_DIR/.zshrc
    fi
fi
# {{/if}}
