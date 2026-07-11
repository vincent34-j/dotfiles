#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/engine.sh"

show_info() {
    local target="${1:-}"

    if [[ -n "${target}" ]]; then
        run_plugin_command info "${target}"
        return
    fi

    cat <<EOF
Creator Workstation CLI

Version : ${CLI_VERSION}
Project : Creator Workstation
Shell   : ${SHELL}
User    : ${USER}
Host    : $(hostname)
Kernel  : $(uname -r)
EOF
}
