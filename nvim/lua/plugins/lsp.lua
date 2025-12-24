-- lua/plugins/lsp.lua
--  Sets up the following plugins:
--    - mason: https://github.com/mason-org/mason.nvim
--    - mason-lspconfig: https://github.com/mason-org/mason-lspconfig.nvim
--    - nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
--  

local servers = {
  "lua_ls",
  "ts_ls",
  "pyright",
  "rust_analyzer",
}

local on_attach = function(client, bufnr)
  -- Keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Goto Definition"})
  vim.keymap.set("n", "gl", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: Goto References"})
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "LSP: Explain"})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover Documentation"})
  --map("<leader>rn", vim.lsp.buf.rename, "Rename Variable")
  --map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
end

local function config_servers(capabilities)
  for _, server in pairs(servers) do
    local opts ={
      capabilities = capabilities,
      on_attach = on_attach,
    }
    vim.lsp.config(server, opts)
  end
end

local function config_lsp()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  local capabilities
  local status_ok, blink = pcall(require, "blink.cmp")
  if status_ok then
    capabilities = blink.get_lsp_capabilities()
  else
    capabilities = vim.lsp.protocol.make_client_capabilities()
  end

  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })

  config_servers(capabilities)

end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = config_lsp,
  }
}
