#!/usr/bin/env bash

load_repository() {
    local repository_file="$1"

    unset \
        NAME \
        DESCRIPTION \
        URL \
        BRANCH \
        PRIORITY \
        ENABLED

    # shellcheck disable=SC1090
    source "${repository_file}"

    repository_register \
        "${NAME}" \
        "${URL}" \
        "${DESCRIPTION}" \
        "${BRANCH}" \
        "${PRIORITY}" \
        "${ENABLED}"
}

discover_repositories() {
    find "${PROJECT_ROOT}/repositories" \
        -maxdepth 1 \
        -type f \
        -name "*.repo" \
        | sort
}

initialize_repository_engine() {
    local repository

    while IFS= read -r repository; do
        [[ -f "${repository}" ]] || continue
        load_repository "${repository}"
    done < <(discover_repositories)
}
