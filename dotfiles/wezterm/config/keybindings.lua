-- config/keybindings.lua
local wezterm = require("wezterm")
local M = {}

function M.apply_config(config)
	-- Configuração da tecla leader (modo tmux)
	config.leader = { key = "ç", mods = "CTRL", timeout_milliseconds = 2000 }

	-- Definição dos atalhos de teclado principais
	config.keys = {
		{
			mods = "CTRL",
			key = "mapped:/",
			action = wezterm.action.SendKey({ key = "/", mods = "CTRL" }),
		},
		{
			mods = "LEADER",
			key = "c",
			action = wezterm.action.SpawnTab("DefaultDomain"),
		},
		{
			mods = "LEADER",
			key = "x",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			mods = "LEADER",
			key = "p",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			mods = "LEADER",
			key = "n",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			mods = "LEADER",
			key = "\\",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "-",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		-- Navegação entre painéis
		{
			mods = "LEADER",
			key = "h",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			mods = "LEADER",
			key = "j",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			mods = "LEADER",
			key = "k",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			mods = "LEADER",
			key = "l",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},

		{
			key = "p",
			mods = "CTRL|SHIFT",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
		{
			key = "y",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CopyTo("Clipboard"),
		},
	}

	-- Adiciona atalhos para alternar entre abas (1-9)
	for i = 0, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = wezterm.action.ActivateTab(i),
		})
	end
end

return M
