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
    validate_plugin || return 1
}
validate_plugin() {
    declare -F plugin_get_name >/dev/null || return 1
    declare -F plugin_get_version >/dev/null || return 1
    declare -F plugin_get_description >/dev/null || return 1
    declare -F plugin_install >/dev/null || return 1

    return 0
}
