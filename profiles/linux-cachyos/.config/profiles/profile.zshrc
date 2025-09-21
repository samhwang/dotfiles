# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Link `zeditor` back to zed because muscle memory
alias zed='zeditor'

# System link for XWayland Applications to type Vietnamese
export XMODIFIERS="@im=fcitx"

alias sso-vait="aws ssm start-session --target i-09bfcbbea7ac38621 --profile vait"
