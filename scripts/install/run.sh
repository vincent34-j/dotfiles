#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/install/resolver.sh"
source "${SCRIPT_DIR}/install/dependencies.sh"
source "${SCRIPT_DIR}/dependency/run.sh"
source "${SCRIPT_DIR}/repository/runtime.sh"
source "${SCRIPT_DIR}/index/guard.sh"
source "${SCRIPT_DIR}/state/guard.sh"
source "${SCRIPT_DIR}/state/update.sh"
source "${SCRIPT_DIR}/install/executor.sh"

install_require_repository_cache() {

    if [[ -d "$(repository_cache_root)" ]]; then
        return 0
    fi

    echo
    echo "Repository cache not found."
    echo
    echo "Please run:"
    echo "  creator sync"
    echo

    return 1
}

install_run() {

    local plugin="$1"

    if [[ -z "$plugin" ]]; then
        echo "No plugin specified."
        return 1
    fi

    install_require_repository_cache || return 1

    index_guard_ensure
    state_guard_ensure

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

    if install_executor_run "$plugin"; then
        state_update_install \
            "$plugin" \
            "$(install_resolver_version "$plugin")"
    fi
}
