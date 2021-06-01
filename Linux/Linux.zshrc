# Load PZT & OMZ modules
zinit wait for lucid \
  OMZP::ubuntu \
    light-mode atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down' zsh-users/zsh-history-substring-search

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# PATH for eb cli
export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

eval $(dircolors ${HOME}/.dir_colors/dircolors)
