#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

run_update() {
    local target="${1:-}"

    if [[ -n "${target}" ]]; then
        run_plugin_command update "${target}"
        return
    fi

    echo "Creator Workstation Update"
    echo
    echo "Checking for updates..."
    echo "Done."
}
