#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"
source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/index/query.sh"

run_plugins() {

    printf "%-15s %-10s %s\n" \
        "NAME" \
        "VERSION" \
        "DESCRIPTION"

    printf "%-15s %-10s %s\n" \
        "---------------" \
        "----------" \
        "------------------------------"

    local record

    while IFS= read -r record; do

        IFS='|' read -r \
            plugin \
            version \
            repository \
            description \
            dependencies <<< "$record"

        printf "%-15s %-10s %s\n" \
            "$plugin" \
            "$version" \
            "$description"

    done < <(
        index_query_all
    )
}
