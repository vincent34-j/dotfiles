#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/install/run.sh"

run_install() {

    local target="${1:-}"

    if [[ -z "$target" ]]; then
        echo "Usage:"
        echo "    creator install <plugin>"
        return 1
    fi

    install_run "$target"
}
