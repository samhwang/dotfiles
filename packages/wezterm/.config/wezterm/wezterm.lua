local keybinds = require 'keybinds'
local scrollback = require 'scrollback'
local theme = require 'theme'

local config = {}

keybinds.apply_to_config(config)
scrollback.apply_to_config(config)
theme.apply_to_config(config)

return config
