local module = {}

function module.apply_to_config(config)
    config.scrollback_lines = 100000
    config.enable_scroll_bar = true
end

return module
