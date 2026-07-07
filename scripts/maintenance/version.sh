#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Shared bootstrap
# shellcheck source=/dev/null
source "${SCRIPT_DIR}/../lib/bootstrap.sh"

echo "${CLI_NAME}"
echo
echo "Version: ${CLI_VERSION}"
