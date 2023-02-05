unset zle_bracketed_paste
fc -R

_zsh_cfgdir="$HOME/.zsh"

update_dotfiles() {
    if [ ! -x "$(command -v dotter2)" ] && [ ! -x "$DOTTER_BIN" ] ; then
        echo 'dotter not in your PATH, you can use env `DOTTER_BIN` to specify it'
        return 1
    fi
    local dotter_bin="${DOTTER_BIN:-dotter2}"
    local root="${DOTFILES_ROOT:-~/.dotfiles}"
    local local_toml="${DOTFILES_LOCAL:-$root/.dotter/local.toml}"
    if [ -d "$root" ]; then
        if [ ! -f "$local_toml" ]; then
            echo 'local.toml not found, you can use env `DOTFILES_LOCAL` to specify one'
            return 1
        fi
        (
            cd "$root" \
            && (if [ -z "$DOTFILES_IGNORE_REMOTE" ]; then git pull ; fi) \
            && $dotter_bin -v -l "$local_toml"
        )
    else
        echo 'root if dotfiles not found, you can use env `DOTFILES_ROOT` to specify it'
        return 1
    fi
    echo '[DOTFILES] done.'
}

_source_configs() {
    _dir="$1"
    for config in "$_dir"/**/*.zsh(N-.); do
        . $config
    done
}

_source_configs "$_zsh_cfgdir/configs"

if [ -d "$_zsh_cfgdir/plugins" ]; then
    . "$_zsh_cfgdir/plugins/zinit.zsh"
    . "$_zsh_cfgdir/plugins/plugins.zsh"
    _source_configs "$_zsh_cfgdir/plugins/configs"
fi

_source_configs "$_zsh_cfgdir/after"

[ "$TERM" = "xterm" ] && export TERM="xterm-256color"
export PATH=$HOME/.scripts:$PATH

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.env.sh ] && . ~/.env.sh
