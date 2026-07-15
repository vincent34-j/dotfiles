#!/usr/bin/env bash

index_root() {
    printf "%s/cache/index\n" "${PROJECT_ROOT}"
}

index_database() {
    printf "%s/plugins.db\n" "$(index_root)"
}

index_exists() {
    [[ -f "$(index_database)" ]]
}

index_create_root() {
    mkdir -p "$(index_root)"
}

index_remove() {
    rm -f "$(index_database)"
}
