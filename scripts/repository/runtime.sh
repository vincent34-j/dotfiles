#!/usr/bin/env bash

repository_cache_root() {
    printf "%s/cache/repositories\n" "${PROJECT_ROOT}"
}

repository_cache_path() {
    local repository="$1"

    printf "%s/%s\n" \
        "$(repository_cache_root)" \
        "${repository}"
}

repository_cache_exists() {
    local repository="$1"

    [[ -d "$(repository_cache_path "${repository}")" ]]
}

repository_cache_create() {
    local repository="$1"

    mkdir -p "$(repository_cache_path "${repository}")"
}

repository_manifest_path() {
    local repository="$1"

    printf "%s/repositories/%s.repo\n" \
        "${PROJECT_ROOT}" \
        "${repository}"
}

repository_manifest_exists() {
    local repository="$1"

    [[ -f "$(repository_manifest_path "${repository}")" ]]
}

repository_manifest_write() {
    local name="$1"
    local description="$2"
    local url="$3"
    local branch="$4"
    local priority="$5"
    local enabled="$6"

    cat > "$(repository_manifest_path "${name}")" <<EOF
NAME="${name}"

DESCRIPTION="${description}"

URL="${url}"

BRANCH="${branch}"

PRIORITY=${priority}

ENABLED=${enabled}
EOF
}
