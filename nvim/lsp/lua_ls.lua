return {
	settings = {
		Lua = {
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					"/usr/share/hypr/stubs",
				},
			},
			diagnostics = {
				globals = {
					"hl",
					"vim",
				},
			},
		},
	},
}
