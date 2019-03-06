# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# These settings are from medium
# Link: https://medium.freecodecamp.org/how-you-can-style-your-terminal-like-medium-freecodecamp-or-any-way-you-want-f499234d48bc

# Customise the Powerlevel9k prompts and load Nerd Fonts with PowerLevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/projects/powerlevel9k/powerlevel9k.zsh-theme

# Set a color for iTerm2 tab title background using rgb values
function title_background_color {
  echo -ne "\033]6;1;bg;red;brightness;$ITERM2_TITLE_BACKGROUND_RED\a"
  echo -ne "\033]6;1;bg;green;brightness;$ITERM2_TITLE_BACKGROUND_GREEN\a"
  echo -ne "\033]6;1;bg;blue;brightness;$ITERM2_TITLE_BACKGROUND_BLUE\a"
}
ITERM2_TITLE_BACKGROUND_RED="18"
ITERM2_TITLE_BACKGROUND_GREEN="26"
ITERM2_TITLE_BACKGROUND_BLUE="33"
title_background_color
# Set iTerm2 tab title text
function title_text {
    echo -ne "\033]0;"$*"\007"
}
title_text SamHuynhMBP

#zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)
