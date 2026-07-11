#!/usr/bin/env bash

declare -A VISITED_PLUGINS=()

resolve_dependencies() {
    local plugin="$1"

    if [[ -n "${VISITED_PLUGINS[$plugin]:-}" ]]; then
        return 0
    fi

    VISITED_PLUGINS["$plugin"]=1

    local deps
    deps="$(registry_get_dependencies "${plugin}")"

    local dep

    for dep in ${deps}; do
        [[ -z "${dep}" ]] && continue

        resolve_dependencies "${dep}"
    done

    printf '%s\n' "${plugin}"
}

resolve_plugin() {
    local plugin="$1"

    VISITED_PLUGINS=()

    resolve_dependencies "${plugin}"
}
