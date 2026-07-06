#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/common.sh"

info "Installing Creator Workstation dotfiles..."

info "[1/3] Git configuration"
info "[2/3] Zsh configuration"
info "[3/3] VS Code configuration"

success "Installation completed."
