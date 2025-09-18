-- config/utils.lua
local wezterm = require("wezterm")
local M = {}

function M.apply_config(config)
	-- Configurações do terminal e fonte
    config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.font_size = 15
	config.adjust_window_size_when_changing_font_size = false

	-- Performance
	config.max_fps = 120
	config.animation_fps = 120

	-- Shell padrão e diretório inicial
	config.default_prog = { "zsh" }
	config.default_cwd = "~"

	-- Padding da janela
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
end

return M
