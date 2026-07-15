#!/usr/bin/env bash

index_query_all() {
    index_db_read
}

index_query_count() {
    index_db_read | wc -l
}

index_query_find() {
    local plugin="$1"

    local line

    while IFS= read -r line; do

        IFS='|' read -r \
            name \
            version \
            repository \
            description \
            dependencies <<< "$line"

        if [[ "$name" == "$plugin" ]]; then
            printf "%s|%s|%s|%s|%s\n" \
                "$name" \
                "$version" \
                "$repository" \
                "$description" \
                "$dependencies"
            return 0
        fi

    done < <(index_db_read)

    return 1
}

index_query_exists() {
    local plugin="$1"

    index_query_find "$plugin" >/dev/null
}

index_query_version() {
    local plugin="$1"

    local record

    record="$(index_query_find "$plugin")" || return 1

    IFS='|' read -r \
        _ \
        version \
        _ \
        _ \
        _ <<< "$record"

    printf "%s\n" "$version"
}

index_query_description() {
    local plugin="$1"

    local record

    record="$(index_query_find "$plugin")" || return 1

    IFS='|' read -r \
        _ \
        _ \
        _ \
        description \
        _ <<< "$record"

    printf "%s\n" "$description"
}

index_query_repository() {
    local plugin="$1"

    local record

    record="$(index_query_find "$plugin")" || return 1

    IFS='|' read -r \
        _ \
        _ \
        repository \
        _ \
        _ <<< "$record"

    printf "%s\n" "$repository"
}

index_query_dependencies() {
    local plugin="$1"

    local record

    record="$(index_query_find "$plugin")" || return 1

    IFS='|' read -r \
        _ \
        _ \
        _ \
        _ \
        dependencies <<< "$record"

    printf "%s\n" "$dependencies"
}
