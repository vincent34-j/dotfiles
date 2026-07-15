#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/plugin/runtime.sh"

plugin_manifest_load() {
    local root="$1"

    local manifest
    manifest="$(plugin_manifest_name "$root")"

    if [[ ! -f "$manifest" ]]; then
        return 1
    fi

    # shellcheck disable=SC1090
    source "$manifest"
}

plugin_manifest_is_valid() {
    local root="$1"

    plugin_manifest_exists "$root"
}
