#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/loader.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/registry.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/dispatcher.sh"

run_install() {
    local target="${1:-}"
    local plugin_dir
    local plugin_file

    printf "Discovering plugins...\n"

    while IFS= read -r plugin_dir; do
        plugin_file="${plugin_dir}/plugin.sh"

        [[ -f "${plugin_file}" ]] || continue

        load_plugin "${plugin_file}"

        registry_register_plugin \
            "$(get_plugin_name)" \
            "${plugin_file}" \
            "$(get_plugin_version)" \
            "$(get_plugin_description)"

        printf "Loaded plugin: %s\n" "$(get_plugin_name)"
    done < <(discover_plugin_directories)

    if [[ -z "${target}" ]]; then
        return 0
    fi

    dispatch_plugin_install "${target}"
}
