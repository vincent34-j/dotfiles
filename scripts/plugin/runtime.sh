#!/usr/bin/env bash

plugin_manifest_name() {
    local root="$1"

    printf "%s/plugin.manifest\n" "$root"
}

plugin_manifest_exists() {
    local root="$1"

    [[ -f "$(plugin_manifest_name "$root")" ]]
}

plugin_cache_root() {
    printf "%s/cache/plugins\n" "$PROJECT_ROOT"
}

plugin_cache_create() {
    mkdir -p "$(plugin_cache_root)"
}
