#!/usr/bin/env bash

readonly CLI_NAME="Creator Workstation CLI"

CONSTANTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${CONSTANTS_DIR}/../.." && pwd)"

readonly CLI_VERSION="$(<"${PROJECT_ROOT}/VERSION")"
