#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/plugin/manifest.sh"

plugin_load() {
    local root="$1"

    plugin_manifest_load "$root"
}

plugin_name() {
    printf "%s\n" "${PLUGIN_NAME:-}"
}

plugin_version() {
    printf "%s\n" "${PLUGIN_VERSION:-}"
}

plugin_description() {
    printf "%s\n" "${PLUGIN_DESCRIPTION:-}"
}

plugin_dependencies() {
    printf "%s\n" "${PLUGIN_DEPENDENCIES:-}"
}

