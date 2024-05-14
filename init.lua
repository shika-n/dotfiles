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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		}
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
					"html",
					"java",
					"javascript",
					"lua",
					"python",
					"rust",
					"vim",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
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
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" }
				})
			})
		end
	}
})

require("configs")
