require("lets")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		},
		opts = {
			window = {
				position = "left",
				width = 25,
			},
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
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
			})
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
			"hrsh7th/cmp-cmdline"
		},
		config = function ()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }
				}, {
					{ name = 'buffer' }
				})
			})
		end
	},
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig"
		}
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	},
	{ "lewis6991/gitsigns.nvim" },
})

require("lualine").setup()
require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets"})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("php", { "html" })
require("luasnip").filetype_extend("svelte", { "html" })
require("mason").setup()
require("mason-lspconfig").setup {
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
	}
}


require("configs")
require('lspconfig').jdtls.setup{}
require'lspconfig'.intelephense.setup{}
