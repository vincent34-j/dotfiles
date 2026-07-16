#!/usr/bin/env bash

state_root() {
    printf "%s\n" "${PROJECT_ROOT}/cache/state"
}

state_database() {
    printf "%s\n" "$(state_root)/plugins.db"
}

state_create_root() {
    mkdir -p "$(state_root)"
}

state_exists() {
    [[ -f "$(state_database)" ]]
}
