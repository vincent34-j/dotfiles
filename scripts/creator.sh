#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR

PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
readonly PROJECT_ROOT

# Shared constants
# shellcheck source=/dev/null
source "${SCRIPT_DIR}/lib/constants.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/commands/help.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/commands/version.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/commands/doctor.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/commands/info.sh"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/commands/dispatcher.sh"

dispatch_command "${1:-help}" "${2:-}"
