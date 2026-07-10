#!/usr/bin/env bash

check_command() {
    local cmd="$1"
    local name="$2"

    if command -v "${cmd}" >/dev/null 2>&1; then
        pass "${name}"
        return 0
    fi

    fail "${name}"
    return 0
}

check_command_version() {
    local cmd="$1"
    local name="$2"

    if command -v "${cmd}" >/dev/null 2>&1; then
        local version

        version="$("${cmd}" --version 2>/dev/null | head -n1 || true)"

        if [[ -z "${version}" ]]; then
            version="$("${cmd}" -v 2>/dev/null | head -n1 || true)"
        fi

        if [[ -z "${version}" ]]; then
            version="$("${cmd}" version 2>/dev/null | head -n1 || true)"
        fi

        if [[ -n "${version}" ]]; then
            pass "${name} (${version})"
        else
            pass "${name}"
        fi

        return 0
    fi

    fail "${name}"
    return 0
}
