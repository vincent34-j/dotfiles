#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

TEST_DIR="${PROJECT_ROOT}/tests/core"
INTEGRATION_TEST_DIR="${PROJECT_ROOT}/tests/integration"

for test_file in "${TEST_DIR}"/test-*.sh; do

    printf "Running %s...\n\n" "$(basename "${test_file}")"

    bash "${test_file}"

    printf "\n--------------------------------\n\n"

done

for test_file in "${INTEGRATION_TEST_DIR}"/test-*.sh; do

    printf "Running %s...\n\n" "$(basename "${test_file}")"

    bash "${test_file}"

    printf "\n--------------------------------\n\n"

done

printf "All tests passed.\n"
