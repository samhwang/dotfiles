# Load PZT & OMZ modules
zgenom ohmyzsh plugins/ubuntu

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# PATH for eb cli
export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

eval $(dircolors ${HOME}/.dir_colors/dircolors)
