#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/common.sh"

print_cleanup_summary() {

    echo

    echo "Cleanup Summary"
    echo "---------------"

    log_info "User cache      : ${CACHE_SIZE:-Unknown}"
    log_info "Temporary files : ${TMP_SIZE:-Unknown}"

    echo

    log_success "Cleanup audit completed."

}
