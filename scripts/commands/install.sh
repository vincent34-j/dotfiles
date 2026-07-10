#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/dispatcher.sh"

run_install() {
    local target="${1:-}"

    initialize_plugin_engine

    [[ -z "${target}" ]] && return 0

    dispatch_plugin_lifecycle "${target}" install
}
