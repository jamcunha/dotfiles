
--[[
    Available colorschemes:
        - Nord (colorscheme = "nord")
        - Dracula (colorscheme = "dracula")
        - Tokyo Night (colorscheme = "tokyonight-dark")
]]--

local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme \"" .. colorscheme .. "\" not found!")
  return
end
