#!/bin/bash

MODE_FILE="${HOME}/.config/sketchybar/.bar_mode"

# Read current mode
CURRENT_MODE=$(cat "${MODE_FILE}")

# Toggle mode
if [ "$CURRENT_MODE" = "compact" ]; then
    NEW_MODE="normal"
else
    NEW_MODE="compact"
fi

echo "$NEW_MODE" > "$MODE_FILE"

sketchybar --reload
