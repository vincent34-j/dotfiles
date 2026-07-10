#!/usr/bin/env bash

show_help() {
    cat <<EOF
Creator Workstation CLI

Usage:
    creator <command>

Commands:
    doctor      Run workstation diagnostics
    info        Show workstation information
    status      Show workstation status
    cleanup     Clean temporary files
    update      Update workstation
    backup      Run backup tasks
    provision   Run provisioning
    install     Run installation
    config      Manage configuration
    version     Show CLI version
    help        Show this help message
EOF
}
