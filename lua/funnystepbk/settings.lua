require('luasnip.loaders.from_vscode').lazy_load()

-- Configure bamboo.nvim
require('bamboo').setup {
   -- optional configuration here
}
require('bamboo').load()

-- Function to set custom highlight groups for LSP diagnostics
local function setup_lsp_diagnostics_highlight()
  vim.cmd [[
    highlight! DiagnosticError guifg=#FF0000 gui=bold
    highlight! DiagnosticWarn guifg=#FFA500 gui=bold
    highlight! DiagnosticInfo guifg=#00FFFF gui=bold
    highlight! DiagnosticHint guifg=#00FF00 gui=bold
  ]]
end

vim.g['airline#extensions#branch#enabled'] = 1  -- Enable branch display

-- Customize sections
vim.g['airline#extensions#default#section_a'] = 'a'
vim.g['airline#extensions#default#section_b'] = 'b'
vim.g['airline#extensions#default#section_c'] = 'c'

-- Customize tabline
vim.g['airline#extensions#tabline#max_count'] = 20  -- Max tab count to display
vim.g['airline#extensions#tabline#show_tabs'] = 1  -- Show tabs
vim.g['airline#extensions#tabline#tab_nr_type'] = 1  -- Show tab numbers

-- Set background transparency
vim.cmd [[
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE
hi Visual guibg=NONE ctermbg=NONE
hi CursorLine guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
]]

-- Call the function to set the highlight groups
setup_lsp_diagnostics_highlight()

-- Set Python host for Neovim
vim.g.python3_host_prog = '~/myenv/bin/python3.12'
