{{#if (is_executable "fzf")}}
zinit light Aloxaf/fzf-tab
# zinit light joshskidmore/zsh-fzf-history-search
zinit ice ver"multiline"
zinit light MamoruDS/zsh-fzf-history-search

{{/if}}
{{#if (eq zsh_theme "spaceship")}}
zinit light spaceship-prompt/spaceship-prompt

{{/if}}
zinit light zdharma-continuum/fast-syntax-highlighting

{{#if (eq zsh_plugin_autosuggestions 1)}}
zinit light zsh-users/zsh-autosuggestions

{{/if}}