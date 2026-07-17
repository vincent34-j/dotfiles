#!/usr/bin/env bash

if [[ -n "${CREATOR_CONFIG_LOADED:-}" ]]; then
    return 0
fi

readonly CREATOR_CONFIG_LOADED=1

CONFIG_DIR="${PROJECT_ROOT}/creator"
readonly CONFIG_DIR

config_file() {
    local plugin="$1"

    printf "%s/%s.conf\n" \
        "${CONFIG_DIR}" \
        "${plugin}"
}

config_exists() {
    local plugin="$1"

    [[ -f "$(config_file "${plugin}")" ]]
}

config_load() {
    local plugin="$1"

    config_exists "${plugin}"
}

config_get() {
    local plugin="$1"
    local key="$2"
    local default="${3:-}"

    local file
    file="$(config_file "${plugin}")"

    if [[ ! -f "${file}" ]]; then
        printf '%s\n' "${default}"
        return
    fi

    local value

    value="$(
        awk -F= -v search="${key}" '
            $1 == search {
                print $2
                exit
            }
        ' "${file}"
    )"

    if [[ -n "${value}" ]]; then
        printf '%s\n' "${value}"
    else
        printf '%s\n' "${default}"
    fi
}
