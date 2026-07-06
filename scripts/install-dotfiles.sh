#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/lib/common.sh"

info "Installing Creator Workstation dotfiles..."

echo

info "[1/3] Git"

install_file \
    "$ROOT_DIR/config/git/.gitconfig" \
    "$HOME/.gitconfig"

install_file \
    "$ROOT_DIR/config/git/.gitignore_global" \
    "$HOME/.gitignore_global"

echo

info "[2/3] Zsh"

install_file \
    "$ROOT_DIR/config/zsh/.zshrc" \
    "$HOME/.zshrc"

install_file \
    "$ROOT_DIR/config/zsh/.p10k.zsh" \
    "$HOME/.p10k.zsh"

echo

info "[3/3] VS Code"

ensure_directory "$HOME/.config/Code/User"

install_file \
    "$ROOT_DIR/config/vscode/settings.json" \
    "$HOME/.config/Code/User/settings.json"

echo

success "Installation completed."
