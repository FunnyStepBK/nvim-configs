-- Enable the airline tabline extension
vim.g['airline#extensions#tabline#enabled'] = 1

-- Configure bamboo.nvim
 require('bamboo').setup {
   -- optional configuration here
}
 require('bamboo').load()

-- Set the airline theme to a basic one to ensure changes apply
vim.g.airline_theme='simple'

-- Customize airline theme colors
vim.cmd [[
  highlight AirlineNormal guifg=#ffffff guibg=#87CEFA
  highlight AirlineInsert guifg=#ffffff guibg=#87CEFA
  highlight AirlineVisual guifg=#ffffff guibg=#87CEFA
  highlight AirlineReplace guifg=#ffffff guibg=#87CEFA
  highlight AirlineCommand guifg=#ffffff guibg=#87CEFA
  highlight AirlineError guifg=#ffffff guibg=#FF0000
]]

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

-- Enable JavaScript/TypeScript language server
lspconfig.tsserver.setup{}

-- Enable CSS language server
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

-- Enable HTML language server
lspconfig.html.setup{}

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
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
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

