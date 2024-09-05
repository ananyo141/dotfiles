-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({ "Monaspace Radon", "Symbols Nerd Font" })

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.font_size = 16

config.color_scheme = "Dracula+"

config.window_background_opacity = 0.8

-- and finally, return the configuration to wezterm
return config
