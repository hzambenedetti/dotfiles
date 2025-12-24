-- https://github.com/saghen/blink.cmp 
return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets", -- Optional: adds standard snippets (like "for" loops)
    version = "v0.*", -- Use the latest release

    opts = {
      keymap = {
        preset = "default", -- Enter selects, Tab navigates
        -- You can customize keys here:
        -- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        -- ["<CR>"] = { "accept", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      -- The sources to complete from
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- Experimental signature help (like VS Code showing function args as you type)
      signature = { enabled = true }
    },
  }
}
