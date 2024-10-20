if [ -x "$(command -v fzf)" ]; then
    zinit light Aloxaf/fzf-tab
fi

{{#if (eq zsh_theme "spaceship")}}
zinit light spaceship-prompt/spaceship-prompt

{{/if}}
{{#if (eq zsh_vi 1)}}
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

{{/if}}
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light MamoruDS/zsh-history-fuzzy-search

{{#if (eq zsh_plugin_autosuggestions 1)}}
zinit light zsh-users/zsh-autosuggestions

{{/if}}

# completion - conda
zinit light conda-incubator/conda-zsh-completion
