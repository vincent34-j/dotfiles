#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/state/database.sh"

state_update_install() {

    local plugin="$1"
    local version="$2"

    state_db_append \
"${plugin}|installed|enabled|${version}"
}
