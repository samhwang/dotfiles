############################################
# Bypass Apple Quarantine for trusted apps #
############################################

CURRENT_OS=$(uname)

function bypass_quarantine() {
    if [ "$CURRENT_OS" != "Darwin" ]; then
        echo 'This utility is only supported on macOS!'
        return 1
    fi

    APP_NAME=$1
    if [ "$APP_NAME" = "" ]; then
        echo "Usage: bypass_quarantine <app_path>. This requires sudo!"
        return 1
    fi

    echo "Bypassing Quarantine for $1. This requires sudo!"
    sudo xattr -d com.apple.quarantine $APP_NAME
}
