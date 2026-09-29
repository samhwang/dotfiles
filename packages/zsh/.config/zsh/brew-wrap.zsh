if type brew > /dev/null; then

    export HOMEBREW_BUNDLE_FILE="${HOME}/.config/profiles/Brewfile"
    export HOMEBREW_AUTO_UPDATE_QUIET=1
    export HOMEBREW_BUNDLE_NO_DESCRIBE=1
    export HOMEBREW_BUNDLE_DUMP_NO_CARGO=1
    export HOMEBREW_BUNDLE_DUMP_NO_FLATPAK=1
    export HOMEBREW_BUNDLE_DUMP_NO_GO=1
    export HOMEBREW_BUNDLE_DUMP_NO_KREW=1
    export HOMEBREW_BUNDLE_DUMP_NO_NPM=1
    export HOMEBREW_BUNDLE_DUMP_NO_UV=1
    export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
    export HOMEBREW_BUNDLE_DUMP_NO_WINGET=1

    # add/remove edit the Brewfile in place, so comments, ordering and
    # untapped default taps survive (bundle dump --force would rewrite all).
    brew() {
        command brew "$@" || return
        local bundle_flag
        # Pad with spaces so --cask only matches as a whole word.
        if [[ " $* " == *" --cask "* ]]; then
            bundle_flag=--cask
        else
            bundle_flag=--formula
        fi
        if [[ $1 == install ]]; then
            shift
            command brew bundle add $bundle_flag "${@:#-*}"
            echo "==> BREWFILE UPDATED"
        elif [[ $1 == uninstall || $1 == remove ]]; then
            shift
            command brew bundle remove $bundle_flag "${@:#-*}"
            echo "==> BREWFILE UPDATED"
        fi
    }

fi
