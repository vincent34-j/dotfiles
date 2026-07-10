#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/../lib/common.sh"

echo "Running file operation tests..."

TEST_ROOT="/tmp/dotfiles-test"

ensure_directory "${TEST_ROOT}"

echo "hello" > "${TEST_ROOT}/file.txt"

backup_file "${TEST_ROOT}/file.txt"

create_symlink \
"${TEST_ROOT}/file.txt" \
"${TEST_ROOT}/file-link.txt"

rm -rf "${TEST_ROOT}"

echo
echo "File operation tests completed."
