# {{#if (eq dark_mode 1)}}
theme_name={{zsh_plugin_fsh_theme_dark}}
# {{else}}
theme_name={{zsh_plugin_fsh_theme_light}}
# {{/if}}
if [ ! -n "$(fast-theme -s | grep "${${theme_name##*/}%.*}")" ]; then
    fast-theme "$theme_name"
fi
