{{#if (eq zsh_theme "oh-my-posh")}}
init_oh_my_posh() {
    local config_fp=${XDG_CONFIG_HOME:-$HOME/.config/oh-my-posh/default.toml}
    eval "$(oh-my-posh init zsh --config $config_fp)"
}

init_oh_my_posh
unset -f init_oh_my_posh
{{/if}}
{{#if (eq zsh_theme "starship")}}
init_starship() {
    if [ ! "$STARSHIP_SHELL" = "zsh" ] || [ -z "$_DOTFILES_RELOADING" ] ; then
        eval "$(starship init zsh)"
    fi
    if [ -z "$TMUX" ] && [ -z "$ZELLIJ" ] && [ ! "$TERM_PROGRAM" = "vscode" ]; then
        export STARSHIP_CONFIG=~/.config/starship/default.toml
    else
        export STARSHIP_CONFIG=~/.config/starship/less.toml
    fi
}

if [ ! -x "$(command -v starship)" ]; then
    echo "[DOTFILES] starship not found, installing..."
    curl -sS https://starship.rs/install.sh | sh
fi

init_starship
unset -f init_starship
{{/if}}
{{#if (eq zsh_theme "spaceship")}}
ZSH_THEME="spaceship"
{{/if}}
