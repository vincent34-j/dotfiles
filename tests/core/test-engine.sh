#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/runtime.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/loader.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/registry.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/resolver.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/dispatcher.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/engine.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/tests/lib/assert.sh"

initialize_plugin_engine

assert_equals \
    "docker" \
    "$(registry_get_path docker >/dev/null && printf "docker")" \
    "Plugin registered"

assert_equals \
    "1.0.0" \
    "$(registry_get_version docker)" \
    "Plugin version"

assert_equals \
    "Docker Development Environment" \
    "$(registry_get_description docker)" \
    "Plugin description"

output="$(run_plugin_command install docker)"

expected="$(printf "%s\n%s\n%s\n%s" \
    "=== PRE-INSTALL HOOK ===" \
    "Installing git..." \
    "=== PRE-INSTALL HOOK ===" \
    "Installing docker...")"

assert_equals \
    "${expected}" \
    "${output}" \
    "Plugin install order"
