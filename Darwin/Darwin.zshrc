# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load PZT & OMZ modules
zgenom prezto osx

zgenom ohmyzsh plugins/iterm2
iterm2_tab_color 18 26 33

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform