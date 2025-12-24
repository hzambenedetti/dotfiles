-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Adds file type icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Keymap to toggle the tree (Leader + e)
      vim.keymap.set("n", "tt", ":Neotree toggle position=left<CR>", { desc = "Toggle Explorer" })

      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true, -- Show hidden files?
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
    end,
  }
}
