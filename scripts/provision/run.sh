#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../lib/common.sh"

run_module() {
    local module="$1"

    info "Running ${module}"

    bash "${SCRIPT_DIR}/${module}"
}

main() {
    run_module repositories.sh
    run_module packages.sh
    run_module services.sh
    run_module fonts.sh
    run_module cleanup.sh
}

main "$@"
