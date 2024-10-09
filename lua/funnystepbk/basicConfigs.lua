-- Enable line numbers and relative numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Set the tabspace
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Enable line wrapping
vim.o.wrap = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Enable mouse support
vim.o.mouse = 'a'

-- Use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Set scrolloff to 18 so that the screen scrolls when you're 18 lines from the bottom
vim.o.scrolloff = 18

