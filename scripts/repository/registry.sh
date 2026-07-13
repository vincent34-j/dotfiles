#!/usr/bin/env bash

declare -A REPOSITORY_URLS=()
declare -A REPOSITORY_DESCRIPTIONS=()
declare -A REPOSITORY_BRANCHES=()
declare -A REPOSITORY_PRIORITIES=()
declare -A REPOSITORY_ENABLED=()

repository_register() {
    local name="$1"
    local url="$2"
    local description="$3"
    local branch="$4"
    local priority="$5"
    local enabled="$6"

    REPOSITORY_URLS["$name"]="$url"
    REPOSITORY_DESCRIPTIONS["$name"]="$description"
    REPOSITORY_BRANCHES["$name"]="$branch"
    REPOSITORY_PRIORITIES["$name"]="$priority"
    REPOSITORY_ENABLED["$name"]="$enabled"
}

repository_has() {
    local name="$1"

    [[ -n "${REPOSITORY_URLS[$name]:-}" ]]
}

repository_get_url() {
    printf '%s\n' "${REPOSITORY_URLS[$1]}"
}

repository_get_description() {
    printf '%s\n' "${REPOSITORY_DESCRIPTIONS[$1]}"
}

repository_get_branch() {
    printf '%s\n' "${REPOSITORY_BRANCHES[$1]}"
}

repository_get_priority() {
    printf '%s\n' "${REPOSITORY_PRIORITIES[$1]}"
}

repository_get_enabled() {
    printf '%s\n' "${REPOSITORY_ENABLED[$1]}"
}

repository_list() {
    printf '%s\n' "${!REPOSITORY_URLS[@]}" | sort
}

repository_count() {
    printf '%s\n' "${#REPOSITORY_URLS[@]}"
}
