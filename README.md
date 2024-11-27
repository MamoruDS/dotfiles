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
    git clone --recursive git@github.com:MamoruDS/dotfiles.git
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
    zsh_plugin_autosuggestions = 1
    ```

    and using `dotter` to deploy dotfiles.

    ```
    cd dotfiles
    dotter -v
    ```

### Requirements

-   [fzf](https://github.com/junegunn/fzf#installation) or [skim](https://github.com/lotabout/skim) is required for using `zsh`'s plugin [zsh-history-fuzzy-search](https://github.com/MamoruDS/zsh-history-fuzzy-search)
-   [fzf](https://github.com/junegunn/fzf#installation)
    is required for using `zsh`'s plugin [fzf-tab](https://github.com/Aloxaf/fzf-tab)
-   [file](https://www.darwinsys.com/file/)
    for using preview utils in [fzf-tab](https://github.com/Aloxaf/fzf-tab)

-   [tpm](https://github.com/tmux-plugins/tpm) is required for using package `tmux` with plugins (disabled by default)

    ```shell
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

    and enable plugins for `tmux` package in your dotter local config

    ```toml
    # in your local.toml
    [variables]
    tmux_using_plugins = 1
    ```

## Usage

If you have installed the dotfiles with package `zsh`, you can easily keep your dotfiles up-to-date using the update-dotfiles function. This function searches for the root of your dotfiles repository at `~/.dotfiles`, and looks for the local config toml file at `~/.dotfiles/.dotter/local.toml`. However, you can customize these locations using environment variables specific to your setup, as follows:

```shell
# specific path of your dotter binary; default: dotter
DOTTER_BIN=~/bin/dotter

# root of dotfiles repo; default: ~/.dotfiles
DOTFILES_ROOT=~/dotfiles

# location of the local config; default: $DOTFILES_ROOT/.dotter/local.toml
DOTFILES_LOCAL=~/.dot.local.toml

# update dotfiles without pull from remote; default:
DOTFILES_IGNORE_REMOTE=1
```

To use the update function, simply run it from your shell:

```shell
update-dotfiles
# or with force; equivalent dotter -f
update-dotfiles -f
```
