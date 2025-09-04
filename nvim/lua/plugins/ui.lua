return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			cursor_color = "#f7ff99",
		},
	},
	{
		"jinh0/eyeliner.nvim",
		opts = {
			highlight_on_key = true,
			dim = true,
		},
	},
	{
		"eero-lehtinen/oklch-color-picker.nvim",
		event = "VeryLazy",
		version = "*",
		opts = {},
		keys = {
			{
				"<leader>v",
				function()
					require("oklch-color-picker").pick_under_cursor()
				end
			},
		},
	},
}
