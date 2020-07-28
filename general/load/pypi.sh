PYPI_PATH=""
if [ $CURRENT_OS = "Darwin" ]; then
  PYPI_PATH="${HOME}/Library/Python/3.7/bin"
elif [ $CURRENT_OS = "Linux" ]; then
  PYPI_PATH="$HOME/.local/bin"
fi

export PATH="$PYPI_PATH:$PATH"