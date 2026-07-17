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
readonly REQUIRED_PLUGIN_VARIABLES=(
    NAME
    VERSION
    DESCRIPTION
)

readonly REQUIRED_PLUGIN_FUNCTIONS=(
    plugin_install
)
validate_required_variable() {

    local variable="$1"

    [[ -n "${!variable:-}" ]] || {
        printf "Plugin validation failed: %s is missing.\n" "${variable}"
    return 1
    }

}
validate_required_function() {

    local function_name="$1"

    declare -F "${function_name}" >/dev/null || {
        printf "Plugin validation failed: %s() is missing.\n" "${function_name}"
    return 1
    }

}
validate_required_array() {

    local array_name="$1"

    declare -p "${array_name}" >/dev/null 2>&1 || {
        printf "Plugin validation failed: %s must be an array.\n" "${array_name}"
    return 1
    }

}
validate_plugin() {

    local variable
    local function_name

    for variable in "${REQUIRED_PLUGIN_VARIABLES[@]}"; do
        validate_required_variable "${variable}" || return 1
    done

    validate_required_array DEPENDENCIES || return 1

    for function_name in "${REQUIRED_PLUGIN_FUNCTIONS[@]}"; do
        validate_required_function "${function_name}" || return 1
    done

    return 0
}
