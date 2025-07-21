if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap

  _post_brewfile_update () {
    echo "Brewfile was updated!"
  }
fi

export HOMEBREW_BREWFILE="${HOME}/.config/brewfile/Brewfile"
export HOMEBREW_BREWFILE_LEAVES=1
export HOMEBREW_BREWFILE_FULL_NAME=1
