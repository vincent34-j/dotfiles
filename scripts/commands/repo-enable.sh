#!/usr/bin/env bash

run_repo_enable() {
    local name="${1:-}"

    if [[ -z "$name" ]]; then
        echo "Usage:"
        echo "    creator repo-enable <name>"
        return 1
    fi

    local file="${PROJECT_ROOT}/repositories/${name}.repo"

    if [[ ! -f "$file" ]]; then
        echo "Repository not found: ${name}"
        return 1
    fi

    sed -i 's/^ENABLED=.*/ENABLED=true/' "$file"

    echo "Repository enabled: ${name}"
}
