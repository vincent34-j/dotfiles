#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/install/resolver.sh"
source "${SCRIPT_DIR}/install/dependencies.sh"
source "${SCRIPT_DIR}/dependency/run.sh"
source "${SCRIPT_DIR}/index/guard.sh"
source "${SCRIPT_DIR}/install/executor.sh"

install_run() {

    local plugin="$1"

    if [[ -z "$plugin" ]]; then
        echo "No plugin specified."
        return 1
    fi

    index_guard_ensure

    if ! install_resolver_exists "$plugin"; then
        echo "Plugin not found: $plugin"
        return 1
    fi

    echo
    echo "Installing plugin:"
    echo "  $plugin"

    echo
    echo "Dependencies:"
    echo

    install_dependencies_resolve "$plugin" | dependency_run

    echo

    install_executor_run "$plugin"
}
