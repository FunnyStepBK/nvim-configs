require('luasnip.loaders.from_vscode').lazy_load()

-- Enable the airline tabline extension
vim.g['airline#extensions#tabline#enabled'] = 1

-- Configure bamboo.nvim
require('bamboo').setup {
   -- optional configuration here
}
require('bamboo').load()

-- Set the airline theme to a basic one to ensure changes apply
vim.g.airline_theme = 'simple'

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

-- LSP setup
local lspconfig = require('lspconfig')

-- Common diagnostics settings for all language servers
local diagnostics_config = {
    update_in_insert = true,  -- Enable diagnostics in insert mode
}

-- CSS language server
lspconfig.cssls.setup{
  cmd = { "vscode-css-language-server", "--stdio" },  
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },
}

-- HTML language server
lspconfig.html.setup{}

-- Python language server
lspconfig.pyright.setup{}

-- Setup for C++ using clangd (works with g++)
lspconfig.clangd.setup{
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    single_file_support = true,
}

require("typescript-tools").setup {
    on_attach = function(client, bufnr)
        -- Your on_attach configuration here
    end,
    handlers = {
        -- Your custom handlers here
    },
    settings = {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostics
        publish_diagnostic_on = "insert_leave",
        -- array of strings ("fix_all"|"add_missing_imports"|"remove_unused"|
        -- "remove_unused_imports"|"organize_imports") -- or string "all"
        -- to include all supported code actions
        -- specify commands exposed as code_actions
        expose_as_code_action = {},
        -- string|nil - specify a custom path to `tsserver.js` file
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver
        tsserver_plugins = {},
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-size
        tsserver_max_memory = "auto",  -- memory limit in megabytes or "auto"
        -- described below
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        -- locale of all tsserver messages
        tsserver_locale = "en",
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        -- CodeLens
        -- WARNING: Experimental feature; might impact performance.
        code_lens = "off",  -- possible values: ("off"|"all"|"implementations_only"|"references_only")
        disable_member_code_lens = true,  -- reduce count of code lenses by removing member references
        -- JSXCloseTag
        jsx_close_tag = {
            enable = false,
            filetypes = { "javascriptreact", "typescriptreact" },
        }
    },
}

-- Rust language server configuration
lspconfig.rust_analyzer.setup{
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true,
      },
      assist = {
        importGranularity = "crate",
        importPrefix = "by_self",
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}

-- General diagnostics configuration
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostics_config)

-- Configure nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Up>'] = cmp.mapping.select_prev_item(),
    ['<C-Down>'] = cmp.mapping.select_next_item(),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<Esc>'] = cmp.mapping.close(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Setup cmdline completions
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  })
})

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

-- Function to set custom highlight groups for LSP diagnostics
local function setup_lsp_diagnostics_highlight()
  vim.cmd [[
    highlight! DiagnosticError guifg=#FF0000 gui=bold
    highlight! DiagnosticWarn guifg=#FFA500 gui=bold
    highlight! DiagnosticInfo guifg=#00FFFF gui=bold
    highlight! DiagnosticHint guifg=#00FF00 gui=bold
  ]]
end

-- Call the function to set the highlight groups
setup_lsp_diagnostics_highlight()

-- Set Python host for Neovim
vim.g.python3_host_prog = '~/myenv/bin/python3.12'

