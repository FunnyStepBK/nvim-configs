local lspconfig = require('lspconfig')
local diagnostics_config = {
    update_in_insert = true,
}

lspconfig.cssls.setup{
  cmd = { "vscode-css-language-server", "--stdio" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}

lspconfig.html.setup{}

lspconfig.pyright.setup{}

lspconfig.clangd.setup{
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    single_file_support = true,
}

require("typescript-tools").setup {
    on_attach = function(client, bufnr)
    end,
    handlers = {
    },
    settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = {},
        tsserver_path = nil,
        tsserver_plugins = {},
        tsserver_max_memory = "auto",  
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        tsserver_locale = "en",
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        code_lens = "off",  
        disable_member_code_lens = true,  
        jsx_close_tag = {
            enable = false,
            filetypes = { "javascriptreact", "typescriptreact" },
        }
    },
}

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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostics_config)
