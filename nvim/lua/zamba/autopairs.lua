local status_ok, pairs = pcall(require, "nvim-autopairs")

if not status_ok then
  return
end

pairs.setup{
  check_ts = true,
  ts_config = {
    lua = {"string", "source"},
    java = false,
  },

  disable_filetype = {"TelescopePrompt"},

  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}


-- cmp integration
require "nvim-autopairs.completion.cmp"
local cmp_ok, _ = pcall(require, "cmp")
if not cmp_ok then
  return
end


