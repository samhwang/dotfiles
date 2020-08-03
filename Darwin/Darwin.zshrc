plugins=(
  command-not-found
  nvm
  osx
  z
  zsh_reload
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Load iterm2 config
load_module "iterm2"

# Software Packages, Language and Environment
load_module "composer"
load_module "golang"
load_module "pypi"
load_module "google_cloud_sdk"
load_module "byobu"
