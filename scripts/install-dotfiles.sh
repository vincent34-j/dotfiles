#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Installing Creator Workstation dotfiles..."
echo

echo "[1/3] Git configuration"
echo "[2/3] Zsh configuration"
echo "[3/3] VS Code configuration"

echo
echo "Installation completed."
