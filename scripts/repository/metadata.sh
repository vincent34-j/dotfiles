#!/usr/bin/env bash

repository_metadata_file() {
    local repo="$1"

    printf "%s/%s/metadata.db\n" \
        "$(repository_cache_root)" \
        "$repo"
}

repository_metadata_exists() {
    local repo="$1"

    [[ -f "$(repository_metadata_file "$repo")" ]]
}

repository_metadata_write() {
    local repo="$1"
    local key="$2"
    local value="$3"

    local file
    file="$(repository_metadata_file "$repo")"

    mkdir -p "$(dirname "$file")"

    if grep -q "^${key}=" "$file" 2>/dev/null; then
        sed -i "s|^${key}=.*|${key}=${value}|" "$file"
    else
        printf "%s=%s\n" "$key" "$value" >> "$file"
    fi
}

repository_metadata_read() {
    local repo="$1"
    local key="$2"

    local file
    file="$(repository_metadata_file "$repo")"

    grep "^${key}=" "$file" 2>/dev/null | cut -d= -f2-
}
