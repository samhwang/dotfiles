# Theme
DEFAULT_USER='pi'
ZSH_THEME="powerlevel10k/powerlevel10k"
source "$GENERALCONFIG/p10k-config-lean.zsh"

# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true # Make copying into zsh faster
zle_highlight=('paste:none') # Disable highlight

# Load oh-my-zsh specific distro config
CURRENT_OS=`uname`
OS_CONFIG_PATH="$DOTFILEPATH/$CURRENT_OS/$CURRENT_OS.zshrc"
source "$OS_CONFIG_PATH"

################# OH MY ZSH CONFIGURATIONS
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH