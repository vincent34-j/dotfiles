#!/usr/bin/env bash

check_version_file() {
    if [[ -f "${PROJECT_ROOT}/VERSION" ]]; then
        pass "VERSION file"
    else
        fail "VERSION file"
    fi
}

check_changelog() {
    if [[ -f "${PROJECT_ROOT}/CHANGELOG.md" ]]; then
        pass "CHANGELOG"
    else
        fail "CHANGELOG"
    fi
}

check_test_suite() {
    if [[ -f "${PROJECT_ROOT}/scripts/tests/run.sh" ]]; then
        pass "Test Suite"
    else
        fail "Test Suite"
    fi
}

check_github_actions() {
    if [[ -f "${PROJECT_ROOT}/.github/workflows/ci.yml" ]]; then
        pass "GitHub Actions"
    else
        fail "GitHub Actions"
    fi
}
