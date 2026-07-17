#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "${PROJECT_ROOT}/scripts/core/runtime.sh"
source "${PROJECT_ROOT}/scripts/core/loader.sh"

source "${PROJECT_ROOT}/tests/lib/assert.sh"

load_plugin "${PROJECT_ROOT}/plugins/docker/plugin.sh"

assert_equals "docker" "${NAME}" "Plugin name"

assert_equals "1.0.0" "${VERSION}" "Plugin version"
