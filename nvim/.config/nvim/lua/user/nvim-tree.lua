local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local config_status_ok, config_nvim_tree = pcall(require, "nvim-tree.config")
if not config_status_ok then return end

local tree_cb = config_nvim_tree.nvim_tree_callback

nvim_tree.setup {
  hijack_directories = {
    enable = false,
  },
  sync_root_with_cwd = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    ignore = false,
  },
  view = {
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  }
}
