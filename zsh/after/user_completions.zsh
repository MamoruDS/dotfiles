user_completions_root=$HOME/.zsh/completions

if [ ! -d "$user_completions_root" ]; then
    mkdir -p "$user_completions_root"
fi

fpath=($user_completions_root $fpath)
