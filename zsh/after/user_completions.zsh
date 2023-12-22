user_completions_root=$HOME/.zsh/completions
[ -d "$user_completions_root" ] || mkdir -p "$user_completions_root"

fpath=($user_completions_root $fpath)
unset user_completions_root
