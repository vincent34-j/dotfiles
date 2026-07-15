#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"

index_db_init() {
    index_create_root
    : > "$(index_database)"
}

index_db_clear() {
    : > "$(index_database)"
}

index_db_append() {
    printf "%s\n" "$*" >> "$(index_database)"
}

index_db_count() {
    if ! index_exists; then
        echo 0
        return
    fi

    wc -l < "$(index_database)"
}

index_db_read() {
    if ! index_exists; then
        return
    fi

    cat "$(index_database)"
}
