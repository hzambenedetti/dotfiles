local colorscheme = "rose-pine"
local default = "habamax"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)


-- Loads default value if failed to load desired colorscheme
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found.")
  vim.cmd("colorscheme " .. default)
end
