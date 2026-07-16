#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/state/database.sh"

state_guard_ensure() {

    if state_exists; then
        return 0
    fi

    echo
    echo "State database not found."
    echo "Creating state database..."
    echo

    state_db_init
}
