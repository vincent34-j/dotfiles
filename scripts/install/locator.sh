#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/sync/repositories.sh"
source "${SCRIPT_DIR}/repository/backend.sh"

install_locator_find() {

    local plugin="$1"

    local repository

    while IFS= read -r repository; do

        [[ -z "$repository" ]] && continue

        local root
        root="$(repository_worktree "$repository")"

        local candidate="${root}/plugins/${plugin}"

        if [[ -d "$candidate" ]]; then
            printf "%s\n" "$candidate"
            return 0
        fi

    done < <(
        sync_repositories_enabled
    )

    return 1
}
