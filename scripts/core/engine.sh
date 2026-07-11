#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/loader.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/registry.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/dispatcher.sh"

initialize_plugin() {
    local plugin_file="$1"

    load_plugin "${plugin_file}"

    registry_register_plugin \
        "$(plugin_get_name)" \
        "${plugin_file}" \
        "$(plugin_get_version)" \
        "$(plugin_get_description)"
}

initialize_plugin_engine() {
    local plugin_dir
    local plugin_file

    while IFS= read -r plugin_dir; do
        plugin_file="${plugin_dir}/plugin.sh"

        [[ -f "${plugin_file}" ]] || continue

        initialize_plugin "${plugin_file}"
    done < <(discover_plugin_directories)
}

run_plugin_command() {
    local lifecycle="$1"
    local plugin="$2"

    initialize_plugin_engine

    dispatch_plugin_lifecycle \
        "${plugin}" \
        "${lifecycle}"
}
