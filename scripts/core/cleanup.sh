#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/common.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/cache.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/tmp.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/summary.sh"

cleanup_workspace() {
    log_info "Scanning cleanup targets..."

    echo

    scan_cache

    echo

    scan_tmp

    print_cleanup_summary
}
