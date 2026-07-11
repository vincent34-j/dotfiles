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
source "${SCRIPT_DIR}/commands/new-plugin.sh"

dispatch_command() {
    local command="${1:-help}"
    local target="${2:-}"

    case "${command}" in
        help|-h|--help)
            show_help
            ;;

        doctor)
            run_doctor "${target}"
            ;;

        info)
            show_info "${target}"
            ;;

        status)
            show_status
            ;;

        cleanup)
            run_cleanup
            ;;

        update)
            run_update "${target}"
            ;;

        backup)
            run_backup
            ;;

        provision)
            run_provision
            ;;

        install)
            run_install "${target}"
            ;;

        config)
            run_config
            ;;

        new-plugin)
            run_new_plugin "${target}"
            ;;

        version|-v|--version)
            show_version
            ;;

        *)
            printf "Unknown command: %s\n\n" "${command}"
            show_help
            return 1
            ;;
    esac
}
