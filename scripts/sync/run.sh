#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/sync/runtime.sh"
source "${SCRIPT_DIR}/sync/repositories.sh"
source "${SCRIPT_DIR}/commands/repo-update.sh"
source "${SCRIPT_DIR}/sync/builder.sh"

sync_run() {
    sync_banner

    local start
    start="$(sync_start_time)"

    echo
    echo "Running synchronization workflow..."
    echo

    local repositories=0
    local plugins=0

    while IFS= read -r repository; do
        echo "DEBUG repository=[$repository]"
    
        [[ -z "$repository" ]] && continue

        ((++repositories))

        run_repo_update "$repository"

    done < <(sync_repositories_enabled)

    echo
    echo "Building plugin index..."
    echo

    sync_builder_run

    plugins="$(index_db_count)"

    local finish
    finish="$(sync_finish_time)"

    sync_summary \
        "$repositories" \
        "$plugins" \
        "$(sync_duration "$start" "$finish")"
}

