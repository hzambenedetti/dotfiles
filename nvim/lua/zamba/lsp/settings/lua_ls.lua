return {
	settings = {

		Lua = {
			diagnostics = {
        disable = {
          "trailing-space",
        },
				globals = {
          "vim",
        },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
