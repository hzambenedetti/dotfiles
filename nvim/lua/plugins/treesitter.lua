-- https://github.com/nvim-treesitter/nvim-treesitter 
local function config()

  local status_ok, configs = pcall(require, "nvim-treesitter.configs")

  if not status_ok then
    return
  end

  configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  })
end

-- Return the Lazy spec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config, -- Reference the function here
  }
}
