-- config/appearance.lua
local wezterm = require("wezterm")
local M = {}

-- Definição de cores que serão compartilhadas
M.colors = {
	active_tab = "#fab387",
	inactive_tab = "#1e1e2e",
	text_active_tab = "#11111b",
	text_inactive_tab = "#bac2de",
	background = "#181825",
	status_accent = "#7287fd",
	logo_overlay = "#414559",
	logo_text = "#babbf1",
}

function M.apply_config(config)
	-- Configurações de aparência da janela
	config.window_decorations = "RESIZE"
	config.color_scheme = "Catppuccin Mocha"
	config.window_background_opacity = 0.6
	config.win32_system_backdrop = "Acrylic"

	-- Configuração de cores específicas
	config.colors = {
		tab_bar = {
			background = M.colors.background,

			active_tab = {
				bg_color = M.colors.active_tab,
				fg_color = M.colors.text_active_tab,
				intensity = "Bold",
				italic = true,
			},

			inactive_tab = {
				bg_color = M.colors.inactive_tab,
				fg_color = M.colors.text_inactive_tab,
			},

			new_tab = {
				bg_color = M.colors.inactive_tab,
				fg_color = M.colors.text_inactive_tab,
			},
		},
	}
end

return M
