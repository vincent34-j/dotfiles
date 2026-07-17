#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "${PROJECT_ROOT}/scripts/core/runtime.sh"
source "${PROJECT_ROOT}/scripts/core/config.sh"

source "${PROJECT_ROOT}/tests/lib/assert.sh"

assert_equals \
    "${PROJECT_ROOT}/creator/docker.conf" \
    "$(config_file docker)" \
    "Config file path"

assert_equals \
    "true" \
    "$(config_exists docker && printf "true" || printf "false")" \
    "Config exists"

assert_equals \
    "latest" \
    "$(config_get docker VERSION)" \
    "Config VERSION"

assert_equals \
    "true" \
    "$(config_get docker ROOTLESS)" \
    "Config ROOTLESS"

assert_equals \
    "stable" \
    "$(config_get docker CHANNEL)" \
    "Config CHANNEL"

assert_equals \
    "hello" \
    "$(config_get docker UNKNOWN hello)" \
    "Config default key"

assert_equals \
    "1.0.0" \
    "$(config_get imaginary VERSION 1.0.0)" \
    "Config default file"
