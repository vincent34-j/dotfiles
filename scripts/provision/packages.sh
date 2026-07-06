#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../lib/common.sh"
source "${SCRIPT_DIR}/../lib/package-manager.sh"
source "${SCRIPT_DIR}/../lib/package-groups.sh"

main() {
    info "Package provisioning"

    update_package_database

    info "Installing Core packages"
    install_packages "${CORE_PACKAGES[@]}"

    info "Installing CLI packages"
    install_packages "${CLI_PACKAGES[@]}"

    info "Installing Development packages"
    install_packages "${DEV_PACKAGES[@]}"

    info "Installing Container packages"
    install_packages "${CONTAINER_PACKAGES[@]}"

    info "Installing Desktop packages"
    install_packages "${DESKTOP_PACKAGES[@]}"

    info "Installing Font packages"
    install_packages "${FONT_PACKAGES[@]}"

    success "Base package provisioning completed."
}

main "$@"
