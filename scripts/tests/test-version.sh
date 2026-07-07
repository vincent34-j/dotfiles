#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# shellcheck source=scripts/tests/lib.sh
source "${SCRIPT_DIR}/lib.sh"

# shellcheck source=scripts/lib/constants.sh
source "${PROJECT_ROOT}/scripts/lib/constants.sh"

echo "Running version tests..."

output="$(bash "${PROJECT_ROOT}/scripts/creator.sh" --version)"

if printf '%s\n' "$output" | grep -q "Version: ${CLI_VERSION}"; then
    pass "Version command"
else
    fail "Version command"
fi
