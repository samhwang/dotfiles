# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Link `zeditor` back to zed because muscle memory
alias zed='zeditor'

# System link for XWayland Applications to type Vietnamese
export XMODIFIERS="@im=fcitx"

alias sso-vait="aws ssm start-session --target i-09bfcbbea7ac38621 --profile vait"

function switch_greetd() {
    echo "This function requires sudo. Prompting sudo rights now."
    sudo -v

    echo "Switching to greetd..."
    sudo systemctl disable sddm.service --quiet
    sudo systemctl enable greetd.service --quiet

    echo "Switch complete. Reboot for changes to take effect."
}

function switch_sddm() {
    echo "This function requires sudo. Prompting sudo rights now."
    sudo -v

    echo "Switching to sddm..."
    sudo systemctl disable greetd.service --quiet
    sudo systemctl enable sddm.service --quiet

    echo "Switch complete. Reboot for changes to take effect."
}
