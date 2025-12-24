-- https://github.com/akinsho/toggleterm.nvim
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]], -- Ctrl + Backslash to toggle
        direction = "float", -- Options: 'vertical' | 'horizontal' | 'tab' | 'float'
        float_opts = {
          border = "curved",
        },
      })

      -- Lazy-load a keymap to exit terminal mode easily
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        -- Press ESC to go to Normal mode in terminal
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      end

      -- Auto-apply these maps when opening a terminal
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  }
}
