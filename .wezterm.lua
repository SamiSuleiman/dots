-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local backgrounds = {
	"yuxo.jpeg",
	"jisoo-001.jpg"
}

config.font = wezterm.font({
	family = "monospace",
	harfbuzz_features = { "ss19", "ss01" },
})
config.font_size = 13

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

config.window_background_image = "/home/antennatower/assets/" .. backgrounds[math.random(#backgrounds)]
config.window_background_image_hsb = {
	brightness = 0.05,
	hue = 1.0,
	saturation = 1.0,
}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.colors = {
	background = "#130d0a",
}
config.term = "xterm-256color"
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 700

config.disable_default_key_bindings = true
local act = wezterm.action

config.keys = {
	-- { key = ")", mods = "CTRL", action = act.ResetFontSize },
	-- { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	-- { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	-- { key = "N", mods = "CTRL", action = act.SpawnWindow },
	{ key = "/", mods = "CTRL", action = act.ActivateCommandPalette },
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "C", mods = "NONE", action = act.CopyTo("Clipboard") },
	{ key = "P", mods = "NONE", action = act.PasteFrom("Clipboard") },
	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
}

return config
