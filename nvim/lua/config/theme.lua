local function contains(table, string)
  for _, value in ipairs(table) do
    if value == string then
      return true
    end
  end
  return false
end

local active_theme = "rose-pine"
local themes = vim.fn.getcompletion("", "color")

if contains(themes, active_theme) then
  vim.cmd.colorscheme(active_theme)
else
  vim.cmd.colorscheme(themes[0])
end


