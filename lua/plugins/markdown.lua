-- markdown.lua

return {
  "preservim/vim-markdown",
  "vim-pandoc/vim-pandoc",
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
}

