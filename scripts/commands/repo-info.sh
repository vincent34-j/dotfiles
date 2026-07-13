#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/repository/registry.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/repository/loader.sh"

run_repo_info() {
    local repo="${1:-}"

    if [[ -z "${repo}" ]]; then
        echo "Usage:"
        echo "    creator repo-info <repository>"
        return 1
    fi

    initialize_repository_engine

    if ! repository_has "${repo}"; then
        echo "Repository not found: ${repo}"
        return 1
    fi

    printf "Repository : %s\n" "${repo}"
    printf "Description: %s\n" \
        "$(repository_get_description "${repo}")"
    printf "URL        : %s\n" \
        "$(repository_get_url "${repo}")"
    printf "Branch     : %s\n" \
        "$(repository_get_branch "${repo}")"
    printf "Priority   : %s\n" \
        "$(repository_get_priority "${repo}")"
    printf "Enabled    : %s\n" \
        "$(repository_get_enabled "${repo}")"
}
