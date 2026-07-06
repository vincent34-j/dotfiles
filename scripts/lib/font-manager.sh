#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/common.sh"

refresh_font_cache() {
    info "Refreshing font cache"

    fc-cache -f

    success "Font cache refreshed."
}
