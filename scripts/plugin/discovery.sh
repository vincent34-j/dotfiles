#!/usr/bin/env bash

plugin_discovery_find() {
    local repository_root="$1"

    find "$repository_root" \
        -type f \
        -name plugin.manifest \
        -printf '%h\n' \
        | sort
}
