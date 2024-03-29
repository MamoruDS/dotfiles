#!/usr/bin/env sh

info() {
    printf '%s\n' " > $*"
}

warn() {
    printf '%s\n' " ! $*"
}

error() {
    printf '%s\n' " x $*" >&2
}

test_writeable() {
    _fp="$1/.test.dotfiles"
    if touch "$_fp" 2> /dev/null; then
        rm "$_fp"
        return 0
    else
        return 1
    fi
}

get_valid_path() {
    _path_eval='echo '"$1"''
    echo "$(eval $_path_eval)"
}

get_dotter_bin_dir() {
    if [ -n "$DOTTER_BIN_DIR" ]; then
        info "use user defined DOTTER_BIN_DIR: $DOTTER_BIN_DIR"
        return 0
    fi
    _default_dotter_bin_dir='/usr/local/bin'
    printf "enter the install dir for dotter ($_default_dotter_bin_dir): \n"
    read dotter_bin_dir
    DOTTER_BIN_DIR=$(get_valid_path ${dotter_bin_dir:-$_default_dotter_bin_dir})
}

get_dotfiles_root() {
    if [ -n "$DOTFILES_ROOT" ]; then
        info "use user defined DOTFILES_ROOT: $DOTFILES_ROOT"
        return 0
    fi
    _default_dotfiles_root=~/.dotfiles
    printf "enter the root of dotfiles ($_default_dotfiles_root): \n"
    read dotfiles_root
    DOTFILES_ROOT=$(get_valid_path ${dotfiles_root:-$_default_dotfiles_root})
}

get_dotfiles_local() {
    if [ -n "$DOTFILES_LOCAL" ]; then
        info "use user defined DOTFILES_LOCAL: $DOTFILES_LOCAL"
        return 0
    fi
    _default_dotfiles_local=$DOTFILES_ROOT/.dotter/local.toml
    printf "enter the path of local configuration ($_default_dotfiles_local): \n"
    read dotfiles_local
    DOTFILES_LOCAL=$(get_valid_path ${dotfiles_local:-$_default_dotfiles_local})
}

parse_packages() {
    _packages=$(echo $@ | tr -d ' ')
    if [ ! -z $_packages ]; then
        echo "$_packages" | tr ',' '\n' | while read _item; do
            printf \"$_item\",
        done
    fi
}

get_packages() {
    _default_dotfiles_packages='tmux,zsh' # TODO
    if [ -n "$DOTFILES_PACKAGES" ]; then
        info "use user defined DOTFILES_PACKAGES: $DOTFILES_PACKAGES"
        if [ -n "$(echo $DOTFILES_PACKAGES | grep '^,' 2> /dev/null)" ]; then
            DOTFILES_PACKAGES="${_default_dotfiles_packages}${DOTFILES_PACKAGES}"
        fi
        return 0
    fi
    DOTFILES_PACKAGES=${DOTFILES_PACKAGES:-$_default_dotfiles_packages}
}

try_install_dotter() {
    _dotter_dl_dir=/tmp
    local dotter_release_url
    if [ "$(uname -s)" = 'Linux' ]; then
        case "$(uname -m)" in
            'x86_64')
                dotter_release_url='https://github.com/SuperCuber/dotter/releases/latest/download/dotter-linux-x64-musl'
                ;;
            'aarch64')
                dotter_release_url='https://github.com/SuperCuber/dotter/releases/latest/download/dotter-linux-arm64-musl'
                ;;
        esac
    elif [ "$(uname -s)" = 'Darwin' ]; then
        case "$(uname -m)" in
            'arm64')
                dotter_release_url='https://github.com/SuperCuber/dotter/releases/latest/download/dotter-macos-arm64.arm'
                ;;
        esac 
    fi
    if [ -n "$dotter_release_url" ]; then
        # set DOTTER_BIN_DIR
        get_dotter_bin_dir
        info "downloading dotter from github release"
        curl -L $dotter_release_url -o $_dotter_dl_dir/dotter
        chmod +x $_dotter_dl_dir/dotter
        info "installing dotter to $DOTTER_BIN_DIR"
        [ ! -d "$DOTTER_BIN_DIR" ] && (mkdir -p "$DOTTER_BIN_DIR" 2> /dev/null )
        if test_writeable "$DOTTER_BIN_DIR"; then
            mv $_dotter_dl_dir/dotter "$DOTTER_BIN_DIR"
        else
            warn "permission is required to install dotter to $DOTTER_BIN_DIR"
            sudo mv $_dotter_dl_dir/dotter "$DOTTER_BIN_DIR"
        fi
    else
        error "unsupported platform $(uname -s) $(uname -m), please rerun this script after installing dotter manually, see https://github.com/SuperCuber/dotter#others"
        exit 1
    fi
}

clone_repo() {
    _repo="$1"
    _dir="$2"
    if [ -d "$_dir" ]; then
        warn "$_dir already exists, skip cloning"
        return 0
    else
        git clone -q "$_repo" "$_dir"
    fi
}

generate_preset_local() {
    _local_fp="$1"

    if [ ! -d "$(dirname $_local_fp)" ]; then
        mkdir -p "$(dirname $_local_fp)"
    fi

    if [ -f "$_local_fp" ]; then
        warn "$_local_fp already exists, skip generating"
        return 0
    fi
    
    cat << EOF > $_local_fp
packages = [$(parse_packages $DOTFILES_PACKAGES)]

# checkout all variables in https://github.com/MamoruDS/dotfiles/blob/main/.dotter/global.toml
# [variables]

EOF
    info "add the following lines to your ~/.zshrc"
    echo ''
    echo "[ -f ~/.zshrc.dot ] && . ~/.zshrc.dot"
    if [ ! -x $(command -v dotter) ]; then
    echo ''
    echo "DOTTER_BIN=$DOTTER_BIN"
    fi
    if [ ! "$(realpath $DOTFILES_ROOT)" = "$(realpath ~/.dotfiles)" ]; then
    echo "DOTFILES_ROOT=$DOTFILES_ROOT"
    fi
    if [ ! "$(realpath $DOTFILES_LOCAL)" = "$(realpath $DOTFILES_ROOT/.dotter/local.toml)" ]; then
    echo "DOTFILES_LOCAL=$DOTFILES_LOCAL"
    fi
    echo ''
}

check_requirements() {
    _missing=""

    if [ ! -x "$(command -v curl)" ]; then
        _missing="$_missing curl"
    fi

    if [ ! -x "$(command -v git)" ]; then
        _missing="$_missing git"
    fi

    if [ -x "$(command -v dotter)" ]; then
        DOTTER_BIN=$(command -v dotter)
    elif [ -n "$DOTTER_BIN" ]; then
        if [ ! -x "$DOTTER_BIN" ]; then
            error '$DOTTER_BIN is not executable'
            _missing="$_missing dotter"
        fi
    else
        info "trying to install dotter"
        
        try_install_dotter
        DOTTER_BIN="$DOTTER_BIN_DIR/dotter"
    fi
}

check_requirements

# set DOTFILES_ROOT
get_dotfiles_root

# set DOTFILES_LOCAL
get_dotfiles_local

# set DOTFILES_PACKAGES
get_packages

(
    info 'cloning dotfiles from remote' && \
    clone_repo https://github.com/MamoruDS/dotfiles.git $DOTFILES_ROOT && \
    generate_preset_local "$DOTFILES_LOCAL" && \
    cd "$DOTFILES_ROOT" && \
    info 'deloying dotfiles' && \
    $DOTTER_BIN -v -l $DOTFILES_LOCAL
)
