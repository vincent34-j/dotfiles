#!/usr/bin/env bash

discover_plugin_directories() {
    local plugin_root="plugins"

    if [[ ! -d "$plugin_root" ]]; then
        return 0
    fi

    local dir

    for dir in "$plugin_root"/*; do
        [[ -d "$dir" ]] || continue
        printf '%s\n' "$dir"
    done
}
