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
				"bashls", -- Bash
				"clangd", -- C++
				"cmake", -- CMake
				"cssls", -- CSS
				"gopls", -- Go
				"html", -- HTML
				"intelephense", -- PHP
				"jdtls", -- Java
				"jsonls", -- JSON
				"lua_ls", -- Lua
				"pylsp", -- Python
				"rust_analyzer", -- Rust
				"svelte", -- Svelte
				"tailwindcss", -- Tailwind CSS
				"ts_ls", -- Javascript/Typescript
			},
		},
	},
}
