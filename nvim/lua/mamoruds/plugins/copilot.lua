vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

local keyset = vim.keymap.set

keyset(
    "i",
    "<C-t>",
    'copilot#Accept("\\<CR>")',
    {
        silent = true,
        expr = true,
    }
)
