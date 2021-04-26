plugins=(
  command-not-found
  nvm
  osx
  wakatime
  z
  zsh_reload
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

os_modules=(
  # iTerm2 config
  "iterm2"

  # cows
  "cowsay"

  # Software Packages, Language and Environment
  "pypi"
  "google_cloud_sdk"
  "byobu"
)
load_modules $os_modules
unset $os_modules
