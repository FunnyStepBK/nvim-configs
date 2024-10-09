require('Comment').setup()
-- Key mapping for commenting (Normal Mode)
vim.api.nvim_set_keymap('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })

-- Key mapping for commenting (Visual Mode)
vim.api.nvim_set_keymap('v', '<leader>/', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })

-- Harpoon setup
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
    },
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = {"harpoon"},
        mark_branch = false,
    },
})


