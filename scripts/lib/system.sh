#!/usr/bin/env bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

binary_version() {
    local binary="$1"

    if ! command_exists "${binary}"; then
        return 1
    fi

    "${binary}" --version | head -n1
}

print_status_ok() {
    printf "  [OK] %s\n" "$1"
}

print_status_warn() {
    printf "  [WARN] %s\n" "$1"
}

print_status_fail() {
    printf "  [FAIL] %s\n" "$1"
}
