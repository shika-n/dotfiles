local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 32

config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.7

-- config.color_scheme = "Ayu Dark (Gogh)"

-- config.font_dirs = { "fonts" }
-- config.font = wezterm.font("SauceCodePro Nerd Font Mono")
-- config.font = wezterm.font("SpaceMono Nerd Font")
-- config.font = wezterm.font("DepartureMono Nerd Font Mono")
config.font = wezterm.font("0xProto Nerd Font")

config.colors = {
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
}

return config
