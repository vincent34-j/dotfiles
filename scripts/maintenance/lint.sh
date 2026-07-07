#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

echo "======================================"
echo " Creator Workstation Linter"
echo "======================================"
echo

echo "[1/2] Bash syntax check..."
find "${PROJECT_ROOT}/scripts" -type f -name "*.sh" -exec bash -n {} \;

echo
echo "[2/2] ShellCheck..."
find "${PROJECT_ROOT}/scripts" -type f -name "*.sh" -exec shellcheck -x {} \;

echo
echo "======================================"
echo " Lint completed successfully."
echo "======================================"
