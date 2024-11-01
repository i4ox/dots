local wezterm = require("wezterm")
local colorscheme = require("colorscheme")
local font = require("font")
local window = require("window")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

window.update_config(config)
font.update_config(config)
colorscheme.update_config(config)

return config

