plugins=(ubuntu z zsh_reload zsh-completions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# PATH for Composer global stuff
export PATH="${HOME}/.config/composer/vendor/bin:$PATH"

# Load NVM into shell session as a function
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# Specify gems directory for Ruby
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"