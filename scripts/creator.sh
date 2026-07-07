#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Shared constants
# shellcheck source=/dev/null
source "${SCRIPT_DIR}/lib/constants.sh"

show_help() {
cat <<EOF
${CLI_NAME}

Usage:
    creator <command>

Commands:
    doctor         Run workstation health checks
    cleanup        Clean temporary files
    update         Update workstation
    info           Show system information
    version        Show CLI version
    provision      Run provisioning framework
    help           Show this help message

EOF
}

case "${1:-help}" in
    help|-h|--help)
        show_help
        ;;
    version|-v|--version)
    "${SCRIPT_DIR}/maintenance/version.sh"
    ;;
    *)
        echo "Unknown command: ${1}"
        echo
        show_help
        exit 1
        ;;
esac
