#!/usr/bin/env bash

declare -A PLUGIN_PATHS=()
declare -A PLUGIN_VERSIONS=()
declare -A PLUGIN_DESCRIPTIONS=()
declare -A PLUGIN_DEPENDENCIES=()

registry_register_plugin() {
    local name="$1"
    local path="$2"
    local version="$3"
    local description="$4"
    local dependencies="${5:-}"

    PLUGIN_PATHS["$name"]="$path"
    PLUGIN_VERSIONS["$name"]="$version"
    PLUGIN_DESCRIPTIONS["$name"]="$description"
    PLUGIN_DEPENDENCIES["$name"]="$dependencies"
}

registry_has_plugin() {
    local name="$1"

    [[ -v PLUGIN_PATHS["$name"] ]]
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

registry_get_dependencies() {
    local name="$1"
    printf '%s\n' "${PLUGIN_DEPENDENCIES[$name]}"
}

registry_list_plugins() {
    local plugin

    for plugin in "${!PLUGIN_PATHS[@]}"; do
        printf '%s\n' "${plugin}"
    done | sort
}

registry_plugin_count() {
    printf '%s\n' "${#PLUGIN_PATHS[@]}"
}
