-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local backgrounds = {
	-- "yuxo.jpeg",
	"jisoo-001.jpg",
	"jisoo-002.jpg",
	"jisoo-003.jpg",
	"jisoo-004.jpg",
}

config.font = wezterm.font({
	family = "Iosevka Term",
	harfbuzz_features = {
		"VDAC 2",
		"VSAG 2",
		"VLAA 2",
		"VLAF 1",
	},
})
config.font_size = 15

config.window_decorations = "NONE"
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
-- config.line_height = 1.35

config.background = {
	{
		source = { File = "/home/antennatower/.assets/" .. backgrounds[math.random(#backgrounds)] },
		width = "Cover",
		height = "Cover",
		vertical_align = "Middle",
		hsb = {
			brightness = 0.020,
			hue = 1.0,
			saturation = 1.0,
		},
	},
}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.colors = {
	["selection_bg"] = "#403d52",
	background = "#1b1b1b",
	-- cursor_bg = "#d65d0e",
}
config.term = "xterm-256color"
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 700

config.disable_default_key_bindings = false
-- local act = wezterm.action

-- config.keys = {
-- 	-- { key = ")", mods = "CTRL", action = act.ResetFontSize },
-- 	-- { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
-- 	-- { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
-- 	-- { key = "N", mods = "CTRL", action = act.SpawnWindow },
-- 	{ key = "/", mods = "CTRL", action = act.ActivateCommandPalette },
-- 	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
-- 	{ key = "C", mods = "NONE", action = act.CopyTo("Clipboard") },
-- 	-- { key = "P", mods = "NONE", action = act.PasteFrom("Clipboard") },
-- 	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
-- }

return config
