# Load PZT & OMZ modules
zinit wait lucid for \
  PZTM::osx \
  OMZP::iterm2

# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

BACKGROUND_RED="18"
BACKGROUND_GREEN="26"
BACKGROUND_BLUE="33"
iterm2_tab_color \
  $BACKGROUND_RED \
  $BACKGROUND_GREEN \
  $BACKGROUND_BLUE