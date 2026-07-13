#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

run_plugins() {
    initialize_plugin_engine

    printf "%-15s %-10s %s\n" \
        "NAME" \
        "VERSION" \
        "DESCRIPTION"

    printf "%-15s %-10s %s\n" \
        "---------------" \
        "----------" \
        "------------------------------"

    local plugin

    while IFS= read -r plugin; do
        printf "%-15s %-10s %s\n" \
            "${plugin}" \
            "$(registry_get_version "${plugin}")" \
            "$(registry_get_description "${plugin}")"
    done < <(registry_list_plugins)
}
