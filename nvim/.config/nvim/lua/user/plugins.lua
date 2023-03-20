-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Reload neovim when saving plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

return packer.startup(function(use)

  -- Dependencies --
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorschemes --
  use "shaunsingh/nord.nvim" -- Nord Colorscheme
  use 'Mofiqul/dracula.nvim' -- Dracula Colorscheme
  use "folke/tokyonight.nvim" -- Tokyo Night Colorscheme

  -- Languages Syntax and Color Highlight --
  use "PotatoesMaster/i3-vim-syntax" -- i3wm config syntax
  use "kovetskiy/sxhkd-vim" -- sxhkd syntax
  use "norcalli/nvim-colorizer.lua" -- Color Highlight
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function ()
      require("nvim-treesitter.install").update({ with_sync = true })
    end
  })

  -- Completion --
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- Buffer completion
  use "hrsh7th/cmp-path" -- Path completion
  use "saadparwaiz1/cmp_luasnip" -- Snippets completion
  use "hrsh7th/cmp-nvim-lsp" -- LSP integration for cmp
  use "hrsh7th/cmp-nvim-lua" -- Neovim lua API

  -- Snippets (For completion) --
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- Snippet library

  -- LSP --
  use "williamboman/mason.nvim" -- LSP install manager
  use "williamboman/mason-lspconfig.nvim" -- Dependency
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "jose-elias-alvarez/typescript.nvim" -- Aditional typescript LSP functionality
  use ({ "glepnir/lspsaga.nvim", branch = "main" }) -- LSP better UI
  use "onsails/lspkind.nvim" -- VSCode icons
  use "b0o/schemastore.nvim" -- Schemastore

  -- Git --
  use "lewis6991/gitsigns.nvim"

  -- Telescope --
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Dependency
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- File Explorer --
  use "kyazdani42/nvim-web-devicons" -- Web Dev Icons
  use { "kyazdani42/nvim-tree.lua", require = { "kyazdani42/nvim-web-devicons" } } -- File Explorer

  -- Bars --
  use { "nvim-lualine/lualine.nvim", require = { "kyazdani42/nvim-web-devicons", opt=true } } -- Status Line

  -- QoL --
  use "windwp/nvim-autopairs" -- Autopairs
  use "windwp/nvim-ts-autotag" -- Close and rename html tags
  use "numToStr/Comment.nvim" -- Comments
  -- maybe use "kylechui/nvim-surround"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

