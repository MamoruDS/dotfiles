# {{#if dotter.packages.zsh}}
if [ ! -f ~/.zshrc ]; then
    echo "[ -f ~/.zshrc.dot ] && . ~/.zshrc.dot" > ~/.zshrc
fi
# {{/if}}
