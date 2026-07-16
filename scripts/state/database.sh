#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/state/runtime.sh"

state_db_init() {
    state_create_root
    : > "$(state_database)"
}

state_db_clear() {
    : > "$(state_database)"
}

state_db_append() {
    printf "%s\n" "$*" >> "$(state_database)"
}

state_db_read() {
    if ! state_exists; then
        return
    fi

    cat "$(state_database)"
}

state_db_count() {
    if ! state_exists; then
        echo 0
        return
    fi

    wc -l < "$(state_database)"
}
