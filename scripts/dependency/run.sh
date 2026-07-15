#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${SCRIPT_DIR}/dependency/installer.sh"

dependency_run() {

    while IFS= read -r dependency; do

        [[ -z "$dependency" ]] && continue

        dependency_installer_run "$dependency"

    done
}
