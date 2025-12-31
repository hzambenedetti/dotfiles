-- https://github.com/nvim-treesitter/nvim-treesitter 
local function config()
  local parsers = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "rust",
    "python",
    "go",
    "typescript",
    "javascript"
  }

  local status_ok, ts = pcall(require, "nvim-treesitter")
  if not status_ok then
    return
  end

  ts.install(parsers)

  vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
end

-- Return the Lazy spec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = config, -- Reference the function here
  }
}
