#!/usr/bin/env bash

if [[ -n "${CREATOR_CONFIG_LOADED:-}" ]]; then
    return 0
fi

readonly CREATOR_CONFIG_LOADED=1

CONFIG_DIR="${PROJECT_ROOT}/creator"
readonly CONFIG_DIR

USER_CONFIG_DIR="${HOME}/.config/creator"
readonly USER_CONFIG_DIR

config_file() {
    local plugin="$1"

    printf "%s/%s.conf\n" \
        "${CONFIG_DIR}" \
        "${plugin}"
}

user_config_file() {
    local plugin="$1"

    printf "%s/%s.conf\n" \
        "${USER_CONFIG_DIR}" \
        "${plugin}"
}

user_config_exists() {
    local plugin="$1"

    [[ -f "$(user_config_file "${plugin}")" ]]
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

    local value

    if user_config_exists "${plugin}"; then
        value="$(
            awk -F= -v search="${key}" '
                $1 == search {
                    print $2
                    exit
                }
            ' "$(user_config_file "${plugin}")"
        )"

        if [[ -n "${value}" ]]; then
            printf '%s\n' "${value}"
            return
        fi
    fi

    if config_exists "${plugin}"; then
        value="$(
            awk -F= -v search="${key}" '
                $1 == search {
                    print $2
                    exit
                }
            ' "$(config_file "${plugin}")"
        )"

        if [[ -n "${value}" ]]; then
            printf '%s\n' "${value}"
            return
        fi
    fi

    printf '%s\n' "${default}"
}
