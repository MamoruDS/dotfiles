{{#if (eq zsh_theme "starship")}}
if [ -x "$(command -v starship)" ]; then
    eval "$(starship init zsh)"
    if [ -z "$TMUX" -a ! "$TERM_PROGRAM" = "vscode" ]; then
        export STARSHIP_CONFIG=~/.config/starship/default.toml
    else
        export STARSHIP_CONFIG=~/.config/starship/less.toml
    fi
else
    echo "[DOTFILES] starship not found, installing..."
    curl -sS https://starship.rs/install.sh | sh
fi
{{/if}}
{{#if (eq zsh_theme "spaceship")}}
ZSH_THEME="spaceship"
{{/if}}
