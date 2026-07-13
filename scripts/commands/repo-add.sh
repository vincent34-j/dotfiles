#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/repository/runtime.sh"

run_repo_add() {
    local name="${1:-}"
    local url="${2:-}"

    if [[ -z "${name}" || -z "${url}" ]]; then
        echo "Usage:"
        echo "    creator repo-add <name> <url>"
        return 1
    fi

    if [[ ! "${name}" =~ ^[a-z0-9._-]+$ ]]; then
        echo "Invalid repository name: ${name}"
        return 1
    fi

    if [[ ! "${url}" =~ ^https:// ]]; then
        echo "Invalid repository URL."
        return 1
    fi

    if repository_manifest_exists "${name}"; then
        echo "Repository already exists: ${name}"
        return 1
    fi

    local description

    description="$(tr '[:lower:]' '[:upper:]' <<< "${name:0:1}")${name:1} Repository"

    repository_manifest_write \
                "${name}" \
                "${description}" \
                "${url}" \
                 main \
                 50 \
                 true

    echo "Repository added: ${name}"
}
