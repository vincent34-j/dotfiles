#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../lib/common.sh"
source "${SCRIPT_DIR}/../lib/package-manager.sh"
source "${SCRIPT_DIR}/../lib/font-manager.sh"
source "${SCRIPT_DIR}/../lib/font-groups.sh"

main() {
    info "Font provisioning"

    info "Installing Programming fonts"
    install_packages "${PROGRAMMING_FONTS[@]}"

    info "Installing UI fonts"
    install_packages "${UI_FONTS[@]}"

    info "Installing Emoji fonts"
    install_packages "${EMOJI_FONTS[@]}"

    info "Installing CJK fonts"
    install_packages "${CJK_FONTS[@]}"

    refresh_font_cache

    success "Font provisioning completed."
}

main "$@"
