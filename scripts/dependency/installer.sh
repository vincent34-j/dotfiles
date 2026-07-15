#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/dependency/checker.sh"

dependency_installer_run() {

    local dependency="$1"

    if dependency_checker_exists "$dependency"; then
        printf "%-20s %s\n" \
            "$dependency" \
            "already installed"
        return 0
    fi

    printf "%-20s %s\n" \
        "$dependency" \
        "install required"
}
