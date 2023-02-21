{{#if (is_executable "fzf")}}
zinit light Aloxaf/fzf-tab

{{/if}}
{{#if (eq zsh_theme "spaceship")}}
zinit light spaceship-prompt/spaceship-prompt

{{/if}}
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light MamoruDS/zsh-history-fuzzy-search

{{#if (eq zsh_plugin_autosuggestions 1)}}
zinit light zsh-users/zsh-autosuggestions

{{/if}}