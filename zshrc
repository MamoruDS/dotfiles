unset zle_bracketed_paste
fc -R

_zsh_cfgdir="$HOME/.zsh"

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

[ "$TERM" = "xterm" ] && export TERM="xterm-256color"
export PATH=$HOME/.scripts:$PATH

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.env.sh ] && . ~/.env.sh
