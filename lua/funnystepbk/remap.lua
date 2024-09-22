-- Remap the leader key to space
vim.g.mapleader = " "

-- Remap for Markdown preview and stuff
vim.api.nvim_set_keymap('n', ',<leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',<leader>mt', ':MarkdownPreviewStop<CR>', { noremap = true, silent = true })

-- Change the shortcut to exit the terminal mode 
vim.api.nvim_set_keymap('t', '<C-q>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Keymaps for controlling the splits sizes in nvim in normal mode
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Keymaps for moving the cursor in insert mode using Ctrl + s/l
vim.api.nvim_set_keymap('i', '<C-s>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })

-- Telescope key mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fj', ':Telescope jumplist<CR>', { noremap = true, silent = true })

-- Create a horizontal split 
vim.api.nvim_set_keymap('n', '<leader>hs', ':split<CR>', {noremap = true, silent = true })

-- Create a vertical split with a new empty buffer and ensure it's on the right
vim.api.nvim_set_keymap('n', '<leader>v', ':vnew<CR>:wincmd l<CR>', { noremap = true, silent = true })

-- Map <leader>fe to open the file explorer
vim.api.nvim_set_keymap('n', '<leader>fe', ':Ex<CR>', { noremap = true, silent = true })

-- Key mappings for Harpoon
vim.api.nvim_set_keymap('n', '<leader>a', ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true })

-- Keymaps for gitsigns
-- vim.api.nvim_set_keymap('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hd', ':Gitsigns toggle_deleted<CR>', { noremap = true, silent = true })

-- Keymaps for fugitive
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ga', ':G add<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':G commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':Gpull<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gblame<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':Gfetch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Git diff<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ge', ':Git log<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gh', ':Git help<CR>', { noremap = true, silent = true })

-- Configure luasnip key mappings
vim.api.nvim_set_keymap('i', '<Tab>', [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']], {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Down>', [[<cmd>lua require'luasnip'.jump(1)<CR>]], {silent = true})
vim.api.nvim_set_keymap('i', '<C-Up>', [[<cmd>lua require'luasnip'.jump(-1)<CR>]], {silent = true})
vim.api.nvim_set_keymap('s', '<C-Down>', [[<cmd>lua require'luasnip'.jump(1)<CR>]], {silent = true})
vim.api.nvim_set_keymap('s', '<C-Up>', [[<cmd>lua require'luasnip'.jump(-1)<CR>]], {silent = true})
vim.api.nvim_set_keymap('i', '<Esc>', [[<cmd>lua require'luasnip'.unlink_current()<CR>]], {silent = true})
vim.api.nvim_set_keymap('s', '<Esc>', [[<cmd>lua require'luasnip'.unlink_current()<CR>]], {silent = true})

-- Keymaps for Vim tmux navigator
vim.cmd([[
  let g:tmux_navigator_no_mappings = 1
  nmap <silent> <C-h> :TmuxNavigateLeft<cr>
  nmap <silent> <C-j> :TmuxNavigateDown<cr>
  nmap <silent> <C-k> :TmuxNavigateUp<cr>
  nmap <silent> <C-l> :TmuxNavigateRight<cr>
  nmap <silent> <C-\> :TmuxNavigatePrevious<cr>
]])

-- Keyamp for OilNvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Keymap for opening a new tab in the same diectory
vim.api.nvim_set_keymap('n', 'gt', ':lua OpenTabInCurrentDir()<CR>', { noremap = true, silent = true })

function OpenTabInCurrentDir()
    local current_dir = vim.fn.expand('%:p:h')
    vim.cmd('lcd ' .. current_dir)
    vim.cmd('tabedit ' .. vim.fn.expand("<cfile>"))
end

-- Keymap for clearing search highlight
vim.api.nvim_set_keymap('n', '<leader>c', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Keymap for instantly swapping between tow files
vim.api.nvim_set_keymap('n', 'F', '<C-^>', { noremap = true, silent = true })

-- Keymap for moving lines up and down

-- Normal mode
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Insert mode
vim.api.nvim_set_keymap('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap('v', '<A-Up>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })

-- keymaps for moving a block of code left or right 

-- Move line left and right in Normal mode
vim.api.nvim_set_keymap('n', '<A-Left>', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '>>', { noremap = true, silent = true })

-- Move line left and right in Insert mode
vim.api.nvim_set_keymap('i', '<A-Left>', '<Esc><<i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Right>', '<Esc>>i', { noremap = true, silent = true })

-- Move line left and right in Visual mode
vim.api.nvim_set_keymap('v', '<A-Left>', '<gv<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'm', 'b', { noremap = true, silent = true })

-- Remap 'm' to 'b' in Normal mode
vim.api.nvim_set_keymap('n', 'm', 'b', { noremap = true, silent = true })

-- Visual mode mapping to delete and paste without affecting the default register
vim.api.nvim_set_keymap('x', '<leader>p', '"_dP', { noremap = true, silent = true })

