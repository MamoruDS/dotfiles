{{#if (eq zsh_plugin_fzf_history_search_preview 1)}}
# src=~/.local/share/zinit/plugins/joshskidmore---zsh-fzf-history-search/zsh-fzf-history-search.zsh
src=~/.local/share/zinit/plugins/MamoruDS---zsh-fzf-history-search/zsh-fzf-history-search.zsh
if [ -f $src ]; then
    if [ "$(uname)" = "Darwin" ]; then
        sed -i .bak "s/FZF_EXTRA_ARGS} -q/FZF_EXTRA_ARGS} --preview 'format-history-z {}' -q/" $src
    else
        sed -i "s/FZF_EXTRA_ARGS} -q/FZF_EXTRA_ARGS} --preview 'format-history-z {}' -q/" $src
    fi
    ZSH_FZF_HISTORY_SEARCH_FZF_ARGS='+s +m -x -e'
    ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS='--preview-window=down:30%'
fi
{{/if}}
ZSH_FZF_HISTORY_SEARCH_END_OF_LINE=1
ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0
ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=1
