#!/usr/bin/env bash

declare -A PLUGIN_PATHS=()
declare -A PLUGIN_VERSIONS=()
declare -A PLUGIN_DESCRIPTIONS=()

registry_register_plugin() {
    local name="$1"
    local path="$2"
    local version="$3"
    local description="$4"

    PLUGIN_PATHS["$name"]="$path"
    PLUGIN_VERSIONS["$name"]="$version"
    PLUGIN_DESCRIPTIONS["$name"]="$description"
}

registry_get_path() {
    local name="$1"
    printf '%s\n' "${PLUGIN_PATHS[$name]}"
}

registry_get_version() {
    local name="$1"
    printf '%s\n' "${PLUGIN_VERSIONS[$name]}"
}

registry_get_description() {
    local name="$1"
    printf '%s\n' "${PLUGIN_DESCRIPTIONS[$name]}"
}

registry_has_plugin() {
    local name="$1"

    [[ -n "${PLUGIN_PATHS[$name]:-}" ]]
}
