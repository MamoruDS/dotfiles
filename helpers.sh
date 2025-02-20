if [ -x "$(command -v bash)" ] && [ -x "$(command -v curl)" ]; then
    color_test() {
        curl -fsSL https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw | bash -
    }

    color_test24() {
        curl -fsSL https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash -
    }
fi

if [ -x "$(command -v tmux)" ]; then
    ta() {
        local session="${1:-1}"
        tmux attach -t "$session" 2>/dev/null || tmux new -s "$session" -n 0
    }
fi
