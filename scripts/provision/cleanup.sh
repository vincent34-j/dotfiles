#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../lib/common.sh"
source "${SCRIPT_DIR}/../lib/package-manager.sh"

main() {
    info "Cleanup provisioning"

    cleanup_package_cache

    success "Cleanup provisioning completed."
}

main "$@"
