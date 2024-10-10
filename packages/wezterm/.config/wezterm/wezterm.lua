local wezterm = require 'wezterm'
local keybinds = require 'keybinds'
local scrollback = require 'scrollback'
local theme = require 'theme'

local config = {}

keybinds.apply_to_config(config)
scrollback.apply_to_config(config)
theme.apply_to_config(config)

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = '' }
  local HOME_DIR = os.getenv('HOME')

  return current_dir.file_path == HOME_DIR and '~'
    or string.gsub(current_dir.file_path, '(.*[/\\])(.*)', '%2')
end

local function get_process(tab)
  if not tab.active_pane or tab.active_pane.foreground_process_name == '' then
    return nil
  end

  local process_name = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')

  return string.format('%s', process_name)
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local cwd = wezterm.format({
            { Text = get_current_working_dir(tab) },
        })

        local process = get_process(tab)
        local title = process and string.format(' %s (%s) ', process, cwd) or ' [?] '

        return {
            { Text = title },
        }
    end
)

return config
