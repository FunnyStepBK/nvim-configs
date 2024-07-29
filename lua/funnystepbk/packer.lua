-- Initialize packer.nvim
require('packer').startup(function(use)
  -- Plugin manager itself
  use 'wbthomason/packer.nvim'

  -- Essential Plugins
  use 'neovim/nvim-lspconfig'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'dense-analysis/ale'
  use 'jiangmiao/auto-pairs'
  use 'ribru17/bamboo.nvim'
  use { 
    'lewis6991/gitsigns.nvim', 
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Optional Plugins
  use 'morhetz/gruvbox'
  use {'junegunn/fzf', run = ':call fzf#install()'}
  use 'tpope/vim-surround'
  use 'sheerun/vim-polyglot'

  -- Lua Plugins
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.8'}

  -- Vim tmux navigator
  use 'christoomey/vim-tmux-navigator'

  -- Autocompletion and snippets
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use {'vim-airline/vim-airline', opt = true}
  use {'vim-airline/vim-airline-themes', opt = true}

  use 'monaqa/dial.nvim'

  use 'ThePrimeagen/harpoon'
  use 'RRethy/nvim-base16'
  use 'SmiteshP/nvim-navic'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          section_separators = { '', '' },
          component_separators = { '', '' },
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        extensions = {'fugitive'}
      }
    end
  }
end)

-- Using Lua functions for key mappings and configurations
require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "css", "html" },
  highlight = {
    enable = true,
  },
}

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-t>"] = function(prompt_bufnr)
          local picker = require('telescope.actions.state').get_selected_entry()
          local filename = picker.path or picker[1]
          require('telescope.actions').close(prompt_bufnr)
          vim.cmd('tabnew ' .. filename)
        end
      }
    }
  }
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

require('lualine').setup {
  sections = {
    lualine_c = {'filename', require('nvim-navic').get_location},
  }
}

