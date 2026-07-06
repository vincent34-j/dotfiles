#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo " Creator Workstation Bootstrap"
echo "======================================"

"$SCRIPT_DIR/install-dotfiles.sh"

echo
echo "Bootstrap completed successfully."
