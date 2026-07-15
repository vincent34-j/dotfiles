#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/install/locator.sh"

install_executor_run() {

    local plugin="$1"

    local plugin_root
    plugin_root="$(install_locator_find "$plugin")" || {
        echo "Plugin not found: $plugin"
        return 1
    }

    local script="${plugin_root}/plugin.sh"

    if [[ ! -f "$script" ]]; then
        echo "plugin.sh missing."
        return 1
    fi

    bash "$script" install
}
