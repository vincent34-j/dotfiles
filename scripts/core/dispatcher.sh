#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/registry.sh"

dispatch_plugin() {
    local plugin_name="$1"

    if registry_has_plugin "$plugin_name"; then
        printf "Plugin '%s' found\n" "$plugin_name"
        return 0
    fi

    printf "Plugin '%s' not found\n" "$plugin_name"
    return 1
}
