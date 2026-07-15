#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/repository/registry.sh"

sync_repositories_enabled() {
    local file

    for file in "${PROJECT_ROOT}"/repositories/*.repo; do
        [[ -f "$file" ]] || continue

        # shellcheck disable=SC1090
        source "$file"

        if [[ "${ENABLED}" == "true" ]]; then
            echo "${NAME}"
        fi
    done
}
