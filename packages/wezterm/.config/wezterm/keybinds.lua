local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    config.keys = {
        {
            key = 'd',
            mods = 'SUPER',
            action = wezterm.action.SplitHorizontal,
            domain = "CurrentPaneDomain",
        },
        {
            key = 'D',
            mods = 'SUPER|SHIFT',
            action = wezterm.action.SplitVertical,
            domain = "CurrentPaneDomain",
        }
    }
end

return module
