#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/install/parser.sh"

install_dependencies_resolve() {

    local plugin="$1"

    local dependency

    while IFS= read -r dependency; do

        [[ -z "$dependency" ]] && continue

        printf "%s\n" "$dependency"

    done < <(
        install_dependencies_list "$plugin"
    )
}

install_dependencies_count() {

    local plugin="$1"

    install_dependencies_resolve "$plugin" \
        | wc -l
}
