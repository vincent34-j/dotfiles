#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/common.sh"

info "Creator Workstation Bootstrap"
info "Starting bootstrap process..."

"$SCRIPT_DIR/install-dotfiles.sh"

success "Bootstrap completed successfully."
