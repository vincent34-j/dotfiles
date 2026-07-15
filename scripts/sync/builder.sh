#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/index/database.sh"
source "${SCRIPT_DIR}/index/builder.sh"

source "${SCRIPT_DIR}/sync/repositories.sh"
source "${SCRIPT_DIR}/plugin/runtime.sh"
source "${SCRIPT_DIR}/plugin/discovery.sh"
source "${SCRIPT_DIR}/plugin/parser.sh"
source "${SCRIPT_DIR}/plugin/metadata.sh"

sync_builder_plugin() {
    local plugin_root="$1"

    plugin_load "$plugin_root"

    index_builder_append \
        "$(plugin_name)" \
        "$(plugin_version)" \
        repository \
        "$(plugin_description)" \
        "$(plugin_dependencies)"
}

sync_builder_run() {
        local repository

    index_db_init

        while IFS= read -r repository; do

        if ! repository_is_cloned "$repository"; then
        continue
    fi

        local root
            root="$(repository_worktree "$repository")"
        while IFS= read -r plugin; do
            sync_builder_plugin "$plugin"
        done < <(
            plugin_discovery_find "$root"
        )

    done < <(
        sync_repositories_enabled
    )
}
