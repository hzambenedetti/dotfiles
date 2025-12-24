-- https://github.com/akinsho/bufferline.nvim
return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove", -- Helper to close buffers without closing windows
    },
    version = "*",
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          style_preset = bufferline.style_preset.default, -- or .default
          always_show_bufferline = false,
          offsets ={
            {
              filetype = "neo-tree",
              text = "NeoTree",
              text_align = "center",
              separator = true,
            },
          },
        }
      })

      -- Setup the "Close" helper
      require("mini.bufremove").setup()

      -- Keymaps for buffers
      vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
      vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })

      -- Close buffer but keep window (Leader + x)
      vim.keymap.set("n", "<leader>cb", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "Close Buffer" })
    end,
  }
}
