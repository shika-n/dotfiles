return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"css",
				"go",
				"graphql",
				"html",
				"java",
				"javascript",
				"lua",
				"php",
				"python",
				"rust",
				"sql",
				"svelte",
				"typescript",
				"vim",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { "html" },
			},
		},
		config = function (_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},
	{
		"hrsh7th/nvim-cmp",
		-- event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function ()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lsp_signature_help" },
				}, {
					{ name = "buffer" }
				}),
				window = {
					completion = {
						border = "rounded",
					},
					documentation = {
						border = nil,
					}
				},
			})
		end
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets"})
			require("luasnip.loaders.from_vscode").lazy_load()

			local config = require("luasnip")
			config.filetype_extend("php", { "html" })
			config.filetype_extend("svelte", { "html" })
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make"
			},
		},
		config = function(_, opts)
			local configs = require("telescope")
			configs.setup(opts)
			configs.load_extension("fzf")
		end
	},
}
