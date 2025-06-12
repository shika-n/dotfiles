return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig"
		},
		opts = {
			ensure_installed = {
				"cssls",
				"gopls",
				"html",
				"intelephense",
				"jdtls",
				"jsonls",
				"lua_ls",
				"svelte",
				"ts_ls",
			},
		},
	},
}
