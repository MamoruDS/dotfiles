vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.g.copilot_filetypes = {
    ['*'] = false,
    sh = true,
    bash = true,
    zsh = true,
    lua = true,
    python = true,
    ruby = true,
    rust = true,
    javascript = true,
    typescript = true,
}

local keyset = vim.keymap.set

keyset(
    "i",
    "<C-t>",
    "copilot#Accept('<CR>')",
    {
        noremap = true,
        silent = true,
        expr = true,
        replace_keycodes = false,
    }
)
