-- https://github.com/nvim-telescope/telescope.nvim

local function config_telescope()
  local builtin = require("telescope.builtin")

  -- We need to set keymaps here to open Telescope
  vim.keymap.set("n", "<leader>ft", builtin.find_files, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>gt", builtin.live_grep, { desc = "Find Grep (Text)" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0", -- It's often safer to pin telescope to a tag
    dependencies = { "nvim-lua/plenary.nvim" }, -- A required utility library
    config = config_telescope,
  }
}
