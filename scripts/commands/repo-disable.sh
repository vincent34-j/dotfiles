#!/usr/bin/env bash

run_repo_disable() {
    local name="${1:-}"

    if [[ -z "$name" ]]; then
        echo "Usage:"
        echo "    creator repo-disable <name>"
        return 1
    fi

    if [[ "$name" == "default" ]]; then
        echo "The default repository cannot be disabled."
        return 1
    fi

    local file="${PROJECT_ROOT}/repositories/${name}.repo"

    if [[ ! -f "$file" ]]; then
        echo "Repository not found: ${name}"
        return 1
    fi

    sed -i 's/^ENABLED=.*/ENABLED=false/' "$file"

    echo "Repository disabled: ${name}"
}
