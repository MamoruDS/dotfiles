theme_name={{zsh_plugin_fsh_theme}}
if [ ! -n "$(fast-theme -s | grep "${${theme_name##*/}%.*}")" ]; then
    fast-theme {{zsh_plugin_fsh_theme}}
fi
