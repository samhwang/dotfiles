# Enable Byobu
if type byobu > /dev/null 2>&1; then
  _byobu_sourced=1 . `which byobu-launch` 2>/dev/null || true
fi