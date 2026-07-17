#!/usr/bin/env bash

if [[ -n "${CREATOR_FILESYSTEM_LOADED:-}" ]]; then
    return 0
fi

readonly CREATOR_FILESYSTEM_LOADED=1

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly CURRENT_DIR

# shellcheck source=/dev/null
source "${CURRENT_DIR}/common.sh"

directory_exists() {

    [[ -d "$1" ]]

}

file_exists() {

    [[ -f "$1" ]]

}

get_directory_size() {

    local dir="$1"

    if [[ ! -d "${dir}" ]]; then
        echo "0B"
        return
    fi

    du -sh "${dir}" 2>/dev/null || true

}

safe_create_directory() {

    local dir="$1"

    if directory_exists "${dir}"; then
        return 0
    fi

    mkdir -p "${dir}"

}

safe_remove() {

    local target="$1"

    if [[ ! -e "${target}" ]]; then
        return 0
    fi

    rm -rf "${target}"

}

safe_copy() {

    local source_path="$1"
    local destination_path="$2"

    if [[ ! -e "${source_path}" ]]; then
        return 1
    fi

    cp -a "${source_path}" "${destination_path}"

}
