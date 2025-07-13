local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 32

config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

config.color_scheme = "Ayu Dark (Gogh)"

-- config.font_dirs = { "fonts" }
-- config.font = wezterm.font("SauceCodePro Nerd Font Mono")
-- config.font = wezterm.font("SpaceMono Nerd Font")
config.font = wezterm.font("DepartureMono Nerd Font Mono")

return config
