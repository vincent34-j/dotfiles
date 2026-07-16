#!/usr/bin/env bash

#
# Creator Workstation State Engine
#

# -----------------------------------------------------------------------------
# Sources
# -----------------------------------------------------------------------------

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/environment.sh"

# -----------------------------------------------------------------------------
# Public Functions
# -----------------------------------------------------------------------------

plugin_state_exists() {

    local plugin="$1"

    creator_environment_init

    file_exists "$(state_file_path "${plugin}")"

}

plugin_state_get() {

    local plugin="$1"
    local state_file

    creator_environment_init

    state_file="$(state_file_path "${plugin}")"

    [[ -f "${state_file}" ]] || return 1

    grep '^STATE=' "${state_file}" | cut -d '=' -f2

}

plugin_state_set() {

    local plugin="$1"
    local state="$2"

    creator_environment_init

    cat > "$(state_file_path "${plugin}")" <<EOF
STATE=${state}
EOF

}

plugin_state_remove() {

    local plugin="$1"

    creator_environment_init

    safe_remove "$(state_file_path "${plugin}")"

}

# -----------------------------------------------------------------------------
# Private Functions
# -----------------------------------------------------------------------------

state_file_path() {

    local plugin="$1"

    printf "%s/%s.state\n" "${CREATOR_STATE_DIR}" "${plugin}"

}

