local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function add_to_config(table)
	for key, value in pairs(table) do
		config[key] = value
	end
end

add_to_config({
	initial_cols = 120,
	initial_rows = 32,

	hide_tab_bar_if_only_one_tab = true,
	-- window_decorations = "RESIZE",
	window_background_opacity = 1.0,

	-- color_scheme = "Ayu Dark (Gogh)",
	-- color_scheme = "Ibm3270 (Gogh)",
	color_scheme = "Gruvbox Dark (Gogh)",

	font_dirs = { "fonts" },
	font_size = 11,
	-- font = wezterm.font("SauceCodePro Nerd Font"),
	-- font = wezterm.font("SpaceMono Nerd Font"),
	-- font = wezterm.font("DepartureMono Nerd Font"),
	font = wezterm.font("0xProto Nerd Font"),
	-- font = wezterm.font("BigBlueTermPlus Nerd Font"),

	--[[ colors = {
		background = "#0a0e19",
		foreground = "#a3aecc",
		cursor_bg = "#f7ff99",
		cursor_fg = "#0a0e19",
		ansi = {
			"#0a0e19",
			"#ff6d65",
			"#f2ff65",
			"#65ff6d",
			"#65f3ff",
			"#6d65ff",
			"#ff65f3",
			"#a3aecc",
		},
		brights = {
			"#2d364c",
			"#ff9f99",
			"#f7ff99",
			"#99ff9f",
			"#99f8ff",
			"#9f99ff",
			"#ff99f8",
			"#ffffff",
		},
	}, --]]

	keys = {
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
})

return config
