#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/cleanup.sh"

run_cleanup() {
    echo "Creator Workstation Cleanup"
    echo

    cleanup_workspace
}
