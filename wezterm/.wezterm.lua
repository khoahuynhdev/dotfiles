-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.color_scheme = "OneDark (base16)"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 15

config.keys = {
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
