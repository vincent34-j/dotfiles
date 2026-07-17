#!/usr/bin/env bash

#
# Creator Workstation Test Assertions
#

set -euo pipefail

pass() {

    printf "PASS: %s\n" "$1"

}

fail() {

    printf "FAIL: %s\n" "$1"

    return 1

}

assert_true() {

    local condition="$1"
    local message="$2"

    if [[ "${condition}" == "true" ]]; then
        pass "${message}"
        return 0
    fi

    fail "${message}"

}

assert_false() {

    local condition="$1"
    local message="$2"

    if [[ "${condition}" == "false" ]]; then
        pass "${message}"
        return 0
    fi

    fail "${message}"

}

assert_equals() {

    local expected="$1"
    local actual="$2"
    local message="$3"

    if [[ "${expected}" == "${actual}" ]]; then
        pass "${message}"
        return 0
    fi

    printf "Expected: %s\n" "${expected}"
    printf "Actual:   %s\n" "${actual}"

    fail "${message}"

}
