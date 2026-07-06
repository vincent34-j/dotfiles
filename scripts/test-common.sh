#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/common.sh"

check_command git "Git"

check_command python3 "Python"

check_command gh "GitHub CLI"

check_command code "VS Code"
