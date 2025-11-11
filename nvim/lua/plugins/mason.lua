return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason" },
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufNew",
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
				"slangd", -- Slang
				"svelte", -- Svelte
				"tailwindcss", -- Tailwind CSS
				"ts_ls", -- Javascript/Typescript
			},
		},
	},
}
