#!/usr/bin/env bash

test_create_repository() {
    local name="$1"

    local root="${PROJECT_ROOT}/cache/repositories/${name}"

    rm -rf "$root"

    mkdir -p "$root"

    git -C "$root" init -q

    printf "%s\n" "$root"
}

test_create_plugin() {
    local repository="$1"
    local plugin="$2"
    local version="$3"
    local description="$4"

    local root="${PROJECT_ROOT}/cache/repositories/${repository}/${plugin}"

    mkdir -p "$root"

    cat >"${root}/plugin.manifest" <<EOF
PLUGIN_NAME="${plugin}"
PLUGIN_VERSION="${version}"
PLUGIN_DESCRIPTION="${description}"
EOF
}

