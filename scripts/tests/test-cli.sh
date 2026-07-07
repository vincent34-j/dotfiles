#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${SCRIPT_DIR}/lib.sh"

echo "Running CLI tests..."

# Test: help (mặc định)
output="$(bash "${PROJECT_ROOT}/scripts/creator.sh")"
if printf '%s\n' "$output" | grep -q "Usage:"; then
    pass "Default help"
else
    fail "Default help"
fi

# Test: help command
output="$(bash "${PROJECT_ROOT}/scripts/creator.sh" help)"
if printf '%s\n' "$output" | grep -q "Usage:"; then
    pass "Help command"
else
    fail "Help command"
fi

# Test: unknown command
set +e
output="$(bash "${PROJECT_ROOT}/scripts/creator.sh" unknown 2>&1)"
status=$?
set -e

if [ "$status" -eq 1 ] &&
   printf '%s\n' "$output" | grep -q "Unknown command"; then
    pass "Unknown command"
else
    fail "Unknown command"
fi
