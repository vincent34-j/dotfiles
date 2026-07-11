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

    unset NAME
    unset VERSION
    unset DESCRIPTION
    unset AUTHOR
    unset LICENSE
    unset DEPENDENCIES

    # shellcheck source=/dev/null
    source "${plugin_file}"

    load_plugin_manifest "${plugin_file}" || return 1

    validate_plugin || return 1
}
load_plugin_manifest() {
    local plugin_file="$1"
    local plugin_dir
    local manifest

    plugin_dir="$(dirname "${plugin_file}")"
    manifest="${plugin_dir}/plugin.manifest"

    [[ -f "${manifest}" ]] || return 1

    # shellcheck source=/dev/null
    source "${manifest}"
}
validate_plugin() {
    [[ -n "${NAME:-}" ]] || {
        echo "Plugin validation failed: NAME is missing."
        return 1
    }

    [[ -n "${VERSION:-}" ]] || {
        echo "Plugin validation failed: VERSION is missing."
        return 1
    }

    [[ -n "${DESCRIPTION:-}" ]] || {
        echo "Plugin validation failed: DESCRIPTION is missing."
        return 1
    }

    declare -p DEPENDENCIES >/dev/null 2>&1 || {
        echo "Plugin validation failed: DEPENDENCIES must be an array."
        return 1
    }

    declare -F plugin_install >/dev/null || {
        echo "Plugin validation failed: plugin_install() is missing."
        return 1
    }

    return 0
}
