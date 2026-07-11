#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

run_doctor() {
    local target="${1:-}"

    [[ -z "${target}" ]] && return 0

    run_plugin_command doctor "${target}"
}
