
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }

    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)

    -- Dependencies --
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- Colorschemes --
    use "arcticicestudio/nord-vim" -- Nord Theme

    -- Languages Syntax and Color Highlight --
    use "PotatoesMaster/i3-vim-syntax" -- i3wm config syntax
    use "kovetskiy/sxhkd-vim" -- sxhkd syntax
    use "norcalli/nvim-colorizer.lua" -- Color Highlight
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Syntax Highlight
    use "p00f/nvim-ts-rainbow" -- Treesitter plugin for rainbow brackets

    -- Completion --
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer" -- Buffer completion
    use "hrsh7th/cmp-path" -- Path completion
    use "saadparwaiz1/cmp_luasnip" -- Snippets completion
    use "hrsh7th/cmp-nvim-lsp" -- LSP integration for cmp
    use "hrsh7th/cmp-nvim-lua" -- Neovim Lua API 

    -- Snippets --
    use "L3MON4D3/LuaSnip" -- Snippet engine
    use "rafamadriz/friendly-snippets" -- Snippet Library

    -- LSP --
    use "neovim/nvim-lspconfig" -- Enable LSP
    use "williamboman/nvim-lsp-installer" -- Simplify Installing LSPs
    use "RRethy/vim-illuminate" -- Highlights uses of current word under cursor
    use "b0o/schemastore.nvim" -- Schemastore
    use { "glepnir/lspsaga.nvim", branch = "main" } -- LSP better UI
        -- Java
        -- use "mfussenegger/nvim-jdtls" -- Java LSP

    -- Telescope --
    use "nvim-telescope/telescope.nvim" -- Fuzzy Finder

    -- File Explorer
    use "kyazdani42/nvim-tree.lua" -- File Explorer
    use "kyazdani42/nvim-web-devicons" -- Web dev icons

    -- Bars
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } } -- Statusline


    -- QoL --
    use "windwp/nvim-autopairs" -- Autopairs
    use "numToStr/Comment.nvim" -- Comments
    use "JoosepAlviste/nvim-ts-context-commentstring" -- Comment integration with jsx/tsx (need nvim-treesitter)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

