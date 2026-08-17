# Check if we're in an interactive shell
if [[ -o interactive ]]; then
  # Set Zellij config dir so we can launch it manually too
  export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"
  alias zellij-welcome='zellij -l welcome'
fi
