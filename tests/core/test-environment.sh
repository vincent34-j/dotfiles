#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "${PROJECT_ROOT}/scripts/core/runtime.sh"
source "${PROJECT_ROOT}/scripts/core/filesystem.sh"
source "${PROJECT_ROOT}/scripts/core/environment.sh"

source "${PROJECT_ROOT}/tests/lib/assert.sh"

creator_environment_init

assert_true \
    "[[ -d \"${CREATOR_HOME}\" ]]" \
    "Creator home"

assert_true \
    "[[ -d \"${CREATOR_CACHE_DIR}\" ]]" \
    "Cache directory"

assert_true \
    "[[ -d \"${CREATOR_STATE_DIR}\" ]]" \
    "State directory"

assert_true \
    "[[ -d \"${CREATOR_RUNTIME_DIR}\" ]]" \
    "Runtime directory"

assert_true \
    "[[ -d \"${CREATOR_LOG_DIR}\" ]]" \
    "Log directory"
