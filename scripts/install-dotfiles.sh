#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/lib/common.sh"

info "Installing Creator Workstation dotfiles..."

echo

info "[1/3] Git"
install_manifest "$ROOT_DIR/manifest/git.manifest"

echo

info "[2/3] Zsh"
install_manifest "$ROOT_DIR/manifest/zsh.manifest"

echo

info "[3/3] VS Code"
install_manifest "$ROOT_DIR/manifest/vscode.manifest"

echo

success "Installation completed."
