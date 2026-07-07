#!/usr/bin/env bash

set -euo pipefail

LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Shared constants
# shellcheck source=/dev/null
source "${LIB_DIR}/constants.sh"
