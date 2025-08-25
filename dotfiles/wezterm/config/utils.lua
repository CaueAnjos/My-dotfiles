-- config/utils.lua
local wezterm = require("wezterm")
local M = {}

function M.apply_config(config)
	-- Configurações do terminal e fonte
	config.font = wezterm.font_with_fallback({
		{ family = "JetBrainsMonoNL Nerd Font Propo", weight = "DemiBold" },
		"Symbols Nerd Font Mono",
		"Segoe UI Emoji",
	})

	config.font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font(
				"JetBrainsMonoNL Nerd Font Propo",
				{ weight = "Bold", stretch = "Normal", style = "Normal" }
			),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font(
				"JetBrainsMonoNL Nerd Font Propo",
				{ weight = "Bold", stretch = "Normal", style = "Italic" }
			),
		},
	}

	config.font_size = 15
	config.adjust_window_size_when_changing_font_size = false

	-- Performance
	config.max_fps = 120
	config.animation_fps = 120

	-- Shell padrão e diretório inicial
	config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo" }
	config.default_cwd = "C:\\Users\\kawid"

	-- Padding da janela
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
end

return M
