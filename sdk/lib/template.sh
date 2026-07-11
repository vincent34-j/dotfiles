#!/usr/bin/env bash

template_render() {
    local file="$1"

    shift

    local content
    content="$(cat "${file}")"

    local pair
    for pair in "$@"; do
        local key="${pair%%=*}"
        local value="${pair#*=}"

        content="${content//\{\{$key\}\}/$value}"
    done

    printf "%s" "${content}"
}

