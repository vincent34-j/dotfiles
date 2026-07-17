#!/usr/bin/env bash

run_hook() {
    local hook_name="$1"

    local hook_dir
    hook_dir="${PROJECT_ROOT}/hooks/${hook_name//_/-}"

    [[ -d "${hook_dir}" ]] || return 0

    local hook

    for hook in "${hook_dir}"/*.sh; do
        [[ -f "${hook}" ]] || continue

        bash "${hook}"
    done
}
