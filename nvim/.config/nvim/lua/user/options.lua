
-----------------
-- Indentation --
-----------------

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true -- Convert tab to spaces
vim.opt.shiftwidth = 2 -- Number of spaces on the indentation
vim.opt.tabstop = 2 -- Number of spaces on the indentation
vim.opt.smarttab = true -- Tab with the number of spaces equal to tabstop

------------
-- Search --
------------

vim.opt.hlsearch = true -- Search highlight
vim.opt.ignorecase = true -- Not case sensitive
vim.opt.incsearch = true -- Show partial matches
vim.opt.smartcase = true -- Switch to case sensitive when using upper case

-----------------
-- Performance --
-----------------

vim.opt.lazyredraw = true -- Don't update screen during macros

-----------------
-- Text Render --
-----------------

vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 10 -- Number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 5 -- Number of columns to keep left and right the cursor
vim.opt.wrap = false -- Don't wrap lines

--------
-- UI --
--------

vim.opt.laststatus = 2 -- Status Bar
vim.opt.wildmenu = true -- Command line tab completion
vim.opt.number = true -- Show line numbers
vim.opt.mouse = "a" -- Enable mouse in nvim
vim.opt.splitbelow = true -- Horizontal split go below the current window
vim.opt.splitright = true -- Vertical split go to the right of the current window
vim.opt.termguicolors = true -- Set term gui colors
vim.opt.showmode = false -- Show mode (Normal, Insert, etc)

-----------
-- Other --
-----------

vim.opt.hidden = true -- Hide files in the background instead of closing them (Useful for buffers)
vim.opt.clipboard = "unnamedplus" -- Allows nvim to use system clipboard
vim.opt.undofile = true -- Enables persistent undo
vim.opt.backup = false -- Disable backups
vim.opt.swapfile = false -- Disable swapfile
vim.timeoutlen = 400 -- Time to complete mapped sequences (in ms)

