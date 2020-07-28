plugins=(
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

# PATH for Composer global stuff
export PATH="${HOME}/.config/composer/vendor/bin:$PATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"