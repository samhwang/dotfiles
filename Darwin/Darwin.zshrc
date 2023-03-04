# Load OMZ modules
plugins=(
  command-not-found
  z
  iterm2
  history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform