local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "dracula-nvim",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = { "packer" },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {
      { "filename", file_status = true, path = 0 },
    },
    lualine_x = {
      { "diagnostics", source = {"nvim_diagnostic"}, symbols = { error = " ", warn = " ", info = " ", hint = " " } },
      { "diff", symbols = { added = " ", modified = "柳 ", removed = " " } },
    },
    lualine_y = {
      { "filetype", colored = true, icon_only = false, icon = { align = "right" } }
    },
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "nvim-tree" }
}
