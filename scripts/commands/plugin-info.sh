#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

run_plugin_info() {
    local plugin="${1:-}"

    if [[ -z "${plugin}" ]]; then
        echo "Usage:"
        echo "    creator plugin-info <plugin>"
        return 1
    fi

    initialize_plugin_engine

    if ! registry_has_plugin "${plugin}"; then
        echo "Plugin not found: ${plugin}"
        return 1
    fi

    local deps
    deps="$(registry_get_dependencies "${plugin}")"

    [[ -z "${deps}" ]] && deps="-"

    printf "Plugin       : %s\n" "${plugin}"
    printf "Version      : %s\n" "$(registry_get_version "${plugin}")"
    printf "Description  : %s\n" "$(registry_get_description "${plugin}")"
    printf "Dependencies : %s\n" "${deps}"
}
