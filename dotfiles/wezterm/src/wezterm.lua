local wezterm = require("wezterm")
local utils = require("config.utils")
local appearance = require("config.appearance")
local keybindings = require("config.keybindings")
local tabs = require("config.tabs")
local status = require("config.status")

local config = wezterm.config_builder()

-- Carrega configurações base
utils.apply_config(config)
appearance.apply_config(config)
keybindings.apply_config(config)
tabs.apply_config(config)
status.setup()

return config
