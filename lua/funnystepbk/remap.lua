-- Remap the leader key to space
vim.g.mapleader = " "

-- Change the shortcut to exit the terminal mode 
vim.api.nvim_set_keymap('t', '<C-q>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Telescope key mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fj', ':Telescope jumplist<CR>', { noremap = true, silent = true })

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
vim.api.nvim_set_keymap('n', '<leader>d', ":lua require('harpoon.mark').rm_file()<CR>", { noremap = true, silent = true })

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


-- Keymaps for Vim tmux navigator
vim.cmd([[
  let g:tmux_navigator_no_mappings = 1
  nmap <silent> <C-h> :TmuxNavigateLeft<cr>
  nmap <silent> <C-j> :TmuxNavigateDown<cr>
  nmap <silent> <C-k> :TmuxNavigateUp<cr>
  nmap <silent> <C-l> :TmuxNavigateRight<cr>
  nmap <silent> <C-\> :TmuxNavigatePrevious<cr>
]])

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

-- Keymap for vim-move
-- Move line up
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>', { noremap = true, silent = true })
-- Move line down
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>', { noremap = true, silent = true })

-- Select entire file
-- vim.api.nvim_set_keymap('n', 'sa', 'ggVG', { noremap = true, silent = true })
-- Select the current line
-- vim.api.nvim_set_keymap('n', 'sl', 'V', { noremap = true, silent = true })
-- Select the current word
-- vim.api.nvim_set_keymap('n', 'sw', 'viw', { noremap = true, silent = true })

