# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load PZT & OMZ modules
zinit wait lucid for \
  PZTM::osx \
  atload'iterm2_tab_color 18 26 33' OMZP::iterm2
