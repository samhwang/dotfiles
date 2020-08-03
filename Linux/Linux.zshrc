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
source "$LOAD/composer.sh"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"