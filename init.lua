require('funnystepbk')

vim.cmd('filetype plugin indent on')
-- Enable filetype plugins and indentation

-- Set cursor styles for different modes with normal blinking
vim.opt.guicursor = 'n-v-c-i:block-blinkon3'

--vim.cmd('colorscheme oceanicnext')
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])

-- Set a light background color for selected text
vim.cmd [[
  highlight Visual guibg=#171717 guifg=NONE
  highlight VisualNOS guibg=#171717 guifg=NONE
]]

-- Disable cursorline by default
vim.o.cursorline = false

-- Enable cursorline conditionally for the file tree buffer
vim.cmd [[
  augroup FileTreeCursorLine
    autocmd!
    autocmd BufEnter * if &buftype == 'nofile' && expand('%:p') ==# getcwd().'/' | setlocal cursorline | endif
    autocmd BufLeave * if &buftype == 'nofile' && expand('%:p') ==# getcwd().'/' | setlocal nocursorline | endif
  augroup END
]]

-- Set cursorline highlight group
vim.cmd [[
  highlight CursorLine guibg=#3b4252
  highlight CursorLineNr guifg=#81a1c1
]]

