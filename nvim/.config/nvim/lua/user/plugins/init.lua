return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  { "tpope/vim-fugitive" },

  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },

  { "github/copilot.vim" },

  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}
