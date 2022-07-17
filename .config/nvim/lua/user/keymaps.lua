
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------
-- Normal Mode --
-----------------

-- Better Buffer Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize Buffers
keymap("n", "<C-S-Left>", ":vertical resize -2 <CR>", opts)
keymap("n", "<C-S-Down>", ":resize +2 <CR>", opts)
keymap("n", "<C-S-Up>", ":resize -2 <CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2 <CR>", opts)

-- Buffer
keymap("n", "<leader>bd", ":bdelete <CR>", opts)

-- Search
keymap("n", ",", "/", { })
keymap("n", ",<CR>", ":noh <CR>", opts)

-- Increment and Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Move lines Up and Down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("n", "<C-S-Down>", "yyp", opts)
keymap("n", "<C-S-Up>", "yyP", opts)

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Lspsaga
keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)
keymap("n", "gl", ":Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
keymap("n", "gp", ":Lspsaga preview_definition<CR>", opts)

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

-- Move lines Up and Down
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-Down>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
keymap("i", "<A-Up>", "<ESC>:m .-2<CR>==gi", opts)
keymap("i", "<C-S-j>", "<ESC>yypi", opts)
keymap("i", "<C-S-Down>", "<ESC>yypi", opts)
keymap("i", "<C-S-k>", "<ESC>yyPi", opts)
keymap("i", "<C-S-Up>", "<ESC>yyPi", opts)

-----------------
-- Visual Mode --
-----------------

-- Move lines Up and Down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

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

