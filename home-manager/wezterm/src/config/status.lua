-- config/status.lua
local wezterm = require("wezterm")
local appearance = require("config.appearance")
local M = {}

function M.setup()
	-- Configura o status da direita (modo tmux)
	wezterm.on("update-right-status", function(window, _)
		local colors = appearance.colors
		local DIVISER = ""
		local prefix = ""

		-- Mostra indicador quando leader estiver ativo
		if window:leader_is_active() then
			prefix = " " .. utf8.char(0xf030c) .. " "
			DIVISER = utf8.char(0xe0b2)
		end

		window:set_right_status(wezterm.format({
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.status_accent } },
			{ Text = DIVISER },
			{ Background = { Color = colors.status_accent } },
			{ Foreground = { Color = colors.background } },
			{ Text = prefix },
		}))

		local NEOVIM = utf8.char(0xf36f)
		local OS = utf8.char(0xe8e5)
		local SOFT_DIVISER_LEFT = utf8.char(0xe0b1)
		local DIVISER_LEFT = utf8.char(0xe0b0)

		window:set_left_status(wezterm.format({
			{ Background = { Color = colors.logo_overlay } },
			{ Foreground = { Color = colors.logo_text } },
			{ Text = " " .. OS .. " " .. SOFT_DIVISER_LEFT .. " " .. NEOVIM .. " " },
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.logo_overlay } },
			{ Text = DIVISER_LEFT .. " " },
		}))
	end)
end

return M
