vim.opt.termguicolors = true

vim.api.nvim_exec(
    'set runtimepath+=~/.local/share/nvim/site/pack/packer/start/github-nvim-theme/',
    true)

require("github-theme").setup({
    theme_style = "dark_default",
    function_style = "italic",
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    transparent = true,
})
