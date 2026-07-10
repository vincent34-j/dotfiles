#!/usr/bin/env bash

discover_plugin_directories() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    local project_root
    project_root="$(cd "${script_dir}/../.." && pwd)"

    local plugin_root="${project_root}/plugins"

    if [[ ! -d "${plugin_root}" ]]; then
        return 0
    fi

    local dir

    for dir in "${plugin_root}"/*; do
        [[ -d "${dir}" ]] || continue
        printf '%s\n' "${dir}"
    done
}

load_plugin() {
    local plugin_file="$1"

    [[ -f "$plugin_file" ]] || return 1

    source "$plugin_file"
}

get_plugin_name() {
    printf '%s\n' "$PLUGIN_NAME"
}

get_plugin_version() {
    printf '%s\n' "$PLUGIN_VERSION"
}

get_plugin_description() {
    printf '%s\n' "$PLUGIN_DESCRIPTION"
}

