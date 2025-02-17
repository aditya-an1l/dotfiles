-- Wezterm Configuration File
-- Author: aditya-an1l
-- Description: 
--    Lua configuration file for Wezterm Terminal.
--    This configuration is created on a Windows platform 
--    with PowerShell set as the default terminal.
local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local config = wezterm.config_builder()

config.keys = {
	{
		key = "S",
		mods = "ALT",
		action = workspace_switcher.switch_workspace(),
	},
	{
		key = "P",
		mods = "ALT",
		action = workspace_switcher.switch_to_prev_workspace(),
	},
	{
		key = "\\",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}
config.background = {
	{
		source = {
	{
		source = {
        -- write the path of the wallpaper you wish to apply
			File = "/path/to/wallpaper",
		},
      -- change the hsb value based on the background
		hsb = {
			hue = 1,
			saturation = 1.3,
			brightness = 0.2,
		},
	},
}

  -- default location to open the terminal
config.default_cwd = "path/to/directory"
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
-- config.window_background_opacity = 0.2
config.font_size = 12.5
config.default_prog = { "powershell.exe" }
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "Bold" })

return config
