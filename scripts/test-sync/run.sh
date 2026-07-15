#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
readonly PROJECT_ROOT

SCRIPT_DIR="${PROJECT_ROOT}/scripts"
readonly SCRIPT_DIR

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"
source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/index/builder.sh"

source "${SCRIPT_DIR}/plugin/runtime.sh"
source "${SCRIPT_DIR}/plugin/manifest.sh"
source "${SCRIPT_DIR}/plugin/parser.sh"
source "${SCRIPT_DIR}/plugin/metadata.sh"
source "${SCRIPT_DIR}/plugin/discovery.sh"

source "${SCRIPT_DIR}/repository/runtime.sh"

source "${SCRIPT_DIR}/sync/runtime.sh"
source "${SCRIPT_DIR}/sync/repositories.sh"
source "${SCRIPT_DIR}/sync/builder.sh"

source "${SCRIPT_DIR}/test-utils/repository.sh"

main() {

    echo "========================================"
    echo " Sync Engine Test Harness"
    echo "========================================"

    echo
    echo "Creating test repository..."
    echo

    ROOT="$(test_create_repository demo)"

    echo "Repository created:"
    echo "$ROOT"

echo
echo "Creating test plugin..."
echo

test_create_plugin \
demo \
docker \
3.1.0 \
"Docker Development Environment"

echo "Plugin created."

}

main "$@"

