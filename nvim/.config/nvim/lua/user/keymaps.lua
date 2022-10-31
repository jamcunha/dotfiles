local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-----------------
-- Normal Mode --
-----------------

-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize Window
keymap("n", "<C-S-Left>", ":vertical resize -2 <CR>", opts)
keymap("n", "<C-S-Down>", ":resize +2 <CR>", opts)
keymap("n", "<C-S-Up>", ":resize -2 <CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2 <CR>", opts)

-- Buffers
keymap("n", "<leader>bd", ":bdelete <CR>", opts)
keymap("n", "<leader>bp", ":bprevious <CR>", opts)
keymap("n", "<leader>bn", ":bnext <CR>", opts)

-- Search
keymap("n", ",", "/", { })
keymap("n", ",<CR>", ":noh <CR>", opts)

-- Increment and Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Move lines up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Telescope Git
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>gS", ":Telescope git_stash<CR>", opts)
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>gfc", ":Telescope git_bcommits<CR>", opts)
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)

-- Comment Keymaps
--[[
  <gcc> -> Comment current line linewise (ex. //)
  <gbc> -> Comment current line blockwise (ex. /* */)
  <gco> -> Insert comment to the next line and enters INSERT mode (ex. func exmp()
                                                                      // Insert Comment)
  <gcO> -> Insert comment to the previous line and enters INSERT mode (ex. // Insert Comment
                                                                           func exmp())
  <gcA> -> Insert comment to end of the current line and enters INSERT mode (ex. func exmp() // Insert Comment)
]]--

-----------------
-- Insert Mode --
-----------------

-- Move lines up and down
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)

-- Exit insert mode
keymap("i", "ii", "<ESC>", opts)

-----------------
-- Visual Mode --
-----------------

-- Don't leave visual mode after indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Comment Keymaps
--[[
    <gc> -> Comment block linewise (ex. // func exmp()
                                        // i = 0)
    <gb> -> Comment block blockwise (ex. /* func exmp()
                                            i = 0 */)
]]--
