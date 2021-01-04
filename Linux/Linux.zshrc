plugins=(
  command-not-found
  nvm
  ubuntu
  z
  zsh_reload
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

os_modules=(
  # Software Packages, Language and Environment
  "composer"
  "golang"
  "deno"
)
load_modules $os_modules
unset $os_modules

eval $(dircolors ${HOME}/.dir_colors/dircolors)
