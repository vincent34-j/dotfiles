#!/usr/bin/env bash

dependency_status_installed() {
    printf "installed\n"
}

dependency_status_missing() {
    printf "missing\n"
}

dependency_status_failed() {
    printf "failed\n"
}

dependency_print_status() {

    local dependency="$1"
    local status="$2"

    printf "%-20s %s\n" \
        "$dependency" \
        "$status"
}
