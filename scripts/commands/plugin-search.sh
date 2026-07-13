#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

run_plugin_search() {
    local keyword="${1:-}"

    if [[ -z "${keyword}" ]]; then
        echo "Usage:"
        echo "    creator plugin-search <keyword>"
        return 1
    fi

    initialize_plugin_engine

    local found=0
    local plugin
    local description

    while IFS= read -r plugin; do
        description="$(registry_get_description "${plugin}")"

        if [[ "${plugin}" == *"${keyword}"* ]] || \
           [[ "${description,,}" == *"${keyword,,}"* ]]; then

            printf "%-15s %s\n" "${plugin}" "${description}"
            found=1
        fi
    done < <(registry_list_plugins)

    if [[ "${found}" -eq 0 ]]; then
        echo "No plugins found."
    fi
}
