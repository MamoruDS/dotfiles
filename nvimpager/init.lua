vim.opt.termguicolors = true

local plugin_root = vim.fn.stdpath("data") .. "/../nvim/lazy/"
local plugins = {
  "github-nvim-theme",
}
for _, plugin in ipairs(plugins) do
  vim.o.runtimepath = vim.o.runtimepath .. "," .. plugin_root .. plugin .. "/"
end

require("github-theme").setup({
  options = {
    styles = {
      functions = "italic",
    },
    transparent = true,
  },
})

vim.cmd([[
{{#if (eq dark_mode 1)}}
    colorscheme github_dark_tritanopia
{{else}}
    colorscheme github_light
{{/if}}
]])
