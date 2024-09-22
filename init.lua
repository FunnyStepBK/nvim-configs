require('funnystepbk')

vim.cmd('filetype plugin indent on')
-- Enable filetype plugins and indentation

-- Set cursor styles for different modes with normal blinking
vim.opt.guicursor = 'n-v-c-i:block-blinkon3'

--vim.cmd('colorscheme oceanicnext')
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])

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

-- Set a dark background color for selected text
vim.cmd [[
  highlight Visual guibg=#0b1b1f guifg=NONE
  highlight VisualNOS guibg=#0b1b1f guifg=NONE
]]

-- Customize the CursorLineNr highlight group
vim.cmd [[
  highlight CursorLineNr guibg=#3C3C3C guifg=#FFD700
]]

-- Customize airline theme colors
vim.cmd [[
  highlight AirlineNormal guifg=#ffffff guibg=#87CEFA
  highlight AirlineInsert guifg=#ffffff guibg=#87CEFA
  highlight AirlineVisual guifg=#ffffff guibg=#87CEFA
  highlight AirlineReplace guifg=#ffffff guibg=#87CEFA
  highlight AirlineCommand guifg=#ffffff guibg=#87CEFA
  highlight AirlineError guifg=#ffffff guibg=#FF0000
]]

