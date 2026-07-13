#!/usr/bin/env bash

run_repo_remove() {
    local name="${1:-}"

    if [[ -z "${name}" ]]; then
        cat <<EOF
Usage:
    creator repo-remove <name>
EOF
        return 1
    fi

    if [[ "${name}" == "default" ]]; then
        echo "The default repository cannot be removed."
        return 1
    fi

    local manifest="${PROJECT_ROOT}/repositories/${name}.repo"

    if [[ ! -f "${manifest}" ]]; then
        echo "Repository not found: ${name}"
        return 1
    fi

    rm -f "${manifest}"

    if declare -F repository_cache_path >/dev/null; then
        rm -rf "$(repository_cache_path "${name}")"
    fi

    echo "Repository removed: ${name}"
}
