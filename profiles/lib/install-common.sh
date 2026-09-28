#!/bin/bash
# Shared helpers for profiles/*/scripts/install.sh — source, don't execute.
#
# Usage:
#   DOTFILES_DIR="${HOME}/.dotfiles"
#   source "${DOTFILES_DIR}/profiles/lib/install-common.sh"

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing install-common.sh}"

# stow_generic_packages <pkg> [<pkg> ...]
# Stows one or more packages/<pkg> dirs into $HOME.
stow_generic_packages() {
    if [ "$#" -eq 0 ]; then
        echo "stow_generic_packages: at least one package name required" >&2
        return 1
    fi
    (
        cd "${DOTFILES_DIR}/packages" || exit 1
        stow --target="${HOME}" "$@"
    )
}

# stow_platform_packages <pkg> [<pkg> ...]
# Same mechanics as stow_generic_packages -- distinct name only so install.sh
# call sites read as OS-specific without relying on a comment.
stow_platform_packages() {
    stow_generic_packages "$@"
}

# update_cowsay_submodule
# --init handles a fresh clone; pkg_up's own submodule update never did.
update_cowsay_submodule() {
    (
        cd "${DOTFILES_DIR}" || exit 1
        git submodule update --init --recursive -- packages/cowsay/.cowsay
    )
}

# inject_profile_secrets <profile-name>
# Runs `op inject` for <profile-name>'s private.zsh.tpl, if one exists.
# Profiles without 1Password (e.g. linux-cachyos-handheld) now get an
# explicit skip message instead of the gap being silent/undocumented.
inject_profile_secrets() {
    local profile="$1"
    local tpl_rel="${profile}/.config/profiles/private.zsh.tpl"
    local out_rel="${profile}/.config/profiles/private.zsh"

    if [ ! -f "${DOTFILES_DIR}/profiles/${tpl_rel}" ]; then
        echo "inject_profile_secrets: no ${tpl_rel} found -- skipping 1Password injection for profile '${profile}' (this is expected if the profile has no private secrets)."
        return 0
    fi

    if ! command -v op >/dev/null 2>&1; then
        echo "inject_profile_secrets: 'op' CLI not found on PATH -- skipping 1Password injection for profile '${profile}' (expected on profiles without 1Password installed, e.g. linux-cachyos-handheld)."
        return 0
    fi

    (
        cd "${DOTFILES_DIR}/profiles" || exit 1
        OP_ACCOUNT=my.1password.com op inject -i "${tpl_rel}" -o "${out_rel}"
    )
}

# stow_profile <profile-name>
# Stows profiles/<profile-name> into $HOME.
stow_profile() {
    local profile="$1"
    (
        cd "${DOTFILES_DIR}/profiles" || exit 1
        stow --target="${HOME}" "${profile}"
    )
}
