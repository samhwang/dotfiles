plugins=(
  command-not-found
  nvm
  ubuntu
  z
  zsh_reload
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Software Packages, Language and Environment
load_module "composer"
load_module "golang"
load_module "deno"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"