# dotfiles

## Install

This repository using [dotter](https://github.com/SuperCuber/dotter#installation) to manage dotfiles.

-   Install dotter:

    ```shell
    cargo install dotter
    ```

    or install from github [release](https://github.com/SuperCuber/dotter/releases)

-   Clone this repository to any directory:

    ```shell
    git clone git@github.com:MamoruDS/dotfiles.git
    ```

-   Deploy with dotter:
    [config](https://github.com/SuperCuber/dotter/wiki/Setup-and-Configuration) your local file in `.dotter/local.toml`

    ```toml
    # an example of local.toml
    # valid packages and variables can be found in .dotter/global.toml
    packages = ["zsh", "tmux"]

    [files]
    zshrc = "~/.zshrc.dot"

    [variables]
    use_nerdfont = 1 # if you have nerdfont installed
    zsh_plugin_fzf_history_search_preview = 1
    ```

    and using `dotter` to deploy dotfiles.

    ```
    cd dotfiles
    dotter -v
    ```

### Requirements

-   [fzf](https://github.com/junegunn/fzf#installation)
    for using zsh's plugins [fzf-tab](https://github.com/Aloxaf/fzf-tab) and [zsh-fzf-history-search](https://github.com/joshskidmore/zsh-fzf-history-search)
-   [file](https://www.darwinsys.com/file/)
    for using preview utils in [fzf-tab](https://github.com/Aloxaf/fzf-tab)

-   [tpm](https://github.com/tmux-plugins/tpm) is required for using package `tmux` with plugins (disabled by default)

    ```shell
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

    and enable plugins for `tmux` package in your dotter local config

    ```toml
    # in your local.toml
    ...
    [variables]
    ...
    tmux_using_plugins = 1
    ...
    ```

-   [packer](https://github.com/wbthomason/packer.nvim#quickstart) is required for using package `nvim`

    ```shell
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```
