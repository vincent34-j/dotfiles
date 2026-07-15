#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/runtime.sh"
source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/index/query.sh"

install_resolver_exists() {
    local plugin="$1"

    index_query_exists "$plugin"
}

install_resolver_version() {
    local plugin="$1"

    index_query_version "$plugin"
}

install_resolver_description() {
    local plugin="$1"

    index_query_description "$plugin"
}

install_resolver_repository() {
    local plugin="$1"

    index_query_repository "$plugin"
}

install_resolver_dependencies() {
    local plugin="$1"

    index_query_dependencies "$plugin"
}
