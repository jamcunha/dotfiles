local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

treesitter.setup({
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true },
  autotag = { enable = true },
})

