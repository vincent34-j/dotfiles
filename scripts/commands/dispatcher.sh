#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/commands/help.sh"
source "${SCRIPT_DIR}/commands/version.sh"
source "${SCRIPT_DIR}/commands/info.sh"
source "${SCRIPT_DIR}/commands/status.sh"
source "${SCRIPT_DIR}/commands/cleanup.sh"
source "${SCRIPT_DIR}/commands/update.sh"
source "${SCRIPT_DIR}/commands/backup.sh"
source "${SCRIPT_DIR}/commands/provision.sh"
source "${SCRIPT_DIR}/commands/install.sh"
source "${SCRIPT_DIR}/commands/config.sh"
source "${SCRIPT_DIR}/commands/doctor.sh"

dispatch_command() {
    case "${1:-help}" in
        help|-h|--help)
            show_help
            ;;

        doctor)
            run_doctor
            ;;

        info)
            show_info
            ;;

        status)
            show_status
            ;;

        cleanup)
            run_cleanup
            ;;

        update)
            run_update
            ;;

        backup)
            run_backup
            ;;

        provision)
            run_provision
            ;;

        install)
            run_install
            ;;

        config)
            run_config
            ;;

        version|-v|--version)
            show_version
            ;;

        *)
            echo "Unknown command: ${1}"
            echo
            show_help
            exit 1
            ;;
    esac
}
