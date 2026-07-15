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
source "${SCRIPT_DIR}/commands/plugins.sh"
source "${SCRIPT_DIR}/commands/plugin-info.sh"
source "${SCRIPT_DIR}/commands/plugin-search.sh"
source "${SCRIPT_DIR}/commands/repos.sh"
source "${SCRIPT_DIR}/commands/repo-info.sh"
source "${SCRIPT_DIR}/commands/repo-add.sh"
source "${SCRIPT_DIR}/commands/repo-remove.sh"
source "${SCRIPT_DIR}/commands/repo-enable.sh"
source "${SCRIPT_DIR}/commands/repo-disable.sh"
source "${SCRIPT_DIR}/commands/repo-update.sh"
source "${SCRIPT_DIR}/commands/sync.sh"

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

        plugins)
            run_plugins
            ;;

        plugin-info)
            run_plugin_info "${target}"
            ;;

        plugin-search)
            run_plugin_search "${target}"
            ;;

        repos)
            run_repos
            ;;

        repo-info)
            run_repo_info "${target}"
            ;;

        repo-add)
            run_repo_add "${2:-}" "${3:-}"
            ;;

        repo-remove)
            run_repo_remove "${2:-}"
            ;;

        repo-enable)
            run_repo_enable "${2:-}"
            ;;

        repo-disable)
            run_repo_disable "${2:-}"
            ;;

        repo-update)
            run_repo_update "${2:-}"
            ;;

        sync)
            run_sync
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
