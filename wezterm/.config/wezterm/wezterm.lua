local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config.enable_wayland = false
config.enable_tab_bar = false
config.window_background_opacity = 1.0
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Catppuccin Mocha"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config,
	{
		key_tables = {
			search_mode = {
				-- This action is not bound by default in wezterm
				{ key = "e", mods = "ALT", action = act.CopyMode("EditPattern") },
			},
		},
	}
