#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/repository/registry.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/repository/loader.sh"

run_repos() {
    initialize_repository_engine

    printf "%-15s %-10s %s\n" \
        "NAME" \
        "PRIORITY" \
        "ENABLED"

    printf "%-15s %-10s %s\n" \
        "---------------" \
        "----------" \
        "----------"

    local repo

    while IFS= read -r repo; do
        printf "%-15s %-10s %s\n" \
            "${repo}" \
            "$(repository_get_priority "${repo}")" \
            "$(repository_get_enabled "${repo}")"
    done < <(repository_list)
}
