{{#if (is_executable "fzf")}}
# https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab
# https://github.com/joshskidmore/zsh-fzf-history-search
zinit light joshskidmore/zsh-fzf-history-search
{{/if}}

{{#if (eq zsh_theme "spaceship")}}
# https://github.com/spaceship-prompt/spaceship-prompt
zinit light spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"
{{/if}}

# https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
