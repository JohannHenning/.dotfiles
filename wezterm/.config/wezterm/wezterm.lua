local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config.enable_wayland = false
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Tokyo Night"

return config,
	{
		key_tables = {
			search_mode = {
				-- This action is not bound by default in wezterm
				{ key = "e", mods = "ALT", action = act.CopyMode("EditPattern") },
			},
		},
	}
