
--[[
    Available colorschemes:
        - Nord (colorscheme = "nord")
        - Dracula (colorscheme = "dracula")
]]--

local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme \"" .. colorscheme .. "\" not found!")
  return
end
