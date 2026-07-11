#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/loader.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/registry.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/resolver.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/dispatcher.sh"

initialize_plugin() {
    local plugin_file="$1"
    local dependencies

    load_plugin "${plugin_file}"

    dependencies="${DEPENDENCIES[*]}"
    registry_register_plugin \
        "${NAME}" \
        "${plugin_file}" \
        "${VERSION}" \
        "${DESCRIPTION}" \
        "${dependencies}"
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

install_resolved_plugins() {
    local lifecycle="$1"
    local plugin

    while IFS= read -r plugin; do
        [[ -z "${plugin}" ]] && continue

        dispatch_plugin_lifecycle "${plugin}" "${lifecycle}"
    done
}

run_plugin_command() {
    local lifecycle="$1"
    local plugin="$2"

    initialize_plugin_engine

    resolve_plugin "${plugin}" |
        install_resolved_plugins "${lifecycle}"
}
