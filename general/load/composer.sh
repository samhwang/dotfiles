if type composer > /dev/null 2>&1; then
  [ -d $HOME/.composer/vendor/bin ] && export PATH=$PATH:$HOME/.composer/vendor/bin
  [ -d $HOME/.config/composer/vendor/bin ] && export PATH=$PATH:$HOME/.config/composer/vendor/bin
fi