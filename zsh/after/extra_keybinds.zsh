# emacs bindings

bindkey -M emacs "${ZSH_HISTORY_FUZZY_SEARCH_BIND:-"^r"}" zsh-history-fuzzy-search

# vi bindings

if typeset -f zvm_bindkey > /dev/null; then
    # zsh-vi-mode: Custom widgets and keybindings
    # https://github.com/jeffreytse/zsh-vi-mode#custom-widgets-and-keybindings
    function zvm_after_init() {
        zvm_bindkey viins '\e[A' up-line-or-beginning-search
        zvm_bindkey viins '\eOA' up-line-or-beginning-search
        zvm_bindkey viins '\e[B' down-line-or-beginning-search
        zvm_bindkey viins '\eOB' down-line-or-beginning-search
        #
        zvm_bindkey viins "${ZSH_HISTORY_FUZZY_SEARCH_BIND:-"^r"}" zsh-history-fuzzy-search
    }
    # TODO: buffer access
    function zvm_after_lazy_keybindings() {
        zvm_bindkey vicmd '\e[A' up-line-or-beginning-search
        zvm_bindkey vicmd '\eOA' up-line-or-beginning-search
        zvm_bindkey vicmd '\e[B' down-line-or-beginning-search
        zvm_bindkey vicmd '\eOB' down-line-or-beginning-search
        #
        zvm_bindkey vicmd '/' zsh-history-fuzzy-search
    }
else
    bindkey -M viins "${ZSH_HISTORY_FUZZY_SEARCH_BIND:-"^r"}" zsh-history-fuzzy-search
    bindkey -M vicmd "/" zsh-history-fuzzy-search
fi 
