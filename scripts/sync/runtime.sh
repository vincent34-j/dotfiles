#!/usr/bin/env bash

sync_banner() {
    echo
    echo "========================================"
    echo " Creator Repository Synchronization"
    echo "========================================"
    echo
}

sync_start_time() {
    date +%s
}

sync_finish_time() {
    date +%s
}

sync_duration() {
    local start="$1"
    local finish="$2"

    echo $((finish - start))
}

sync_summary() {
    local updated="$1"
    local indexed="$2"
    local duration="$3"

    echo
    echo "Synchronization completed."
    echo
    echo "Repositories : ${updated}"
    echo "Plugins      : ${indexed}"
    echo "Duration     : ${duration}s"
}
