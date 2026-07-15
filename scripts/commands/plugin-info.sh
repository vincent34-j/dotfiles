#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"
source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/index/query.sh"

run_plugin_info() {
    local plugin="${1:-}"

    if [[ -z "${plugin}" ]]; then
        echo "Usage:"
        echo "    creator plugin-info <plugin>"
        return 1
    fi

    if ! index_query_exists "${plugin}"; then
        echo "Plugin not found: ${plugin}"
        return 1
    fi

    local dependencies
    dependencies="$(index_query_dependencies "${plugin}")"

    [[ -z "${dependencies}" ]] && dependencies="-"

    printf "Plugin       : %s\n" "${plugin}"
    printf "Version      : %s\n" "$(index_query_version "${plugin}")"
    printf "Description  : %s\n" "$(index_query_description "${plugin}")"
    printf "Repository   : %s\n" "$(index_query_repository "${plugin}")"
    printf "Dependencies : %s\n" "${dependencies}"
}
