#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Shared bootstrap
# shellcheck source=../lib/bootstrap.sh
source "${SCRIPT_DIR}/../lib/bootstrap.sh"

echo "${CLI_NAME}"
echo
echo "Preparing release..."
echo

echo "Version : ${CLI_VERSION}"
echo "Branch  : $(git branch --show-current)"
echo

if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Error: Working tree is not clean."
    exit 1
fi

echo "Working tree is clean."
echo
echo "Release checks passed."
