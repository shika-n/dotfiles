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
		lazy = true,
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
		cmd = { "Telescope" },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
			{ "<leader>fr", "<cmd>Telescope resume<cr>" },
			{ "<leader>fc", "<cmd>Telescope git_status<cr>" },
			{
				"<leader>fw",
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"
			},
			{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufNew",
		opts = {
			current_line_blame = true,
			preview_config = {
				border = "single",
			},
		},
		cmd = { "Gitsigns" },
		keys = {
			{ "]c", "<cmd>gitsigns next_hunk<cr>" },
			{ "[c", "<cmd>gitsigns prev_hunk<cr>" },
			{ "<C-w>t", "<cmd>gitsigns preview_hunk<cr>" },
		}
	},
	{
		"chentoast/marks.nvim",
		event = "BufRead",
		opts = {},
	},
	{
		"mikavilpas/yazi.nvim",
		version = "*",
		lazy = true,
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true }
		},
		cmd = { "Yazi" },
		keys = {
			{ "<C-w>y", "<cmd>Yazi<cr>" }
		},
	}
}
