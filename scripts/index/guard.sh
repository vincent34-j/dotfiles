#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"
source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/sync/builder.sh"

index_guard_ensure() {

    if [[ -f "$(index_database)" ]]; then
        return 0
    fi

    echo
    echo "Plugin index not found."
    echo "Building plugin index..."
    echo

    sync_builder_run
}
