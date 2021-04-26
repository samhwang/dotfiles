# Load PZT & OMZ modules
zinit wait for lucid \
  OMZP::ubuntu

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# os_modules=(
# )
# load_modules $os_modules
# unset $os_modules

eval $(dircolors ${HOME}/.dir_colors/dircolors)
