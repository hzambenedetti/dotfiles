
local langs = {
  "c",
  "cpp",
  "rust",
  "python",
  "matlab",
  "make",
  "json",
  "java",
  "lua",
  "vimdoc",
  "vim",
  "csv",
  "bash",
  "verilog",
}

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

treesitter_configs.setup{
  ensure_installed = langs,
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  
  autopairs = {
    enable = true,
  },

  highlight ={
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = {},
  },
  
--  context_commentstring = {
--    enable = true,
--    enable_autocmd = false,
--  },

}
