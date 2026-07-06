#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/common.sh"

detect_package_manager() {
    if command_exists pacman; then
        echo "pacman"
        return
    fi

    if command_exists apt; then
        echo "apt"
        return
    fi

    if command_exists dnf; then
        echo "dnf"
        return
    fi

    error "Unsupported package manager."
    exit 1
}

PACKAGE_MANAGER="$(detect_package_manager)"
readonly PACKAGE_MANAGER

update_package_database() {
    case "${PACKAGE_MANAGER}" in
        pacman)
            info "Updating package database (pacman)"
            sudo pacman -Sy
            ;;
        apt)
            info "Updating package database (apt)"
            sudo apt update
            ;;
        dnf)
            info "Updating package database (dnf)"
            sudo dnf makecache
            ;;
    esac

    success "Package database updated."
}

install_packages() {
    if [ "$#" -eq 0 ]; then
        return 0
    fi

    case "${PACKAGE_MANAGER}" in
        pacman)
            info "Installing packages with pacman: $*"
            sudo pacman -S --needed "$@"
            ;;
        apt)
            info "Installing packages with apt: $*"
            sudo apt install -y "$@"
            ;;
        dnf)
            info "Installing packages with dnf: $*"
            sudo dnf install -y "$@"
            ;;
    esac

    success "Package installation completed."
}

install_package() {
    install_packages "$@"
}
