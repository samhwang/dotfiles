local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    config.color_scheme = 'catppuccin-mocha'

    config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
    config.font_size = 18
end

return module
