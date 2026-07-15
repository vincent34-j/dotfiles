#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/sync/runtime.sh"
source "${SCRIPT_DIR}/sync/run.sh"

run_sync() {
    sync_run
}

