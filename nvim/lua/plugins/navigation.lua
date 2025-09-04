return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		},
		opts = {
			window = {
				position = "float",
				width = 25,
			},
		},
		keys = {
			{ "\\", "<cmd>Neotree toggle reveal<cr>" },
		},
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
		opts = {
			pickers = {
				buffers = {
					ignore_current_buffer = true,
					sort_mru = true,
				},
			},
		},
		config = function(_, opts)
			local configs = require("telescope")
			configs.setup(opts)
			configs.load_extension("fzf")
		end,
		keys = function()
			local telescope = require("telescope.builtin")
			return {
				{ "<leader>ff", telescope.find_files },
				{ "<leader>fg", telescope.live_grep },
				{ "<leader>fb", telescope.buffers },
				{ "<leader>fh", telescope.help_tags },
				{ "<leader>fr", telescope.resume },
				{ "<leader>fc", telescope.git_status },
				{ "<leader>fw", telescope.lsp_dynamic_workspace_symbols },
				{ "<leader>fs", telescope.lsp_document_symbols },
				{ "<leader>fd", telescope.diagnostics },
			}
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			preview_config = {
				border = "single",
			},
		},
		keys = function ()
			local gitsigns = require("gitsigns")
			return {
				{ "]c", gitsigns.next_hunk },
				{ "[c", gitsigns.prev_hunk },
				{ "<C-w>t", gitsigns.preview_hunk },
			}
		end
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"mikavilpas/yazi.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true }
		},
		keys = {
			{ "<C-w>y", "<cmd>Yazi<cr>" }
		},
	}
}
