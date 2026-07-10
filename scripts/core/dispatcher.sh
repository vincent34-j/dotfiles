#!/usr/bin/env bash

dispatch_plugin_install() {
    local plugin_name="$1"

    if ! registry_has_plugin "${plugin_name}"; then
        printf "Plugin '%s' not found\n" "${plugin_name}"
        return 1
    fi

    local plugin_file
    plugin_file="$(registry_get_path "${plugin_name}")"

    load_plugin "${plugin_file}"

    plugin_install
}
