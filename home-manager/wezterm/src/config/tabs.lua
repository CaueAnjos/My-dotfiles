-- config/tabs.lua
local wezterm = require("wezterm")
local appearance = require("config.appearance")
local M = {}

local function get_tab_title(index, text, max_width)
	local title = "(" .. index .. ") " .. (text:gsub("%.exe$", "") or "Terminal")
	if wezterm.column_width(title) > max_width then
		local cropped_title = wezterm.truncate_right(title, max_width - 5)
		title = cropped_title .. "..."
	end

	return title
end

function M.apply_config(config)
	-- Configurações básicas da barra de abas
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.tab_max_width = 15

	-- Configuração do formato de título das abas
	wezterm.on("format-tab-title", function(tab, tabs)
		local title = get_tab_title(tab.tab_index, tab.active_pane.title, config.tab_max_width)
		local colors = appearance.colors

		local bg_color = tab.is_active and colors.active_tab or colors.inactive_tab
		local fg_color = tab.is_active and colors.text_active_tab or colors.text_inactive_tab

		local LEFT_ROUNDED = utf8.char(0xe0b6)
		local RIGHT_ROUNDED = utf8.char(0xe0b4)

		return {
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = bg_color } },
			{ Text = LEFT_ROUNDED },
			{ Background = { Color = bg_color } },
			{ Foreground = { Color = fg_color } },
			{ Text = title },
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = bg_color } },
			{ Text = RIGHT_ROUNDED },
		}
	end)
end

return M
