# Make copying much faster and disable highlight
DISABLE_MAGIC_FUNCTIONS=true
zle_highlight=('paste:none')

# Setting up environment
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export ZSH="$PROJECTS/dotfiles/general/oh-my-zsh"
ZSH_CUSTOM="$PROJECTS/dotfiles/general/oh-my-zsh-custom"

# Cowfiles directory
export COWPATH="$PROJECTS/cowfiles:$COWPATH"

# Theme
DEFAULT_USER='samhwang'
ZSH_THEME="powerlevel10k/powerlevel10k"
source "$PROJECTS/dotfiles/general/p10k-config-lean.zsh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load oh-my-zsh specific distro config
DISABLE_AUTO_UPDATE=true
source "$PROJECTS/dotfiles/`uname`/`uname`.zshrc"



# Load aliases
source "$GENERALCONFIG/alias.sh"

################# OH MY ZSH CONFIGURATIONS
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH