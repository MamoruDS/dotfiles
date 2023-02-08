-- default global extensions
vim.g.coc_global_extensions = {
    'coc-git',
    'coc-json',
    'coc-lists',
    'coc-sh',
    'coc-vimlsp',
    'coc-yaml',
}
{{#if nvim_coc_config_home}}

-- default coc-settings.json under `~/.config/nvim` will handled by dotter
vim.g.coc_config_home = "{{nvim_coc_config_home}}"
{{/if}}

-- TODO: for dark only
vim.cmd([[
    hi CocFloating              guibg=#0d1117
    hi CocNotificationProgress  guifg=#58a6ff
]])

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false,
}
keyset("i", "<TAB>",
       'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
       opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics
keyset("n", "<space>m", ":<C-u>CocList diagnostics<cr>", opts)
keyset("n", "<space>x", ":<C-u>CocList extensions<cr>", opts)
keyset("n", "<space>p", ":<C-u>CocList commands<cr>", opts)
keyset("n", "<space>f", ":<C-u>CocList files<cr>", opts)
