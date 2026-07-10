#!/usr/bin/env bash

dispatch_plugin_lifecycle() {
    local plugin_name="$1"
    local lifecycle="$2"

    if ! registry_has_plugin "${plugin_name}"; then
        printf "Plugin '%s' not found\n" "${plugin_name}"
        return 1
    fi

    local plugin_file
    plugin_file="$(registry_get_path "${plugin_name}")"

    load_plugin "${plugin_file}"

    local function_name="plugin_${lifecycle}"

    if ! declare -F "${function_name}" >/dev/null; then
        printf "Plugin '%s' does not implement '%s'\n" \
            "${plugin_name}" \
            "${function_name}"
        return 1
    fi

    "${function_name}"
}
