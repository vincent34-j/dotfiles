#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/state/database.sh"

state_query_find() {
    local plugin="$1"

    state_db_read | grep "^${plugin}|"
}

state_query_exists() {
    local plugin="$1"

    state_query_find "$plugin" >/dev/null
}

state_query_status() {
    local plugin="$1"

    state_query_find "$plugin" | cut -d'|' -f2
}

state_query_enabled() {
    local plugin="$1"

    state_query_find "$plugin" | cut -d'|' -f3
}

state_query_version() {
    local plugin="$1"

    state_query_find "$plugin" | cut -d'|' -f4
}
