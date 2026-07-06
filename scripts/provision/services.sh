#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../lib/common.sh"
source "${SCRIPT_DIR}/../lib/service-manager.sh"
source "${SCRIPT_DIR}/../lib/service-groups.sh"

main() {
    info "Service provisioning"

    info "Enabling Core services"
    enable_services "${CORE_SERVICES[@]}"

    info "Starting Core services"
    start_services "${CORE_SERVICES[@]}"

    info "Enabling Container services"
    enable_services "${CONTAINER_SERVICES[@]}"

    info "Starting Container services"
    start_services "${CONTAINER_SERVICES[@]}"

    info "Enabling Desktop services"
    enable_services "${DESKTOP_SERVICES[@]}"

    info "Starting Desktop services"
    start_services "${DESKTOP_SERVICES[@]}"

    success "Service provisioning completed."
}

main "$@"
