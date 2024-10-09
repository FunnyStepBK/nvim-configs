return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets", -- Snippet collection
        "j-hui/fidget.nvim",
    },

    config = function()
        -- Mason and LSP setup
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "bashls",
                "asm_lsp",
                "arduino_language_server",
                "ts_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                -- Custom configuration for Lua LS
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    }
                end,
            },
        })

        -- Setup for snippets
        require("luasnip.loaders.from_vscode").lazy_load() -- Load friendly-snippets

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Up>'] = cmp.mapping.select_prev_item(cmp_select), -- Move to the previous item
                ['<C-Down>'] = cmp.mapping.select_next_item(cmp_select), -- Move to the next item
                ['<C-k>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
                ['<C-j>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down
                ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
                ['<ESC>'] = cmp.mapping.close(),         -- Close the completion window
                ['<Enter>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },  -- LSP source
                { name = 'luasnip' },   -- LuaSnip source
            }, {
                { name = 'buffer' },    -- Buffer source
                { name = 'path' },      -- Path source
            }),
        })

        -- Setup for command-line completion
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
            }, {
                { name = 'path' },
            }),
        })

        -- Configure diagnostics display
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
