# Check if we're in an interactive shell
if [[ -o interactive ]]; then
  # Set Zellij config dir so we can launch it manually too
  export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"

  # Only auto-launch Zellij inside Ghostty
  if [[ "$TERM" = "xterm-ghostty" ]]; then
    if [[ -z "$ZELLIJ" ]]; then
      zellij -l welcome
    fi
  fi
fi
