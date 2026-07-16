#!/usr/bin/env bash

#
# Creator Workstation Environment
#

# -----------------------------------------------------------------------------
# Sources
# -----------------------------------------------------------------------------

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/filesystem.sh"

# -----------------------------------------------------------------------------
# Constants
# -----------------------------------------------------------------------------

readonly XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

readonly CREATOR_HOME="${XDG_DATA_HOME}/creator"

readonly CREATOR_CACHE_DIR="${CREATOR_HOME}/cache"

readonly CREATOR_STATE_DIR="${CREATOR_HOME}/state"

readonly CREATOR_RUNTIME_DIR="${CREATOR_HOME}/runtime"

readonly CREATOR_LOG_DIR="${CREATOR_HOME}/logs"

# -----------------------------------------------------------------------------
# Public Functions
# -----------------------------------------------------------------------------

creator_environment_init() {

    safe_create_directory "${CREATOR_HOME}"

    safe_create_directory "${CREATOR_CACHE_DIR}"

    safe_create_directory "${CREATOR_STATE_DIR}"

    safe_create_directory "${CREATOR_RUNTIME_DIR}"

    safe_create_directory "${CREATOR_LOG_DIR}"

    return 0

}
