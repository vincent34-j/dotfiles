#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/repository/runtime.sh"
source "${SCRIPT_DIR}/repository/backend.sh"
source "${SCRIPT_DIR}/repository/metadata.sh"

update_single_repository() {
    local file="$1"

    # shellcheck disable=SC1090
    source "$file"

    repository_cache_create "$NAME"

    if ! repository_is_cloned "$NAME"; then
        repository_clone \
            "$NAME" \
            "$URL" \
            "$BRANCH"
    else
        repository_fetch "$NAME"
        repository_checkout "$NAME" "$BRANCH"
        repository_pull "$NAME"
    fi

    repository_metadata_write \
        "$NAME" \
        revision \
        "$(repository_revision "$NAME")"

    repository_metadata_write \
        "$NAME" \
        updated \
        "$(date +%F)"

    echo "Repository updated: $NAME"
}

run_repo_update() {
    local target="${1:---all}"

    if [[ "$target" == "--all" ]]; then

        local found=false

        local file

        for file in "${PROJECT_ROOT}"/repositories/*.repo; do

            [[ -f "$file" ]] || continue

            found=true

            update_single_repository "$file"

        done

        if [[ "$found" == false ]]; then
            echo "No repositories configured."
            return 1
        fi

        return 0
    fi

    local file="${PROJECT_ROOT}/repositories/${target}.repo"

    if [[ ! -f "$file" ]]; then
        echo "Repository not found: ${target}"
        return 1
    fi

    update_single_repository "$file"
}
