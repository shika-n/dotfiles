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
				"clangd", -- C++
				"cmake", -- CMake
				"cssls", -- CSS
				"gopls", -- Go
				"html", -- HTML
				"intelephense", -- PHP
				"jdtls", -- Java
				"jsonls", -- JSON
				"lua_ls", -- Lua
				"svelte", -- Svelte
				"ts_ls", -- Javascript/Typescript
			},
		},
	},
}
