#!/usr/bin/env bash

if [[ -n "${CREATOR_RUNTIME_LOADED:-}" ]]; then
    return 0
fi

readonly CREATOR_RUNTIME_LOADED=1

PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
readonly PROJECT_ROOT

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly SCRIPT_DIR
