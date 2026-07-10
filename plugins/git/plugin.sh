#!/usr/bin/env bash

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "${PLUGIN_DIR}/../../scripts/lib/system.sh"

plugin_get_name() {
    printf "git\n"
}

plugin_get_version() {
    printf "1.0.0\n"
}

plugin_get_description() {
    printf "Git Version Control\n"
}

plugin_install() {
    printf "Installing %s...\n" "$(plugin_get_name)"
}

plugin_update() {
    printf "Updating %s...\n" "$(plugin_get_name)"
}

plugin_remove() {
    printf "Removing %s...\n" "$(plugin_get_name)"
}

plugin_doctor() {
    printf "Checking %s...\n" "$(plugin_get_name)"

    if command_exists git; then
        print_status_ok "git: $(binary_version git)"
    else
        print_status_fail "git not found"
    fi

    if command_exists gh; then
        print_status_ok "gh: $(binary_version gh)"
    else
        print_status_warn "GitHub CLI not installed"
    fi
}

plugin_info() {
    printf "Plugin: %s\n" "$(plugin_get_name)"
    printf "Version: %s\n" "$(plugin_get_version)"
    printf "Description: %s\n" "$(plugin_get_description)"
    printf "\n"

    if command_exists git; then
        printf "Git Version : %s\n" "$(binary_version git)"
    else
        printf "Git Version : Not Installed\n"
    fi

    if git config --global user.name >/dev/null 2>&1; then
        printf "User Name   : %s\n" "$(git config --global user.name)"
    else
        printf "User Name   : Not Configured\n"
    fi

    if git config --global user.email >/dev/null 2>&1; then
        printf "User Email  : %s\n" "$(git config --global user.email)"
    else
        printf "User Email  : Not Configured\n"
    fi

    if command_exists gh; then
        printf "GitHub CLI  : %s\n" "$(binary_version gh)"
    else
        printf "GitHub CLI  : Not Installed\n"
    fi
}
