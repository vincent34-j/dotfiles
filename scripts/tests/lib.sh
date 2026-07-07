#!/usr/bin/env bash

set -euo pipefail

pass() {
    printf '[PASS] %s\n' "$1"
}

fail() {
    printf '[FAIL] %s\n' "$1"
    exit 1
}
