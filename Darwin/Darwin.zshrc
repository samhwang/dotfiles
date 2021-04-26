# Load PZT & OMZ modules
zinit wait lucid for \
  PZTM::osx

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
