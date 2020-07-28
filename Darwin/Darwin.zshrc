plugins=(
  nvm
  osx
  z
  zsh_reload
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Load iterm2 config
source "$DOTFILEPATH/Darwin/iterm2.zsh"

# Software Packages, Language and Environment
source "$LOAD/composer.sh"
source "$LOAD/golang.sh"
source "$LOAD/pypi.sh"
source "$LOAD/google_cloud_sdk.sh"
source "$LOAD/byobu.sh"