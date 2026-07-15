#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"
source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/index/query.sh"

run_plugin_search() {
    local keyword="${1:-}"

    if [[ -z "${keyword}" ]]; then
        echo "Usage:"
        echo "    creator plugin-search <keyword>"
        return 1
    fi

    local found=0
    local record

    while IFS= read -r record; do

        IFS='|' read -r \
            plugin \
            version \
            repository \
            description \
            dependencies <<< "$record"

        if [[ "${plugin,,}" == *"${keyword,,}"* ]] || \
           [[ "${description,,}" == *"${keyword,,}"* ]]; then

            printf "%-15s %s\n" \
                "${plugin}" \
                "${description}"

            found=1
        fi

    done < <(
        index_query_all
    )

    if [[ "${found}" -eq 0 ]]; then
        echo "No plugins found."
    fi
}
