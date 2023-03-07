vim.opt.termguicolors = true

local plugin_root = vim.fn.stdpath("data") .. "/site/pack/packer/start/"
local plugins = {
    'github-nvim-theme',
}
for _, plugin in ipairs(plugins) do
    vim.o.runtimepath = vim.o.runtimepath .. ',' .. plugin_root .. plugin .. '/'
end

require("github-theme").setup({
    {{#if (eq nvim_background "dark")}}
    theme_style = "dark_default",
    {{/if}}
    {{#if (eq nvim_background "light")}}
    theme_style = "light",
    {{/if}}
    function_style = "italic",
    transparent = true,
})
