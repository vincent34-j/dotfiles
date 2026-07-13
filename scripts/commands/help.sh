#!/usr/bin/env bash

show_help() {
    cat <<EOF
Creator Workstation CLI

Usage:
    creator <command>

Commands:
    doctor         Run workstation diagnostics
    info           Show workstation information
    status         Show workstation status
    cleanup        Clean temporary files
    update         Update workstation
    backup         Run backup tasks
    provision      Run provisioning
    install        Run installation
    config         Manage configuration
    plugins        List installed plugins
    plugin-info    Show plugin metadata
    plugin-search  Search plugins
    new-plugin     Generate a new plugin
    repos          List configured repositories
    repo-info      Show repository metadata
    repo-add       Add a repository
    repo-remove    Remove a repository
    version        Show CLI version
    help           Show this help message
EOF
}
