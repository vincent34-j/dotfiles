#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/lib/system.sh"

plugin_install() {
    printf "Installing %s...\n" "${NAME}"
}

plugin_update() {
    printf "Updating %s...\n" "${NAME}"
}

plugin_remove() {
    printf "Removing %s...\n" "${NAME}"
}

plugin_doctor() {
    printf "Checking %s...\n" "${NAME}"

    if command_exists git; then
        print_status_ok "git: $(binary_version git)"
    else
        print_status_fail "git not installed"
    fi

    if command_exists gh; then
        print_status_ok "gh: $(binary_version gh)"
    else
        print_status_warn "GitHub CLI not installed"
    fi
}

plugin_info() {
    printf "Plugin: %s\n" "${NAME}"
    printf "Version: %s\n" "${VERSION}"
    printf "Description: %s\n" "${DESCRIPTION}"
    printf "\n"

    printf "Git Version : %s\n" "$(binary_version git)"
    printf "User Name   : %s\n" "$(git config --global user.name 2>/dev/null)"
    printf "User Email  : %s\n" "$(git config --global user.email 2>/dev/null)"

    if command_exists gh; then
        printf "GitHub CLI  : %s\n" "$(binary_version gh)"
    else
        printf "GitHub CLI  : Not Installed\n"
    fi
}
