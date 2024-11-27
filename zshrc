unset zle_bracketed_paste

#

update-dotfiles() {
    local dotter_bin
    if [ -n "$DOTTER_BIN" ]; then
        if [ ! -x "$DOTTER_BIN" ]; then
            echo '[DOTFILES] `DOTTER_BIN` is not executable, check your dotter installation'
            return 1
        fi
        dotter_bin=$DOTTER_BIN
    elif [ -x "$(command -v dotter)" ] ; then
        dotter_bin=dotter
    else
        echo '[DOTFILES] dotter not in your PATH, you can use env `DOTTER_BIN` to specify it'
        return 1
    fi
    local root=${DOTFILES_ROOT:-~/.dotfiles}
    local local_toml=${DOTFILES_LOCAL:-$root/.dotter/local.toml}
    if [ -d "$root" ]; then
        if [ ! -f "$local_toml" ]; then
            echo '[DOTFILES] local.toml not found, you can use env `DOTFILES_LOCAL` to specify one'
            return 1
        fi
        (
            cd "$root" \
            && (if [ -z "$DOTFILES_IGNORE_REMOTE" ]; then _cur=$(git rev-parse --short=7 HEAD) && git pull --recurse-submodules && git --no-pager log --oneline --reverse $_cur..HEAD ; fi) \
            && (if [ "$1" = "-f" ]; then $dotter_bin -vf -l "$local_toml" ; else $dotter_bin -v -l "$local_toml"; fi )
        )
    else
        echo '[DOTFILES] root if dotfiles not found, you can use env `DOTFILES_ROOT` to specify it'
        return 1
    fi
    echo '[DOTFILES] done.'
}

#

_source_configs() {
    local root="$1"
    local config
    for config in "$root"/**/*.zsh(N-.); do
        . "$config"
    done
}

_zsh_cfgdir="$HOME/.zsh"

_source_configs "$_zsh_cfgdir/configs"

if [ -d "$_zsh_cfgdir/plugins" ]; then
    . "$_zsh_cfgdir/plugins/zinit.zsh"
    . "$_zsh_cfgdir/plugins/plugins.zsh"
    _source_configs "$_zsh_cfgdir/plugins/configs"
fi

_source_configs "$_zsh_cfgdir/after"

unset _source_configs _zsh_cfgdir

#

[ "$TERM" = "xterm" ] && export TERM="xterm-256color"
export PATH=$HOME/.scripts:$PATH

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.env.sh ] && . ~/.env.sh

#

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
