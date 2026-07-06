#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/common.sh"

enable_services() {
    if [ "$#" -eq 0 ]; then
        return 0
    fi

    info "Enabling services: $*"

    sudo systemctl enable "$@"

    success "Services enabled."
}

enable_service() {
    enable_services "$@"
}

start_services() {
    if [ "$#" -eq 0 ]; then
        return 0
    fi

    info "Starting services: $*"

    sudo systemctl start "$@"

    success "Services started."
}

start_service() {
    start_services "$@"
}
