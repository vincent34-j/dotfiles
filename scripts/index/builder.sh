#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/database.sh"

index_builder_append() {
    local name="$1"
    local version="$2"
    local repository="$3"
    local description="$4"
    local dependencies="$5"

    index_db_append \
"${name}|${version}|${repository}|${description}|${dependencies}"
}
