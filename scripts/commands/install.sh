#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/dispatcher.sh"

run_install() {
    local target="${1:-}"

    [[ -z "${target}" ]] && return 0

    run_plugin_command install "${target}"
}
