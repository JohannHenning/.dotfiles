local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config.enable_wayland = false

--NOTE: TAB Bar
config.enable_tab_bar = false
config.use_fancy_tab_bar = false

--NOTE: Window config
config.window_background_opacity = 0.95
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
--NOTE: Font config
config.font = wezterm.font("JetBrains Mono")
config.unicode_version = 14

--NOTE: Theme config
config.color_scheme = "Catppuccin Mocha"

--NOTE: Keybinds config
-- config.leader = {
-- 	key = "a",
-- 	mods = "CTRL",
-- 	timeout_milliseconds = 1000,
-- }

return config,
	{
		key_tables = {
			search_mode = {
				-- This action is not bound by default in wezterm
				{ key = "e", mods = "ALT", action = act.CopyMode("EditPattern") },
			},
		},
	}
