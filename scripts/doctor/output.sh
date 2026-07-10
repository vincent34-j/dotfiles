#!/usr/bin/env bash

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/colors.sh"

PASS_COUNT=0
FAIL_COUNT=0

pass() {
    echo -e "${COLOR_GREEN}[PASS]${COLOR_RESET} $1"
    PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
    echo -e "${COLOR_RED}[FAIL]${COLOR_RESET} $1"
    FAIL_COUNT=$((FAIL_COUNT + 1))
}

info() {
    echo -e "${COLOR_BLUE}[INFO]${COLOR_RESET} $1"
}
