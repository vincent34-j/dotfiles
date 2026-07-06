#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../lib/common.sh"

main() {
    info "Repository provisioning"

    # TODO:
    # - Detect distribution
    # - Configure repositories
    # - Refresh package database
}

main "$@"
