#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "${PROJECT_ROOT}/scripts/core/runtime.sh"
source "${PROJECT_ROOT}/scripts/core/filesystem.sh"
source "${PROJECT_ROOT}/scripts/core/environment.sh"
source "${PROJECT_ROOT}/scripts/core/state.sh"

source "${PROJECT_ROOT}/tests/lib/assert.sh"

creator_environment_init

plugin="integration-test"

plugin_state_remove "${plugin}"

plugin_state_set "${plugin}" "ready"

assert_true \
    "plugin_state_exists \"${plugin}\"" \
    "Integration state exists"

assert_equals \
    "ready" \
    "$(plugin_state_get "${plugin}")" \
    "Integration state value"

plugin_state_remove "${plugin}"

assert_false \
    "plugin_state_exists \"${plugin}\"" \
    "Integration state removed"
