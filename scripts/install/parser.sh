#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/install/resolver.sh"

install_dependencies_raw() {
    local plugin="$1"

    install_resolver_dependencies "$plugin"
}

install_dependencies_list() {

    local plugin="$1"

    local raw
    raw="$(install_dependencies_raw "$plugin")"

    [[ -z "$raw" ]] && return 0

    local dependency

    IFS=',' read -ra dependency <<< "$raw"

    local item

    for item in "${dependency[@]}"; do
        printf "%s\n" "$item"
    done
}
