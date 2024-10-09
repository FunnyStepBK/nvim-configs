-- essentials.lua

return {
  "christoomey/vim-tmux-navigator",
  "wbthomason/packer.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  "dense-analysis/ale",
  "ribru17/bamboo.nvim",
  { 
    "lewis6991/gitsigns.nvim", 
    requires = { "nvim-lua/plenary.nvim" } 
  },
  "morhetz/gruvbox",
  { "junegunn/fzf", run = ':call fzf#install()' },
  "tpope/vim-surround",
  "sheerun/vim-polyglot",
  "numToStr/Comment.nvim"

}

