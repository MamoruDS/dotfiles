if [ -x "$(command -v fzf)" ]; then
    zinit light Aloxaf/fzf-tab
fi

{{#if (eq zsh_theme "spaceship")}}
zinit light spaceship-prompt/spaceship-prompt

{{/if}}
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light MamoruDS/zsh-history-fuzzy-search

{{#if (eq zsh_plugin_autosuggestions 1)}}
zinit light zsh-users/zsh-autosuggestions

{{/if}}