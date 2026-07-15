#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/dependency/runtime.sh"

dependency_checker_exists() {

    local dependency="$1"

    command -v "$dependency" >/dev/null 2>&1
}

dependency_checker_status() {

    local dependency="$1"

    if dependency_checker_exists "$dependency"; then
        dependency_status_installed
    else
        dependency_status_missing
    fi
}

dependency_checker_print() {

    local dependency="$1"

    dependency_print_status \
        "$dependency" \
        "$(dependency_checker_status "$dependency")"
}

