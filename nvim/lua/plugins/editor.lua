return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPre",
		branch = "main",
		config = function (_, opts)
			local ts = require("nvim-treesitter")
			ts.setup(opts)
			local ensure_installed = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"go",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"php",
				"python",
				"rust",
				"sql",
				"svelte",
				"tsx",
				"typescript",
			}
			ts.install(ensure_installed)
			vim.api.nvim_create_autocmd('FileType', {
				pattern = {
					"sh",
					"typescriptreact",
					unpack(ensure_installed),
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "LspAttach",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "LspAttach",
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
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
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
						border = "single",
					}
				},
			})
		end
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		event = "LspAttach",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("luasnip.loaders.from_lua").load({
				paths = vim.fn.stdpath("config") .. "/snippets"
			})
			require("luasnip.loaders.from_vscode").lazy_load()

			local config = require("luasnip")
			config.filetype_extend("php", { "html" })
			config.filetype_extend("svelte", { "html" })
		end
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"stevearc/conform.nvim",
		event = "BufRead",
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			notify_on_error = true,
			notify_no_formatter = true,
		},
	},
}
