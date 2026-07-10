#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/common.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/filesystem.sh"

scan_cache() {

    log_info "Scanning user cache..."

    if [[ -d "${HOME}/.cache" ]]; then

        CACHE_SIZE=$(get_directory_size "${HOME}/.cache")
        CACHE_SIZE=$(echo "${CACHE_SIZE}" | awk '{print $1}')

        log_info "User cache size : ${CACHE_SIZE}"

    else

        log_warning "User cache not found."

    fi

}
