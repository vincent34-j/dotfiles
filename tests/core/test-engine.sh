#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "${PROJECT_ROOT}/scripts/core/runtime.sh"
source "${PROJECT_ROOT}/scripts/core/loader.sh"
source "${PROJECT_ROOT}/scripts/core/registry.sh"
source "${PROJECT_ROOT}/scripts/core/resolver.sh"
source "${PROJECT_ROOT}/scripts/core/dispatcher.sh"
source "${PROJECT_ROOT}/scripts/core/engine.sh"

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

assert_equals \
    "$(printf "Installing git...\nInstalling docker...")" \
    "${output}" \
    "Plugin install order"
