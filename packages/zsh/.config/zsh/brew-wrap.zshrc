if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap

  _post_brewfile_update () {
    echo "Brewfile was updated!"
  }
fi

HOMEBREW_BREWFILE="${HOME}/.config/brewfile/Brewfile"
HOMEBREW_BREWFILE_LEAVES=1
HOMEBREW_BREWFILE_FULL_NAME=1
