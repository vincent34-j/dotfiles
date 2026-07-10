#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/common.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/filesystem.sh"

scan_tmp() {

    log_info "Scanning temporary directory..."

    if [[ -d "/tmp" ]]; then

        TMP_SIZE=$(get_directory_size "/tmp")
        TMP_SIZE=$(echo "${TMP_SIZE}" | awk '{print $1}')

        log_info "Temporary files : ${TMP_SIZE}"

    else

        log_warning "/tmp not found."

    fi

}
