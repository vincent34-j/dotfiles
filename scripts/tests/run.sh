#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo " Creator Workstation Test Suite"
echo "======================================"
echo

echo "[1/4] CLI tests"
bash "${SCRIPT_DIR}/test-cli.sh"

echo
echo "[2/4] Common library tests"
bash "${SCRIPT_DIR}/test-common.sh"

echo
echo "[3/4] File operation tests"
bash "${SCRIPT_DIR}/test-files.sh"

echo
echo "[4/4] Version tests"
bash "${SCRIPT_DIR}/test-version.sh"

echo
echo "======================================"
echo " All tests completed."
echo "======================================"
