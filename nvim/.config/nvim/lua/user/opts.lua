local options = {
  -----------------
  -- Indentation --
  -----------------

  autoindent = true,
  smartindent = true,
  expandtab = true, -- Convert tab to spaces
  shiftwidth = 2, -- Number of spaces of the indentation
  tabstop = 2, -- Number of spaces of the indentation
  smarttab = true, -- Tab with the number of spaces equal to tabstop

  ------------
  -- Search --
  ------------

  hlsearch = false, -- Search highlight
  ignorecase = true, -- Not case sensitive
  incsearch = true, -- Show partial matches
  smartcase = true, -- Switch to case sensitive when using upper case

  -----------------
  -- Performance --
  -----------------

  lazyredraw = true, -- Don't update screen during macros

  -----------------
  -- Text Render --
  -----------------

  encoding = "utf-8",
  scrolloff = 10, -- Number of lines to keep above and below the cursor
  sidescrolloff = 5, -- Number of columns to keep left and right the cursor
  wrap = false, -- Don't wrap lines

  --------
  -- UI --
  --------

  laststatus = 2, -- Status bar
  wildmenu = true, -- Command line tab completion
  number = true, -- Show line number
  relativenumber = true, -- Show relative line number
  mouse = "a", -- Enable mouse in nvim
  splitbelow = true, -- Horizontal split go below the current window
  splitright = true, -- Vertical split go to the right of the current window
  termguicolors = true, -- Set term gui colors
  showmode = false, -- Show mode (Normal, Insert, etc)
  signcolumn = "yes", -- Show sign column (in order to not shift when it appears)

  -----------
  -- Other --
  -----------

  hidden = true, -- Hide files in the background instead of closing them (Useful for buffers)
  clipboard = "unnamedplus", -- Allows nvim to use system clipboard
  undofile = true, -- Enable persistent undo
  backup = false, -- Disable backup
  swapfile = false, -- Disable swapfile
  timeoutlen = 400, -- Time to complete mapped sequences (in ms)
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local tab_four = {
  "python",
  "c",
  "cpp",
  "rust",
  "go",
  "php",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function (args)
    local ft = vim.bo[args.buf].filetype

    if vim.tbl_contains(tab_four, ft) then
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
    end
  end
})
